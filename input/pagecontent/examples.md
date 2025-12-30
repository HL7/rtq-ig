This page provides an index of the technical examples for the Regulatory Questionnaire (RTQ) standard. These examples illustrate the end-to-end loop of a regulatory Q&A procedure.

---

### Phase 1: The Regulatory Question
**Issuer:** Regulator (e.g., EMA, FDA)  
**Resource:** `Questionnaire`  
**Scenario:** A regulator issues a formal "List of Questions" (LOQ) during a Type II variation assessment.

*   **[Technical Profile & High-Fidelity Example](question.html)**: View the profile structure alongside a standalone "Modern SaaS" dashboard rendition of the question.
*   **[Raw FHIR Resource](Questionnaire-questionnaire-ID001.html)**: View the underlying machine-readable JSON/XML.

---

### Phase 2: The Regulatory Response
**Issuer:** Marketing Authorization Holder (MAH)  
**Resource:** `QuestionnaireResponse`  
**Scenario:** The MAH submits structured answers, supporting evidence, and updated ePI translations back to the regulator.

*   **[Technical Profile & High-Fidelity Example](response.html)**: View the profile structure alongside a standalone "Modern SaaS" dashboard rendition of the formatted response.
*   **[Raw FHIR Resource](Questionnaire-questionnaireresponse-ID001.html)**: View the underlying machine-readable JSON/XML.

---

### Navigation Tip
Each technical page now includes **"Integration Highlights"** that describe how FHIR elements (like `linkId`, `extensions`, and `attachments`) are used in practical regulatory scenarios.