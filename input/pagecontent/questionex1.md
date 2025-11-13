This example demonstrates a synthetic regulatory questionnaire issued during a Type II variation procedure, using FHIR R5 **Questionnaire** resources for structured, machine-readable exchange.

**FHIR Integration Highlights**

* Each question maps to a `Questionnaire.item` with a `linkId` (e.g., `"1"`).
* Responses are captured in a `QuestionnaireResponse` resource (due 2025-12-11).
* Supports multilingual ePI updates, stability data, and ICH/WHO zone alignment.

[View the underlying FHIR Questionnaire resource](https://github.com/HL7/rtq-ig/blob/333ec32aea8ef989ed4c655f5916dda4132f12d8/input/examples/Questionnaire-RegulatoryQA-ID001.xml) (generated via FSH).

{% include questionex1-fragment.html %}

