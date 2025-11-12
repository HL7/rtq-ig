### Overview

The Response to Question (RTQ) Implementation Guide provides a standardized, FHIR R5-based framework for the exchange of formal questions from health authorities to sponsors/applicants and structured responses in return, using only the `Questionnaire` and `QuestionnaireResponse` resources.

This IG enables:

- **Health Authority Questions**: Structured, uniquely identified questionnaires issued during regulatory review of medicinal product applications.
- **Sponsor Responses**: Complete, traceable answers submitted via `QuestionnaireResponse`, with support for evidence, references, and attachments.
- **Regulatory Traceability**: Direct linkage between each question item and its corresponding response, ensuring auditability and compliance.

Built exclusively on HL7 FHIR R5 `Questionnaire` and `QuestionnaireResponse`, RTQ ensures semantic precision, regulatory alignment, and seamless integration within life sciences and healthcare information systems.

### Scope

- Profiling of `Questionnaire` for health authority question sets
- Profiling of `QuestionnaireResponse` for sponsor replies
- Extension definitions for regulatory metadata (e.g., question ID, due date, response status, submission context)
- Item-level guidance on structure, coding, and linkage
- Example `Questionnaire`/`QuestionnaireResponse` pairs for typical regulatory scenarios

### Out of Scope

- Use of any FHIR resources other than `Questionnaire` and `QuestionnaireResponse`
- Full submission packaging, gateway protocols, or exchange of the question and response (refer to the APIX for medicinal products Implementation Guide)
- Long-term document archiving

### Background

In biopharmaceutical regulatory affairs, health authorities routinely issue formal questions to sponsors during the review of marketing authorization applications, variations, and other submissions for medicinal products. These questions are exchanged as Word or PDF via email, portals, or unstructured documents, leading to challenges related to high manual effort, low capacity, limited traceability and searchability.

The absence of a standardized digital format hinders automation, such as question triage, duplicate detection, and analytics on regulatory trends. This Implementation Guide addresses these gaps by leveraging FHIR R5's `Questionnaire` and `QuestionnaireResponse` resources to model questions as reusable, itemized templates and responses as linked, versioned instances.

By enabling machine-readable Q&A, RTQ facilitates efficient lifecycle management, cross-authority harmonization, and data-driven insights into review patterns.

### Key Use Cases

1. **Regulatory Clarification Requests**  
   Health authorities issue a `Questionnaire` with categorized, versioned questions; sponsors reply using a linked `QuestionnaireResponse`.

2. **Automated Question Intake and Triage**  
   Enable systems to automatically receive incoming `Questionnaire` instances, parse and categorize individual questions (e.g., by therapeutic area, submission type, or data domain), and determine whether a question has been previously asked using structured identifiers, text similarity, or coded metadata.

3. **Structured Question Repository and Analytics**  
   Create a searchable, versioned repository of `Questionnaire` and `QuestionnaireResponse` instances to support advanced search, trend analysis, data mining, and predictive analytics on regulatory interactions (e.g., identifying frequently asked question patterns or forecasting review timelines).

4. **Cross-Authority Reuse**  
   Standardized `Questionnaire` templates enable consistent questioning across regions and facilitate harmonized response strategies.

5. **Operational Efficiency and Capacity Expansion**  
   Reduce manual effort in question handling and response preparation for sponsors, enabling biopharmaceutical companies to manage and file more simultaneous regulatory applications. For health authorities, streamlined processing reduces administrative burden and increases capacity to handle growing volumes of submissions and review activities.

### Target Audience

- Regulatory affairs teams in biopharmaceutical organizations
- Health authority question coordinators and reviewers
- IT system architects building regulatory exchange platforms
- FHIR implementers in life sciences
