This page is the practical on-ramp for implementing RTQ: the minimum you must support, how RTQ is exchanged over each channel, and how to migrate from PDF/email exchanges without disrupting current operations.

### Getting Started: Minimum Conformance Recipe

The smallest useful RTQ implementation is deliberately simple. To participate in an RTQ exchange you need to produce or consume two files.

**To act as a regulator (issue questions), produce an [RTQ Questionnaire](StructureDefinition-rtq-questionnaire.html) with:**

1. `meta.profile` set to the RTQ Questionnaire profile URL
2. A regulator-assigned identifier for the question set, and a business `version` (e.g., `1.0`)
3. `status` (`active`), `date` issued, and the response due date (`rtq-due-date` extension)
4. A `code` giving the questionnaire type (e.g., `list-of-questions`) and `subjectType` (e.g., `MedicinalProductDefinition`)
5. Two contacts — sender (regulator) and receiver (MAH) — each with the contact-purpose extension, a name, email, and phone
6. One `item` per question, each with: a unique `linkId`, at least one CTD section code, `required = true`, and the question text (with the `rendering-xhtml` extension for rich formatting)
7. A narrative `text` summarizing the question set (this doubles as the cover letter)

**To act as a company (respond), produce an [RTQ QuestionnaireResponse](StructureDefinition-rtq-questionnaireresponse.html) with:**

1. `meta.profile` set to the RTQ QuestionnaireResponse profile URL
2. **Both** identifiers: your company-assigned identifier for the response, and the regulator's identifier copied from the question set
3. The canonical `questionnaire` reference to the question set being answered
4. `status` (`completed`), `authored` date, `author` (the regulator organization) and `source` (your organization), and a response business version (`rtq-response-version` extension)
5. **One response item for every question**, matched by `linkId` — no exceptions. Where no substantive answer applies, answer explicitly (e.g., *"No response required."*) or cross-reference another answer or document. A question left without a response item makes the response invalid.
6. A narrative `text` overview (the response cover letter)

Everything else — product/authorisation context, procedure identifier, categories, attachments, referenced FHIR resources — is optional and additive. Start minimal, then adopt the context extensions as your systems mature; they are what unlock automatic matching in receiving systems.

### Exchange Methods

RTQ is a document standard: the file travels over any channel the two parties already use. The flows below are illustrative, not normative.

**Email (simplest — works today)**

```
Regulator                                MAH/Applicant
    |  1. author Questionnaire (XML/JSON)     |
    |---------------- email ----------------->|
    |                                         | 2. validate, ingest, route by CTD codes
    |                                         | 3. author QuestionnaireResponse
    |<--------------- email ------------------|
    |  4. validate, match by linkId           |
```

**Regulatory portal / eCTD**

```
Regulator                 Portal / Gateway                MAH/Applicant
    |  1. publish Questionnaire  |                            |
    |--------------------------->|---- download/notify ------>|
    |                            |                            | 2. prepare response
    |                            |<-- upload response file ---|   (optionally inside an
    |<---- retrieve response ----|                            |    eCTD sequence)
```

**API via APIX (target end-state)**

```
Regulator system                                   MAH system
    |  1. POST APIX Task { payload: RTQ Questionnaire } |
    |-------------------------------------------------->|
    |                       2. Task state: received      |
    |                       3. Task state: in-progress   |
    |  4. POST APIX Task { payload: RTQ Response }       |
    |<--------------------------------------------------|
```

In every flow the RTQ content is byte-for-byte the same; only the envelope changes. A regulator can send by email while the receiving company processes by API-grade automation — each side modernizes at its own pace.

### Migration & Hybrid Operation

Moving from PDF/email to RTQ does not require a big-bang cutover. Recommended path:

1. **Phase 0 — parallel rendering.** Continue the current process; generate the RTQ file alongside the PDF and send both. The counterpart can ignore the RTQ file until ready. (An RTQ resource renders to a human-readable document — see the [interactive examples](examples/sample-question.html) — so nothing is lost for manual readers.)
2. **Phase 1 — structured intake.** The receiving side starts parsing the RTQ file for automated logging, routing, and tracking, while humans still read the rendered version. Value begins accruing here even if the other party never changes anything.
3. **Phase 2 — structured authoring.** Questions/responses are authored in structured form and the PDF becomes the derived artifact (or is dropped where the counterpart accepts RTQ alone).
4. **Phase 3 — API exchange.** Where both parties support APIX, the exchange becomes fully automated.

**Hybrid operation is normal, not an edge case.** Expect years in which one authority accepts RTQ by portal, another wants PDF by email, and a third supports APIX. Because RTQ separates content from transport, one internal process can serve all three: author structured, render and deliver per counterpart capability. Where a local health authority has no portal or API ready, the RTQ file simply travels by the same email route the PDF used — there is no gap to remedy, and simple exchanges (clarifications answered by email or in a meeting) stay simple.

### Attachments and Dataset Sizes

Follow the baseline in [How It Works](how-it-works.html#attachments--large-documents): embed attachments up to about 10 MB (`attachment.data`); reference larger content by URL (`attachment.url`) in a repository accessible to both parties. For very large technical datasets (e.g., full stability datasets, analytical validation packages), referencing is strongly preferred, and where content is held in federated systems, the URL should resolve through the parties' agreed access mechanism. CMC and Manufacturing SMEs are invited to contribute real-world reference content to stress-test this guidance.

### Extending the Terminology

The CTD category CodeSystem covers the CTD hierarchy at section level. If your organization needs finer granularity (or additional regulatory topics), do not create local codes in isolation — open a request (via the [project page](https://confluence.hl7.org/spaces/BRR/pages/358267438/Response+to+Health+Authority+Questions+RTQ) or a [GitHub issue](https://github.com/HL7/rtq-ig/issues)) and the project will extend the shared CodeSystem so all implementers benefit. The same applies to question categories and questionnaire types. See [Terminology](terminology.html).

### Notes for RIM Vendors

The vendor integration model — inbound matching, response assembly, status mapping, and the boundary between RTQ data and vendor-internal workflow — is described on the [Architecture](architecture.html) page.
