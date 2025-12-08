This example demonstrates a **synthetic regulatory questionnaire response** submitted by a marketing authorization holder (MAH) during a **Type II variation procedure**, using FHIR R5 **QuestionnaireResponse** resources for structured, machine-readable exchange.

**FHIR Integration Highlights**
* Each answer maps to a `QuestionnaireResponse.item` with a `linkId` matching the original question (e.g., `"admin-1"`).
* The response links to the original `Questionnaire` and includes submission timestamp (`authored`).
* Supports rich text answers, updated ePI translations, new stability data, and ICH/WHO climatic zone confirmation.
[View the underlying FHIR QuestionnaireResponse resource](QuestionnaireResponse-questionnaireresponse-ID001.html).

{% include questionnaire-response-id001-response-fragment.html %}