Invariant: rtq-qr-1
Description: "Every response item must contain an answer or nested items. A question is never left unanswered: where no substantive response applies, provide an explicit answer such as 'No response required.' or a cross-reference, so the receiving system is not left with an open question."
* severity = #error
* expression = "answer.exists() or item.exists()"

Profile: RTQQuestionnaireResponse
Parent: QuestionnaireResponse
Id: rtq-questionnaireresponse
Title: "Questionnaire Response"
Description: "Profile for a Response to Questions submitted to a regulator from a market authorization holder/applicant during the regulated  product application lifecycle."
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-08-08"
* . ^short = "RTQ QuestionnaireResponse for regulatory applications"
* extension contains
    RtqResponseVersionExtension named responseVersion 0..1 MS and
    RtqRegulatedContextExtension named regulatedContext 0..1 MS and
    RtqProcedureIdentifierExtension named procedureIdentifier 0..1 MS
* extension[responseVersion] ^short = "Business version of this response (e.g., 1.0); R5 QuestionnaireResponse has no native version element"
* extension[regulatedContext] ^short = "Medicinal product / marketing authorisation this response concerns"
* extension[procedureIdentifier] ^short = "Regulator-assigned identifier of the regulatory procedure instance"
* meta 1.. MS
* meta ^short = "Metadata (required)"
* meta.versionId 1.. MS
* meta.versionId ^short = "Version ID"
* meta.lastUpdated 1.. MS
* meta.lastUpdated ^short = "Last updated timestamp"
* meta.profile 1.. MS
* meta.profile = "http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-questionnaireresponse" (exactly)
* meta.profile ^short = "Conformance to RTQ profile"
* status 1..1 MS
* authored 1..1 MS
* authored ^short = "Date the full response was finalized"
* identifier 2..2 MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #open
* identifier ^short = "Business identifier(s)"
* identifier contains
    company 1..1 MS and
    regulator 1..1 MS
* identifier[company] ^short = "Company-assigned identifier (mandatory: the responding company must identify its response)"
* identifier[company] ^definition = "Identifier assigned by the responding marketing authorisation holder/applicant to this response. Mandatory so that the response is always unambiguously identified by its author. Note that identifiers identify the artifacts (question set and response documents), not the organizations; the responding organization itself is identified by the required source element."
* identifier[company].type.coding 1..1
* identifier[company].type.coding = RtqIdentifierTypeCS#company-id "Company-issued Identifier" (exactly)
* identifier[company].type.coding ^short = "Company identifier type"
* identifier[regulator] ^short = "Regulator-assigned identifier (copied from the question set for traceability)"
* identifier[regulator].type.coding 1..1
* identifier[regulator].type.coding = RtqIdentifierTypeCS#regulator-id "Regulator-issued Identifier" (exactly)
* identifier[regulator].type.coding ^short = "Regulator identifier type"
* author 1..1 MS
* author only Reference
* author ^short = "MAH/applicant organization that authored the response"
* author ^definition = "The marketing authorisation holder or applicant organization that prepared and submitted this response. The regulator is identified on the Questionnaire this response answers, not here."
* source 1..1 MS
* source only Reference
* source ^short = "MAH/applicant that answered the questions (usually the same organization as author)"
* item obeys rtq-qr-1
* item ^comment = "Every open question in the referenced Questionnaire must be represented by a response item with the matching linkId. Because the RTQ Questionnaire sets item.required to true on every open question, standard FHIR validation of this response against its Questionnaire enforces completeness; rtq-qr-1 additionally guarantees that no reported item is empty. Where no substantive answer applies, provide an explicit answer such as 'No response required.' or a cross-reference."
* item.extension contains RtqCommitmentExtension named commitment 0..1 MS
* item.extension[commitment] ^short = "Commitment offered by the MAH/applicant in this answer"
* item.linkId 1..1 MS
* item.linkId ^short = "Question link ID (matches the linkId of the corresponding question)"
* item.text.extension contains XhtmlRepresentation named rendering-xhtml 0..1 MS
* item.text.extension[rendering-xhtml] ^short = "Rich text question"
* item.answer.extension contains XhtmlRepresentation named rendering-xhtml 0..1 MS
* item.answer.extension[rendering-xhtml] ^short = "Rich text answer"
* item.answer.value[x] MS
* item.answer.value[x] ^slicing.discriminator.type = #type
* item.answer.value[x] ^slicing.discriminator.path = "$this"
* item.answer.value[x] ^slicing.rules = #open
* item.answer.valueReference only Reference(RTQDocumentReference or Bundle or Composition or MedicinalProductDefinition)
* item.answer.valueReference MS
* item.answer.valueReference ^sliceName = "valueReference"
* item.answer.valueReference ^short = "Reference to a supporting document or FHIR resource (e.g., ePI Bundle or Composition)"
* questionnaire 1..1 MS
* questionnaire only Canonical(RTQQuestionnaire)
* questionnaire ^short = "Original questionnaire set"
* text 1..1 MS
* text ^short = "Narrative overview of the response"