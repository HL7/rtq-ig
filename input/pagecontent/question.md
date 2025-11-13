The Regulatory Questionnaire profile defines a structured, machine-readable format for regulatory questions issued by a health authority (e.g., EMA, FDA) to a marketing authorization holder (MAH) during the review of a regulatory submission such as a Type II Variation, NDA, or MAA.

This resource enables automated routing, tracking, and response management while preserving rich formatting, organizational context, and traceability to the Common Technical Document (CTD) structure.

---

### Purpose & Business Value

- **Standardized Communication**: Eliminates ambiguity in question format across agencies and sponsors
- **Automated Workflow**: Enables integration with structured authoring systems, regulatory information management systems, document management platforms, atuomation, and AI agents
- **Audit Trail**: Full traceability of sender, recipient, deadlines, and coded categorization of each question
- **Rich Text Support**: Preserves bold, hyperlinks, tables, images, and formatting from standard structured authoring tools
- **Global Interoperability**: Aligns with ICH, HL7 FHIR, and IDMP standards

---

### Key Elements of a Regulatory Question

<table border="1" style="border-collapse: collapse; width: 100%; border-color: #ddd;">
  <thead style="background-color: #f5f5f5;">
    <tr>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Element</th>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Purpose</th>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Example</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>identifier</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">Unique IDs for the question set and regulatory procedure</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>ID001</code>, <code>EMEA/H/C/005432/II/0023</code></td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>title</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">Human-readable summary of the question set</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>Responses to Question Set ID001</code></td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>effectivePeriod</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">Deadline for sponsor response</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>2025-11-11</code> to <code>2025-12-11</code></td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>contact</code> (SENDER)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Issuing health authority with full organizational context</td>
      <td style="padding: 8px; border: 1px solid #ddd;">EMA, Dr. Jane Doe, Amsterdam HQ</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>contact</code> (RECIPIENT)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">MAH responsible for response</td>
      <td style="padding: 8px; border: 1px solid #ddd;">SynthPharma AG, Dr. John Doe, Basel</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>contact-signature</code> extension</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Email-style signature block with name, title, org, and contact info</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Preserves official formatting</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.linkId</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">Unique question identifier within the set</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>cmc-1-DP-Stability</code></td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.code</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">CTD section mapping (hierarchical)</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>3.2.P.8</code> to <code>3.2.P.8.1 Stability Summary</code></td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.text</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">The regulatory question in rich text (XHTML)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Includes bold, links, paragraphs, tables, images, and references</td>
    </tr>
  </tbody>
</table>

---
### Example Use Case: EMA Type II Variation

**Scenario**: EMA issues 10 questions on stability and labeling during review of a shelf-life extension.

With this profile:
- Questions are machine-readable
- Each maps to CTD section (e.g., `3.2.P.8.1`)
- Sponsor system auto-routes to CMC and labeling teams
- Response deadline is enforced
- Full audit trail from EMA to MAH

---
### HTML presentation example

The following is a HTML rendering of a FHIR Questionnaire with synthetic Quality: <a href="questionex1.md">Sample question from a regulator to a market authorization</a>

---

### How to Use This Profile

- Health Authority: Generate Questionnaire from review tool; include rich text and CTD codes
- MAH (Sponsor): Import into RIM system; assign owners; link responses via `QuestionnaireResponse`
- Vendors: Support structured authoring of the question and export to a FHIR-compliant XML or JSON file for submission via email or portal; or incorporate into a `Task` resource for submission via API [Refer to APIX IG for details](https://build.fhir.org/ig/HL7/APIX---API-Exchange-for-Medicinal-Products/branches/main/index.html)

---

### Related Resources

- [Questionnaire Response Structure](https://build.fhir.org/ig/HL7/rtq-ig/branches/main/response.html) – For an overview of the question response.
- [CTD Section Code System](https://build.fhir.org/ig/HL7/rtq-ig/branches/main/CodeSystem-ctd-categories-full.html) – Full hierarchy
- [Contact Purpose Code System](https://build.fhir.org/ig/HL7/rtq-ig/branches/main/CodeSystem-contact-purpose.html) – SENDER / RECIPIENT