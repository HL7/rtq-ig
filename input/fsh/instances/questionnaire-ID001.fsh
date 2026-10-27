Instance: questionnaire-ID001
InstanceOf: Questionnaire
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2025-11-11T22:30:00Z"
* meta.profile = "http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-questionnaire"
* language = #en
* url = "http://hl7.org/fhir/uv/rtq/Questionnaire/questionnaire-ID001"
* identifier[+].system = "https://example-nra.example.org/question-set-id"
* identifier[=].value = "ID001"
* identifier[=].type = $rtq-identifier-type#regulator-id "Regulator-issued Identifier"
* extension[RtqProcedureIdentifierExtension].valueIdentifier.system = "https://example-nra.example.org/procedure-number"
* extension[RtqProcedureIdentifierExtension].valueIdentifier.value = "NRA/H/C/005432/II/0023"
* extension[RtqRegulatorySubjectExtension].extension[product].valueIdentifier.system = "https://example-nra.example.org/product-id"
* extension[RtqRegulatorySubjectExtension].extension[product].valueIdentifier.value = "MPID-EX-000123"
* extension[RtqRegulatorySubjectExtension].extension[authorization].valueIdentifier.system = "https://example-nra.example.org/marketing-authorisation-number"
* extension[RtqRegulatorySubjectExtension].extension[authorization].valueIdentifier.value = "NRA/H/C/005432"
* version = "1.0"
* name = "BRRRegulatoryQAQuestionnaire"
* title = "Question Set ID001"
* status = #active
* subjectType = #MedicinalProductDefinition
* code = $rtq-questionnaire-type-cs#list-of-questions "List of Questions"
* date = "2025-11-11"
* effectivePeriod.start = "2025-11-11"
* effectivePeriod.end = "2025-12-11"
// * contact[+].purpose.coding.system = "http://hl7.org/fhir/uv/brr/CodeSystem/contact-purpose"
// * contact[=].purpose.coding.code = "SENDER"
// * contact[=].purpose.coding.display = "Sender (Health Authority)"
// * contact[=].organization.reference = "Organization/ema"
// * contact[=].organization.identifier.system = "https://example-nra.example.org/organization-id"
// * contact[=].organization.identifier.value = "NRA-ORG-001"
// * contact[=].organization.display = "National Regulatory Authority"
* contact[+].extension[RtqContactPurposeExtension].valueCoding = $contact-purpose#SENDER "Sender (Health Authority)"
* contact[=].name = "National Regulatory Authority"
// * contact[=].organization.address.line = "1 Regulatory Plaza"
// * contact[=].organization.address.city = "Capital City"
// * contact[=].organization.address.postalCode = "00001"
// * contact[=].organization.address.country = "XX"
* contact[=].telecom[+].system = #email
* contact[=].telecom[=].value = "regulatory.contact@example-nra.example.org"
* contact[=].telecom[+].system = #phone
* contact[=].telecom[=].value = "+00-00-000-0000"
// * contact[+].purpose.coding.system = "http://hl7.org/fhir/uv/brr/CodeSystem/contact-purpose"
// * contact[=].purpose.coding.code = "RECIPIENT"
// * contact[=].purpose.coding.display = "Recipient (Marketing Authorization Holder)"
// * contact[=].organization.reference = "Organization/synthpharma"
// * contact[=].organization.identifier.system = "urn:oid:1.3.6.1.4.1.519.1"
// * contact[=].organization.identifier.value = "DUNS-123456789"
// * contact[=].organization.display = "SynthPharma AG"
* contact[+].extension[RtqContactPurposeExtension].valueCoding = $contact-purpose#RECIPIENT "Recipient (Marketing Authorization Holder)"
* contact[=].name = "SynthPharma AG"
// * contact[=].organization.address.line = "123 Synthetic Research Blvd"
// * contact[=].organization.address.city = "Basel"
// * contact[=].organization.address.postalCode = "4000"
// * contact[=].organization.address.country = "CH"
* contact[=].telecom[+].system = #email
* contact[=].telecom[=].value = "john.doe@synthpharma.example"
* contact[=].telecom[+].system = #phone
* contact[=].telecom[=].value = "+41-61-123-4567"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"en\" xml:lang=\"en\"><p>Dear SynthPharma AG,</p><p>Please find enclosed the List of Questions for the Type II variation NRA/H/C/005432/II/0023 for ExampleDrug 10 mg Tablets. Responses are required by 11 December 2025. Every question must be answered; please keep the question identifiers (linkId) unchanged in your response.</p><p>National Regulatory Authority, Regulatory Affairs Division</p></div>"
* item[+].linkId = "admin-1"
* item[=].code[+] = $ctd-categories-full#1 "Administrative Information and Prescribing Information"
* item[=].code[+] = $example-nra-module-1#1.1 "Application Form"
* item[=].type = #text
* item[=].required = true
* item[=].text = "Is the fee for the Type II variation fully paid and documented?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Is the fee for the Type II variation fully paid and documented?</p><p style=\"font-size:0.9em; color:#555;\">Please refer to your regulatory authority's fee guidance documentation for payment confirmation requirements.</p></div>"
* item[+].linkId = "admin-2"
* item[=].code[+] = $ctd-categories-full#1 "Administrative Information and Prescribing Information"
* item[=].code[+] = $example-nra-module-1#1.1 "Application Form"
* item[=].type = #text
* item[=].required = true
* item[=].text = "Are all required metadata fields in the application form complete?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Are all required metadata fields in the application form complete?</p><ul><li>Marketing Authorisation Holder</li><li>Product Name (INN)</li><li>Procedure Number</li><li>Submission Date</li></ul></div>"
* item[+].linkId = "product-1"
* item[=].code[+] = $ctd-categories-full#1 "Administrative Information and Prescribing Information"
* item[=].code[+] = $example-nra-module-1#1.3.1 "SmPC, Labelling and Package Leaflet"
* item[=].type = #text
* item[=].required = true
* item[=].text = "Do the updated storage conditions (2–8°C for 36 months) require additional patient guidance?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Do the updated storage conditions (2–8°C for 36 months) require additional patient guidance?</p><p>Current ePI states: “Store in a refrigerator (2°C – 8°C). Do not freeze.”</p></div>"
* item[+].linkId = "product-2"
* item[=].code[+] = $ctd-categories-full#1 "Administrative Information and Prescribing Information"
* item[=].code[+] = $example-nra-module-1#1.3.1 "SmPC, Labelling and Package Leaflet"
* item[=].type = #text
* item[=].required = true
* item[=].text = "Is the patient leaflet revised to clarify the extended shelf life?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Is the patient leaflet revised to clarify the extended shelf life?</p><p style=\"font-style:italic\">“Shelf life after first opening: 36 months when stored at 2–8°C”</p></div>"
* item[+].linkId = "product-3"
* item[=].code[+] = $ctd-categories-full#1 "Administrative Information and Prescribing Information"
* item[=].code[+] = $example-nra-module-1#1.3.1 "SmPC, Labelling and Package Leaflet"
* item[=].code[+] = $rtq-question-category#minor-concern "Minor Concern"
* item[=].type = #text
* item[=].required = true
* item[=].text = "Is the updated ePI text sufficiently clear for all applicable languages?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Is the updated ePI text sufficiently clear for all applicable languages?</p><table><tr><th>Language</th><th>Status</th></tr><tr><td>English</td><td>Approved</td></tr><tr><td>French</td><td>Under Review</td></tr><tr><td>German</td><td>Pending</td></tr></table></div>"
* item[+].linkId = "quality-1"
* item[=].code[+] = $ctd-categories-full#3.2.P.8 "Stability"
* item[=].code[+] = $ctd-categories-full#3.2.P.8.1 "Stability Summary and Conclusion"
* item[=].type = #text
* item[=].required = true
* item[=].text = "Are there any new stability studies conducted, or does the submission include only data from additional timepoints from previously submitted studies?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Are there any new stability studies conducted, or does the submission include only data from additional timepoints from previously submitted studies?</p><ul><li>Include protocol deviations if any.</li><li>Reference: <a href=\"https://www.ich.org/page/ich-guidelines\">ICH Q1A(R2)</a></li></ul></div>"
* item[+].linkId = "quality-2"
* item[=].code[+] = $ctd-categories-full#3.2.P.8 "Stability"
* item[=].code[+] = $ctd-categories-full#3.2.P.8.1 "Stability Summary and Conclusion"
* item[=].type = #text
* item[=].required = true
* item[=].text = "Does the data support all intended climatic zones?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Does the data support all intended climatic zones?</p><div class=\"rtq-note\"><b>Note:</b> Confirm coverage for Zone IVb (30°C/75% RH) per <a href=\"https://www.who.int/publications/i/item/9789240011922\">WHO TRS 1010</a></div></div>"
* item[+].linkId = "quality-3"
* item[=].code[+] = $ctd-categories-full#3.2.P.5 "Control of Drug Product"
* item[=].code[+] = $ctd-categories-full#3.2.P.5.2 "Analytical Procedures"
* item[=].type = #text
* item[=].required = true
* item[=].text = "Are the test methods used the same as in the previously submitted stability information?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Are the test methods used the same as in the previously submitted stability information?</p><p style=\"color:#d32f2f\">If changed: justify and provide validation data.</p></div>"
* item[+].linkId = "quality-4"
* item[=].code[+] = $ctd-categories-full#3.2.P.5 "Control of Drug Product"
* item[=].code[+] = $ctd-categories-full#3.2.P.5.5 "Characterisation of Impurities"
* item[=].code[+] = $rtq-question-category#major-objection "Major Objection"
* item[=].type = #text
* item[=].required = true
* item[=].text = "Are there any new degradation products identified within the newly submitted data?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Are there any new degradation products identified within the newly submitted data?</p><p style=\"font-size:0.9em\">Threshold: <b>&gt;0.10%</b> per <a href=\"https://www.ich.org/page/quality-guidelines\">ICH Q3B(R2)</a></p></div>"
* item[+].linkId = "quality-5"
* item[=].code = $ctd-categories-full#3.2.P.7 "Container Closure System"
* item[=].type = #text
* item[=].required = true
* item[=].text = "Any changes in the packaging configuration and/or storage of the samples during stability?"
* item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].text.extension[=].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Any changes in the packaging configuration and/or storage of the samples during stability?</p><p style=\"font-size:0.9em;color:#555\"><b>Figure 1:</b> Cross-section of new Alu/Alu blister showing foil thickness and sealing layer.</p><table><tr><th>Original</th><th>New</th></tr><tr><td>PVC/PVDC Blister</td><td>Alu/Alu Blister</td></tr><tr><td>25°C/60% RH</td><td>Unchanged</td></tr></table></div>"