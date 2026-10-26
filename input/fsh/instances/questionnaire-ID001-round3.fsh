Instance: questionnaire-ID001-round3
InstanceOf: Questionnaire
Title: "Closing Question Set ID001-R3 (all questions resolved)"
Description: "Round 3 of the example thread. Every question, including the round-2 follow-up questions, is marked resolved, so this question set closes the dialogue: no response is expected and no due date is given. It also accepts the commitment offered on quality-4.2."
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2026-01-12T09:00:00Z"
* meta.profile = "http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-questionnaire"
* identifier[+].system = "http://hl7.org/fhir/uv/brr/identifier/qa-request"
* identifier[=].value = "ID001-R3"
* identifier[=].type = $rtq-identifier-type#regulator-id "Regulator-issued Identifier"
* extension[RtqProcedureIdentifierExtension].valueIdentifier.system = "https://example-nra.example.org/procedure-number"
* extension[RtqProcedureIdentifierExtension].valueIdentifier.value = "NRA/H/C/005432/II/0023"
* extension[RtqInResponseToExtension].valueReference = Reference(questionnaireresponse-ID001-round2)
* extension[RtqRegulatedContextExtension].extension[product].valueIdentifier.system = "https://example-nra.example.org/product-id"
* extension[RtqRegulatedContextExtension].extension[product].valueIdentifier.value = "MPID-EX-000123"
* extension[RtqRegulatedContextExtension].extension[authorization].valueIdentifier.system = "https://example-nra.example.org/marketing-authorisation-number"
* extension[RtqRegulatedContextExtension].extension[authorization].valueIdentifier.value = "NRA/H/C/005432"
* version = "1.0"
* name = "BRRRegulatoryQAQuestionnaireRound3"
* title = "Question Set ID001-R3"
* status = #active
* subjectType = #MedicinalProductDefinition
* code = $rtq-questionnaire-type-cs#list-of-questions "List of Questions"
* date = "2026-01-12"
* contact[+].extension[RtqContactPurposeExtension].valueCoding = $contact-purpose#SENDER "Sender (Health Authority)"
* contact[=].name = "National Regulatory Authority"
* contact[=].telecom[+].system = #email
* contact[=].telecom[=].value = "regulatory.contact@example-nra.example.org"
* contact[+].extension[RtqContactPurposeExtension].valueCoding = $contact-purpose#RECIPIENT "Recipient (Marketing Authorization Holder)"
* contact[=].name = "SynthPharma AG"
* contact[=].telecom[+].system = #email
* contact[=].telecom[=].value = "john.doe@synthpharma.example"
* contact[=].telecom[+].system = #phone
* contact[=].telecom[=].value = "+41-61-123-4567"

* item[+].linkId = "admin-1"
* item[=].code[+] = $ctd-categories-full#1.0 "1.0 Administrative Information"
* item[=].code[+] = $ctd-categories-full#1.1 "1.1 Application Form"
* item[=].code[+] = $rtq-assessment-outcome#resolved "Resolved"
* item[=].type = #question
* item[=].required = false
* item[=].text = "Is the fee for the Type II variation fully paid and documented?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Is the fee for the Type II variation fully paid and documented?</p></div>"

* item[+].linkId = "admin-2"
* item[=].code[+] = $ctd-categories-full#1.0 "Administrative Information"
* item[=].code[+] = $ctd-categories-full#1.1 "Application Form"
* item[=].code[+] = $rtq-assessment-outcome#resolved "Resolved"
* item[=].type = #question
* item[=].required = false
* item[=].text = "Are all required metadata fields in the application form complete?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Are all required metadata fields in the application form complete?</p></div>"

* item[+].linkId = "product-1"
* item[=].code[+] = $ctd-categories-full#1.3 "1.3 Product Information"
* item[=].code[+] = $ctd-categories-full#1.3.1 "SmPC, Labelling and Package Leaflet"
* item[=].code[+] = $rtq-assessment-outcome#resolved "Resolved"
* item[=].type = #question
* item[=].required = false
* item[=].text = "Do the updated storage conditions (2–8°C for 36 months) require additional patient guidance?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Do the updated storage conditions (2–8°C for 36 months) require additional patient guidance?</p></div>"

* item[+].linkId = "product-2"
* item[=].code[+] = $ctd-categories-full#1.3 "Product Information"
* item[=].code[+] = $ctd-categories-full#1.3.1 "SmPC, Labelling and Package Leaflet"
* item[=].code[+] = $rtq-assessment-outcome#resolved "Resolved"
* item[=].type = #question
* item[=].required = false
* item[=].text = "Is the patient leaflet revised to clarify the extended shelf life?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Is the patient leaflet revised to clarify the extended shelf life?</p></div>"

* item[+].linkId = "product-3"
* item[=].code[+] = $ctd-categories-full#1.3 "Product Information"
* item[=].code[+] = $ctd-categories-full#1.3.1 "SmPC, Labelling and Package Leaflet"
* item[=].code[+] = $rtq-question-category#minor-concern "Minor Concern"
* item[=].code[+] = $rtq-assessment-outcome#resolved "Resolved"
* item[=].type = #question
* item[=].required = false
* item[=].text = "Is the updated ePI text sufficiently clear for all applicable languages?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Is the updated ePI text sufficiently clear for all applicable languages?</p></div>"

