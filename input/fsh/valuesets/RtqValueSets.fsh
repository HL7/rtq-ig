ValueSet: RtqQuestionnaireTypeVS
Id: rtq-questionnaire-type-vs
Title: "RTQ Questionnaire Type Value Set"
Description: "Types of regulatory questionnaires exchanged between industry and health authorities. Used on Questionnaire.code to classify the question set (the regulatory template it represents)."
* ^url = "http://hl7.org/fhir/uv/rtq/ValueSet/rtq-questionnaire-type-vs"
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-08-08"
* include codes from system RtqQuestionnaireTypeCS

ValueSet: RtqQuestionCategoryVS
Id: rtq-question-category-vs
Title: "RTQ Question Category Value Set"
Description: "Categories classifying the regulatory significance of a question (e.g., major objection, minor concern, commitment). Carried as an additional item.code coding alongside the mandatory CTD section code."
* ^url = "http://hl7.org/fhir/uv/rtq/ValueSet/rtq-question-category-vs"
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-08-08"
* include codes from system RtqQuestionCategoryCS

ValueSet: RtqContactPurposeVS
Id: rtq-contact-purpose-vs
Title: "RTQ Contact Purpose Value Set"
Description: "Roles of a contact in regulatory correspondence, used to distinguish the sender and receiver contact slices on the RTQ Questionnaire."
* ^url = "http://hl7.org/fhir/uv/rtq/ValueSet/rtq-contact-purpose-vs"
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-08-08"
* include codes from system ContactPurpose
