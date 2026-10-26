This page describes how the RTQ resources relate to each other and to the wider FHIR R5 regulatory ecosystem. It is written for system architects and RIM vendors designing data models and integration logic around RTQ.

### Resource Relationship Diagram

<div style="text-align: center; margin: 24px 0;">
  <img src="rtq-architecture.svg" alt="Diagram showing RTQ Questionnaire and QuestionnaireResponse linked by a canonical reference, with links to RTQ DocumentReference for attachments, and dashed context links to MedicinalProductDefinition, RegulatedAuthorization, ePI content, and the regulatory procedure identifier. A transport band shows email, portal, eCTD, central platform and APIX as interchangeable channels." style="max-width: 960px; width: 100%;"/>
</div>

The core exchange is a pair: an **RTQ Questionnaire** (the question set, issued by the regulator) and an **RTQ QuestionnaireResponse** (the response set, returned by the MAH/applicant). The response points at its question set through the canonical `questionnaire` element, and each response item matches its question by `linkId` — so traceability exists both at question-set level and per individual question. **RTQ DocumentReference** carries supporting documents on either side. Commitments are flagged inside the pair itself (a `commitment` category code on the question, the `rtq-commitment` extension on the answer); tracking them afterwards is left to applications (see [Lifecycle & Versioning](lifecycle.html#commitments-and-follow-up-measures)).

### Regulatory Context: Product, Registration, Procedure

A regulatory question is inherently *about* something: a product, a marketing authorisation, and a procedure. RTQ v0.2.0 makes this context explicit so that a receiving RIM system can automatically associate an inbound question set with the correct records — no manual matching step:

<table border="1" style="border-collapse: collapse; width: 100%; border-color: #ddd;">
  <thead style="background-color: #f5f5f5;">
    <tr>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Context</th>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Mechanism</th>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>Medicinal product</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>rtq-regulated-context</code> extension, <code>product</code> sub-extension</td>
      <td style="padding: 8px; border: 1px solid #ddd;">A <code>Reference(MedicinalProductDefinition)</code> for parties with FHIR product registries, or an <code>Identifier</code> (e.g., MPID, local product code) for parties without. Also natively available on the response via <code>QuestionnaireResponse.subject</code>.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>Marketing authorisation / registration</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>rtq-regulated-context</code> extension, <code>authorization</code> sub-extension</td>
      <td style="padding: 8px; border: 1px solid #ddd;">A <code>Reference(RegulatedAuthorization)</code> or an <code>Identifier</code> (e.g., MA number).</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>Regulatory procedure instance</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>rtq-procedure-identifier</code> extension</td>
      <td style="padding: 8px; border: 1px solid #ddd;">The <strong>regulator-assigned procedure number</strong> (e.g., <code>NRA/H/C/005432/II/0023</code>), eCTD sequence, or national case number. The regulator assigns it; the company echoes it on the response. The <code>subjectType</code>/<code>code</code> elements convey the procedure <em>type</em>; this extension identifies the procedure <em>instance</em>.</td>
    </tr>
  </tbody>
</table>

All context links are optional so that simple exchanges stay simple, but they are Must-Support: systems that have the context are expected to populate it, and receiving systems are expected to use it when present.

### Relationship to Other Standards

<table border="1" style="border-collapse: collapse; width: 100%; border-color: #ddd;">
  <thead style="background-color: #f5f5f5;">
    <tr>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Standard</th>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Relationship to RTQ</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>APIX</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;">The API-based transport option: RTQ files are exchanged via APIX-defined APIs, carried inside an APIX Task. See the integration boundary below.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>eCTD</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;">An RTQ response file can be placed inside an eCTD sequence and submitted to a regulator through the normal submission route.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>ePI</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;">Questions about product information can reference ePI content directly — the whole ePI <code>Bundle</code> or specific resources (<code>Composition</code>, <code>MedicinalProductDefinition</code>) by id — through the item reference extension or answer references.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>PQI (Product Quality Information)</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;">The RTQ project collaborates with the HL7 PQI project so that quality/CMC response content can move from binary attachments toward structured data sets over time.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>IDMP / SPOR</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;">No direct use case identified so far. IDMP-style identifiers (e.g., MPID) can already be carried in the product context extension as Identifiers; deeper integration will be revisited as use cases emerge.</td>
    </tr>
  </tbody>
</table>

### The RTQ / APIX Integration Boundary

RTQ and [APIX](https://build.fhir.org/ig/HL7/APIX---API-Exchange-for-Medicinal-Products/branches/main/index.html) divide the work cleanly:

- **RTQ defines the payload** — the structure and content of the question set and the response set. Everything on this guide's pages is about *what* is exchanged.
- **APIX defines one transport** — *how* the payload moves between systems when both parties support APIs. In the APIX model, an APIX `Task` wraps the exchange: the RTQ Questionnaire (or QuestionnaireResponse) is the Task's payload, and APIX conveys workflow state (sent, received, in progress) around it.

At the point of receipt over APIX, the receiving system obtains the RTQ resource from the APIX Task and processes it exactly as it would process the same file received by email or portal — the RTQ content, including its procedure identifier and product context, is identical regardless of channel. That is the handoff: everything inside the RTQ resource is specified here; everything about the Task wrapper, API operations, and delivery state is specified in the APIX IG.

### Guidance for RIM System Vendors

For vendors integrating RTQ into Regulatory Information Management systems, the intended integration model is:

1. **Inbound question ingestion:** receive the RTQ Questionnaire (any channel); use `rtq-regulated-context` and `rtq-procedure-identifier` to auto-match the question set to the product, registration, and submission/procedure records; use `item.code` category codes (e.g., CTD sections) to route each question to module owners; use the category codes to prioritize (e.g., major objections first) and to flag requested commitments; on outbound responses, set `rtq-commitment` on any answer that offers one.
2. **Outbound response assembly:** create the QuestionnaireResponse against the received Questionnaire (one response item per question — this is mandatory), attach supporting documents via RTQ DocumentReference, set the company identifier and response version, and echo the regulator identifier and procedure identifier for traceability.
3. **Status management:** track the response through `in-progress` → `completed`, and use `amended` for supplements; map these to your internal submission-activity states. The regulator's conclusion on each answer is not a response status: it arrives as an assessment outcome on each question in the follow-up question set (see [Lifecycle & Versioning](lifecycle.html#assessment-of-responses)).
4. **Boundary with internal workflow:** task assignment, review/approval chains, reminders, and dashboards are vendor-internal application features. RTQ deliberately stops at the data: everything your workflow needs (dates, categories, CTD codes, identifiers) is in the resources, but how you act on it is yours.

See [Implementation & Exchange](implementation.html) for the minimum conformance recipe and [Lifecycle & Versioning](lifecycle.html) for multi-round and amendment handling.