* item[+].linkId = "quality-1"
* item[=].code[+] = $ctd-categories-full#3.2.P.8 "Stability"
* item[=].code[+] = $ctd-categories-full#3.2.P.8.1 "Stability Summary and Conclusion"
* item[=].code[+] = $rtq-assessment-outcome#resolved "Resolved"
* item[=].type = #question
* item[=].required = false
* item[=].text = "Are there any new stability studies conducted, or does the submission include only data from additional timepoints from previously submitted studies?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Are there any new stability studies conducted, or does the submission include only data from additional timepoints from previously submitted studies?</p></div>"

* item[+].linkId = "quality-2"
* item[=].code[+] = $ctd-categories-full#3.2.P.8 "Stability"
* item[=].code[+] = $ctd-categories-full#3.2.P.8.1 "Stability Summary and Conclusion"
* item[=].code[+] = $rtq-assessment-outcome#resolved "Resolved"
* item[=].type = #question
* item[=].required = false
* item[=].text = "Does the data support all intended climatic zones?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Does the data support all intended climatic zones?</p></div>"

* item[+].linkId = "quality-3"
* item[=].code[+] = $ctd-categories-full#3.2.P.5 "Control of Drug Product"
* item[=].code[+] = $ctd-categories-full#3.2.P.5.2 "Analytical Procedures"
* item[=].code[+] = $rtq-assessment-outcome#resolved "Resolved"
* item[=].type = #question
* item[=].required = false
* item[=].text = "Are the test methods used the same as in the previously submitted stability information?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Are the test methods used the same as in the previously submitted stability information?</p></div>"

* item[+].linkId = "quality-4"
* item[=].code[+] = $ctd-categories-full#3.2.P.5 "Control of Drug Product"
* item[=].code[+] = $ctd-categories-full#3.2.P.5.4 "Impurities"
* item[=].code[+] = $rtq-question-category#major-objection "Major Objection"
* item[=].code[+] = $rtq-assessment-outcome#resolved "Resolved"
* item[=].type = #group
* item[=].required = false
* item[=].text = "Are there any new degradation products identified within the newly submitted data?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Are there any new degradation products identified within the newly submitted data?</p></div>"
* item[=].item[+].linkId = "quality-4.1"
* item[=].item[=].code[+] = $ctd-categories-full#3.2.P.5 "Control of Drug Product"
* item[=].item[=].code[+] = $ctd-categories-full#3.2.P.5.4 "Impurities"
* item[=].item[=].code[+] = $rtq-question-category#major-objection "Major Objection"
* item[=].item[=].code[+] = $rtq-assessment-outcome#resolved "Resolved"
* item[=].item[=].type = #question
* item[=].item[=].required = false
* item[=].item[=].text = "The chromatograms for batch B-002 at 6 months accelerated (40°C/75% RH) show an unidentified peak at RRT 0.85 at 0.12%, above the 0.10% identification threshold. Identify this degradation product and propose a specification limit."
* item[=].item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The chromatograms for batch B-002 at 6 months accelerated (40°C/75% RH) show an unidentified peak at RRT 0.85 at 0.12%, above the 0.10% identification threshold. Identify this degradation product and propose a specification limit.</p></div>"
* item[=].item[+].linkId = "quality-4.2"
* item[=].item[=].code[+] = $ctd-categories-full#3.2.P.5 "Control of Drug Product"
* item[=].item[=].code[+] = $ctd-categories-full#3.2.P.5.4 "Impurities"
* item[=].item[=].code[+] = $rtq-question-category#major-objection "Major Objection"
* item[=].item[=].code[+] = $rtq-assessment-outcome#resolved "Resolved"
* item[=].item[=].type = #question
* item[=].item[=].required = false
* item[=].item[=].text = "Provide the toxicological qualification of this degradation product per ICH Q3B(R2), or justify why qualification is not required."
* item[=].item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Provide the toxicological qualification of this degradation product per ICH Q3B(R2), or justify why qualification is not required.</p></div>"
* item[=].item[=].item[+].linkId = "quality-4.2.assessment"
* item[=].item[=].item[=].type = #display
* item[=].item[=].item[=].text = "Commitment accepted: complete the 13-week repeat-dose toxicity study on the isolated N-oxide and submit the report by 2026-09-30."
* item[=].item[=].item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].item[=].item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Commitment accepted: complete the 13-week repeat-dose toxicity study on the isolated N-oxide and submit the report by 2026-09-30.</p></div>"

* item[+].linkId = "quality-5"
* item[=].code[+] = $ctd-categories-full#3.2.P.7 "Container Closure System"
* item[=].code[+] = $rtq-assessment-outcome#resolved "Resolved"
* item[=].type = #question
* item[=].required = false
* item[=].text = "Any changes in the packaging configuration and/or storage of the samples during stability?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Any changes in the packaging configuration and/or storage of the samples during stability?</p></div>"
