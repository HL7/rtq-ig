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
Description: "Preferred category codes for a question: CTD section codes (topic) and RTQ regulatory significance codes (e.g., major objection, commitment). A question carries one or more category codes. Categories are regulator-defined: regulators may use their own code systems in addition to or instead of these, and product domains that do not use the CTD (e.g., medical devices, veterinary, OTC) use the terminology appropriate to that domain."
* ^url = "http://hl7.org/fhir/uv/rtq/ValueSet/rtq-question-category-vs"
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-10-25"
* include codes from system $ctd-categories-full
* include codes from system RtqQuestionCategoryCS

ValueSet: RtqAssessmentOutcomeVS
Id: rtq-assessment-outcome-vs
Title: "RTQ Assessment Outcome Value Set"
Description: "The regulator's assessment of the response to a question: resolved, not resolved, or raises further questions."
* ^url = "http://hl7.org/fhir/uv/rtq/ValueSet/rtq-assessment-outcome-vs"
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-10-25"
* include codes from system RtqAssessmentOutcomeCS

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
