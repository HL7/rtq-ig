Profile: RTQQuestionnaireResponse
Parent: QuestionnaireResponse
Id: rtq-questionnaireresponse
Title: "Questionnaire Response"
Description: "Profile for a Response to Questions submitted to a regulator from a market authorization holder/applicant during the regulated  product application lifecycle."
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true
* ^date = "2025-11-21"
* . ^short = "RTQ QuestionnaireResponse for regulatory applications"
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
* identifier ..2 MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #open
* identifier ^short = "Business identifier(s)"
* identifier contains
    company 0..1 MS and
    regulator 1..1 MS
* identifier[company] ^short = "Company-assigned identifier"
* identifier[company].type.coding 1..1
* identifier[company].type.coding = $rtq-identifier-type#company "Company Identifier" (exactly)
* identifier[company].type.coding ^short = "Company identifier type"
* identifier[regulator] ^short = "Regulator-assigned identifier"
* identifier[regulator].type.coding 1..1
* identifier[regulator].type.coding = $rtq-identifier-type#regulator "Regulatory Authority Identifier" (exactly)
* identifier[regulator].type.coding ^short = "Regulator identifier type"
* author 1..1 MS
* author only Reference
* author ^short = "Regulatory Authority contact details"
// * author.contained only Organization
// * author.contained MS
// * author.contained ^short = "Contained regulatory authority"
// * author.contained.identifier 1..1 MS
// * author.contained.identifier ^short = "Identifier of the Regulatory authority"
// * author.contained.name 1..1 MS
// * author.contained.name ^short = "Regulatory authority name"
// * author.contained.address MS
// * author.contained.address ^short = "Authority address"
// * author.contained.address.text MS
// * author.contained.address.text ^short = "Full address"
// * author.contained.address.line MS
// * author.contained.address.line ^short = "Street address"
// * author.contained.address.city MS
// * author.contained.address.city ^short = "City"
// * author.contained.address.district MS
// * author.contained.address.district ^short = "District"
// * author.contained.address.state MS
// * author.contained.address.state ^short = "State/Province"
// * author.contained.address.postalCode MS
// * author.contained.address.postalCode ^short = "Postal code"
// * author.contained.address.country MS
// * author.contained.address.country ^short = "Two-letter country code"
// * author.contained.contact.telecom 1..1 MS
// * author.contained.contact.telecom ^slicing.discriminator.type = #value
// * author.contained.contact.telecom ^slicing.discriminator.path = "system"
// * author.contained.contact.telecom ^slicing.rules = #open
// * author.contained.contact.telecom ^short = "Authority contact for this questionnaire response"
// * author.contained.contact.telecom contains
//    email 1..1 MS and
//    phone 1..1 MS
// * author.contained.contact.telecom[email] ^short = "Email address"
// * author.contained.contact.telecom[email].system 1..1
// * author.contained.contact.telecom[email].system = #email (exactly)
// * author.contained.contact.telecom[email].system ^short = "Contact type = email"
// * author.contained.contact.telecom[email].value 1..1 MS
// * author.contained.contact.telecom[email].value ^short = "Email address value"
// * author.contained.contact.telecom[phone] ^short = "Phone number"
// * author.contained.contact.telecom[phone].system 1..1
// * author.contained.contact.telecom[phone].system = #phone (exactly)
// * author.contained.contact.telecom[phone].system ^short = "Contact type = phone"
// * author.contained.contact.telecom[phone].value 1..1 MS
// * author.contained.contact.telecom[phone].value ^short = "Phone number value"
* source 1..1 MS
* source only Reference
* source ^short = "Submitting company (contained)"
// * source.contained only Organization
// * source.contained MS
// * source.contained ^short = "Contained submitting company"
// * source.contained.identifier 1..1 MS
// * source.contained.identifier ^short = "Identifier of the Company"
// * source.contained.name 1..1 MS
// * source.contained.name ^short = "Company legal name"
// * source.contained.address MS
// * source.contained.address ^short = "Company address"
// * source.contained.address.text MS
// * source.contained.address.text ^short = "Full address (formatted)"
// * source.contained.address.line MS
// * source.contained.address.line ^short = "Street address"
// * source.contained.address.city MS
// * source.contained.address.city ^short = "City"
// * source.contained.address.district MS
// * source.contained.address.district ^short = "District"
// * source.contained.address.state MS
// * source.contained.address.state ^short = "State/Province"
// * source.contained.address.postalCode MS
// * source.contained.address.postalCode ^short = "Postal code"
// * source.contained.address.country MS
// * source.contained.address.country ^short = "Two-letter country code"
// * source.contained.contact.telecom ..1 MS
// * source.contained.contact.telecom ^slicing.discriminator.type = #value
// * source.contained.contact.telecom ^slicing.discriminator.path = "system"
// * source.contained.contact.telecom ^slicing.rules = #open
// * source.contained.contact.telecom ^short = "Company contact points"
// * source.contained.contact.telecom contains
//    email 1..1 MS and
//    phone 0..1 MS
// * source.contained.contact.telecom[email] ^short = "Company email"
// * source.contained.contact.telecom[email].system 1..1
// * source.contained.contact.telecom[email].system = #email (exactly)
// * source.contained.contact.telecom[email].system ^short = "Contact type = email"
// * source.contained.contact.telecom[email].value 1..1 MS
// * source.contained.contact.telecom[email].value ^short = "Email address"
// * source.contained.contact.telecom[phone] ^short = "Company phone"
// * source.contained.contact.telecom[phone].system 1..1
// * source.contained.contact.telecom[phone].system = #phone (exactly)
// * source.contained.contact.telecom[phone].system ^short = "Contact type = phone"
// * source.contained.contact.telecom[phone].value 1..1 MS
// * source.contained.contact.telecom[phone].value ^short = "Phone number"
* item.linkId 1..1 MS
* item.linkId ^short = "Question link ID"
* item.text.extension contains XhtmlRepresentation named rendering-xhtml 0..1 MS
* item.text.extension[rendering-xhtml] ^short = "Rich text question"
* item.answer.extension contains XhtmlRepresentation named rendering-xhtml 0..1 MS
* item.answer.extension[rendering-xhtml] ^short = "Rich text answer"
* item.answer.value[x] MS
* item.answer.value[x] ^slicing.discriminator.type = #type
* item.answer.value[x] ^slicing.discriminator.path = "$this"
* item.answer.value[x] ^slicing.rules = #open
* item.answer.valueReference only Reference(RTQDocumentReference)
* item.answer.valueReference MS
* item.answer.valueReference ^sliceName = "valueReference"
* item.answer.valueReference ^short = "Reference to supporting document"
* questionnaire 1..1 MS
* questionnaire only Canonical(RTQQuestionnaire)
* questionnaire ^short = "Original questionnaire set"
* text 1..1 MS
* text ^short = "Narrative overview of the response"