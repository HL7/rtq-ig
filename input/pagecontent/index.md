The Response to Question (RTQ) Implementation Guide provides a standardized, FHIR R5-based framework for the exchange of formal questions from health authorities to sponsors/applicants and structured responses in return, using only the `Questionnaire` and `QuestionnaireResponse` resources.

This IG enables:
- **Health Authority Questions**: Structured, uniquely identified questionnaires issued during regulatory review of regulated product applications, including harmonized templates supporting initial marketing authorizations, variations, and post-authorization procedures.
- **Sponsor Responses**: Complete, traceable answers submitted via `QuestionnaireResponse`, with support for evidence, references, and attachments.
- **Regulatory Traceability**: Direct, item-level linkage between each question and its corresponding response, ensuring full auditability and compliance throughout the product lifecycle.

Built exclusively on HL7 FHIR R5 `Questionnaire` and `QuestionnaireResponse`, RTQ delivers semantic precision, regulatory alignment, and seamless integration within life sciences and healthcare information systems.

### Scope
- Profiling of `Questionnaire` for health authority question sets
- Profiling of `QuestionnaireResponse` for sponsor/applicant replies
- Extension definitions for regulatory metadata (e.g., question ID, due date, response status, submission context, procedure tracking)
- Item-level guidance on structure, coding, and linkage
- Example `Questionnaire`/`QuestionnaireResponse` pairs for typical regulatory scenarios, including initial marketing authorization applications, type I/II variations, and post-authorization commitments/fulfillments

### Out of Scope
- Use of any FHIR resources other than `Questionnaire` and `QuestionnaireResponse`
- Full submission packaging, gateway protocols, or exchange mechanisms for the question and response (refer to the [API for Exchange of Medicinal Product Information (APIX) Implementation Guide](https://build.fhir.org/ig/HL7/APIX---API-Exchange-for-Medicinal-Products/branches/main/index.html))
- Long-term document archiving

### Background
In biopharmaceutical regulatory affairs, health authorities routinely issue formal questions to sponsors during the review of marketing authorization applications, variations, and other submissions for medicinal products. These questions are traditionally exchanged as Word or PDF documents via email or portals, resulting in high manual effort, limited traceability, and poor searchability.

The absence of a standardized digital format hinders automation (e.g., question triage, duplicate detection) and prevents meaningful analytics on regulatory trends across procedures and authorities. This Implementation Guide addresses these gaps by leveraging FHIR R5 `Questionnaire` and `QuestionnaireResponse` resources to model questions as reusable, itemized templates and responses as versioned, machine-readable instances.

By enabling structured, machine-readable Q&A exchange, RTQ supports efficient lifecycle management, cross-authority harmonization, and data-driven insights into regulatory review patterns.

### Target Audience
- Regulatory affairs teams in biopharmaceutical organizations
- Health authority question coordinators, project managers, and reviewers
- IT system architects building regulatory exchange platforms
- Software vendors developing structured authoring tools and FHIR-compliant systems for regulators and life science companies