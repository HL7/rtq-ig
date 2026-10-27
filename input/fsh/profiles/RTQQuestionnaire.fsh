Invariant: rtq-q-1
Description: "Every question or group carries at least one category code (any code other than an assessment outcome). Display items carry no codes."
Expression: "type = 'display' or code.where(system != 'http://hl7.org/fhir/uv/rtq/CodeSystem/rtq-assessment-outcome').exists()"
Severity: #error

Invariant: rtq-q-2
Description: "Every question must be answered (required = true), except a question the regulator has assessed as resolved in a follow-up round, which is closed and must have required = false."
Expression: "type = 'display' or (code.where(system = 'http://hl7.org/fhir/uv/rtq/CodeSystem/rtq-assessment-outcome' and code = 'resolved').exists() implies required = false) and (code.where(system = 'http://hl7.org/fhir/uv/rtq/CodeSystem/rtq-assessment-outcome' and code = 'resolved').exists().not() implies required = true)"
Severity: #error

Invariant: rtq-q-3
Description: "A question assessed as raising further questions is a group that carries the follow-up questions as child items."
Expression: "code.where(system = 'http://hl7.org/fhir/uv/rtq/CodeSystem/rtq-assessment-outcome' and code = 'further-questions').exists() implies (type = 'group' and item.exists())"
Severity: #error

Invariant: rtq-q-4
Description: "Assessment outcomes are only used in a follow-up question set, which must reference the response being assessed (rtq-in-response-to)."
Expression: "repeat(item).code.where(system = 'http://hl7.org/fhir/uv/rtq/CodeSystem/rtq-assessment-outcome').exists() implies extension.where(url = 'http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-in-response-to').exists()"
Severity: #error

Extension: RTQItemReferenceExtension
Id: rtq-item-reference
Title: "RTQ Item Reference"
Description: "Supporting content for an individual question or answer: an RTQDocumentReference for attached documents, or existing FHIR content such as an ePI Bundle, a Composition (e.g., a section of the product information), or a MedicinalProductDefinition. Used on Questionnaire.item (supporting content for the question) and on QuestionnaireResponse.item (supporting content for the answer)."
Context: Questionnaire.item, QuestionnaireResponse.item
* ^url = "http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-item-reference"
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-10-26"
* value[x] only Reference(RTQDocumentReference or Bundle or Composition or MedicinalProductDefinition)
* valueReference 1..1 MS

Profile: RTQQuestionnaire
Parent: Questionnaire
Id: rtq-questionnaire
Title: "Questionnaire"
Description: "Profile for a set of Questions issued from a regulator to a market authorization holder/applicant during the regulated product application lifecycle."
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-10-26"
* extension contains
    RtqRegulatedContextExtension named regulatedContext 0..1 MS and
    RtqProcedureIdentifierExtension named procedureIdentifier 0..1 MS and
    RtqInResponseToExtension named inResponseTo 0..1 MS
* extension[regulatedContext] ^short = "Medicinal product / marketing authorisation this question set concerns"
* extension[procedureIdentifier] ^short = "Regulator-assigned identifier of the regulatory procedure instance (e.g., procedure number, eCTD sequence)"
* obeys rtq-q-4
* extension[inResponseTo] ^short = "The prior response that triggered this follow-up question set (multi-round Q&A)"
* meta 1.. MS
* meta.versionId 1.. MS
* meta.lastUpdated 1.. MS
* meta.profile 1..1 MS
* meta.profile = "http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-questionnaire" (exactly)
* url 1.. MS
* url ^short = "Canonical URL of this question set"
* url ^definition = "Globally unique canonical URL of the question set. The response references it through QuestionnaireResponse.questionnaire, and an amended question set references the version it replaces through derivedFrom."
* identifier ..2 MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #closed
* identifier contains
    company 0..1 MS and
    regulator 1..1 MS
* identifier[company].type 1.. MS
* identifier[company].type.coding 1..1
* identifier[company].type.coding = RtqIdentifierTypeCS#company-id "Company-issued Identifier" (exactly)
* identifier[regulator].type 1.. MS
* identifier[regulator].type.coding 1..1
* identifier[regulator].type.coding = RtqIdentifierTypeCS#regulator-id "Regulator-issued Identifier" (exactly)
* version 1.. MS
* version ^short = "Business version of the question set (e.g., 1.0). An amended question set is issued as a new version linked via derivedFrom."
* derivedFrom MS
* derivedFrom ^short = "Canonical reference to the question set this one amends or supersedes"
* effectivePeriod 1.. MS
* effectivePeriod ^short = "Response window: from issue (start) to the deadline for the response (end)"
* effectivePeriod ^definition = "The period in which the recipient is to respond to this question set. start is the date the question set is issued; end is the current deadline for the response. If a new deadline is agreed, the regulator updates end; earlier deadlines remain in the resource's version history (meta.versionId). A response is late if its authored date is after end. A closing question set, in which every question is resolved, has a start and no end."
* effectivePeriod ^comment = "Used here as the response window. It does not mean the question set expires after end: a late response is still a valid response."
* effectivePeriod.start 1.. MS
* effectivePeriod.start ^short = "Date the question set is issued"
* effectivePeriod.end MS
* effectivePeriod.end ^short = "Deadline for the response (absent on a closing question set)"
* text 1.. MS
* text ^short = "Cover letter: rich-text content of the question set"
* text ^definition = "The cover letter of the question set, as rich text (XHTML): context, instructions, and overall comments. Use text.status = additional. No separate cover letter document is needed."
* subjectType 1.. MS
* subjectType ^short = "Resource type(s) the question set is about (e.g., MedicinalProductDefinition)"
* subjectType ^comment = "Per FHIR R5, subjectType is bound (required) to the ResourceType value set and must carry resource type codes. The regulatory template type of the question set (e.g., list-of-questions, information-request) is carried in Questionnaire.code; the procedure instance is carried in the rtq-procedure-identifier extension."
* code 1..* MS
* code from $rtq-questionnaire-type-vs (extensible)
* code ^short = "Type of regulatory questionnaire (e.g., list-of-questions, information-request, deficiency-letter)"
* code ^definition = "The regulatory template type this question set represents, drawn from the RTQ Questionnaire Type CodeSystem. This replaces the pre-0.2.0 (non-conformant) use of subjectType for this purpose."
* publisher ..0
* contact ..2 MS
* contact.extension contains RtqContactPurposeExtension named purpose 1..1 MS
* contact.extension[purpose] ^short = "Machine-readable contact role: SENDER (regulator) or RECIPIENT (MAH/applicant)"
* contact ^slicing.discriminator.type = #value
* contact ^slicing.discriminator.path = "extension('http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-contact-purpose').value"
* contact ^slicing.rules = #closed
* contact ^short = "Sender (issuing regulatory authority) and receiver (MAH/applicant) contact details"
* contact ^definition = "Exactly two contacts shall be present: one identifying the competent authority that issued the Questionnaire (sender) and one identifying the marketing authorisation holder or applicant that is required to complete and return the QuestionnaireResponse (receiver). Slicing is based on the rtq-contact-purpose extension to distinguish the two parties."
* contact contains
    sender 1..1 MS and
    receiver 1..1 MS
* contact[sender] ^short = "Contact details of the issuing competent authority (regulator)"
* contact[sender] ^definition = "Identifies the regulatory authority or agency that has created and sent this Questionnaire to the marketing authorisation holder."
* contact[sender].extension[purpose].valueCoding = $contact-purpose#SENDER "Sender (Health Authority)"
// * contact[sender].organization 1.. MS
// * contact[sender].organization ^short = "Issuing competent authority"
// * contact[sender].organization ^definition = "The regulatory agency (e.g., EMA, national competent authority) responsible for issuing Questionnaire."
// * contact[sender].organization.identifier 1.. MS
// * contact[sender].organization.identifier ^short = "Regulatory authority identifier (e.g., OMS Location ID)"
// * contact[sender].organization.identifier ^definition = "Official identifier of the issuing competent authority."
* contact[sender].name 1.. MS
* contact[sender].name ^short = "Official name of the issuing regulatory authority"
* contact[sender].name ^definition = "Full official name of the competent authority issuing the Questionnaire (e.g., National Regulatory Authority)."
// * contact[sender].organization.address 1..1 MS
// * contact[sender].organization.address ^short = "Official address of the issuing competent authority"
// * contact[sender].organization.address ^definition = "Complete official address of the regulatory authority that issued the Questionnaire."
// * contact[sender].organization.address.text 1.. MS
// * contact[sender].organization.address.text ^short = "Full formatted address of the issuing authority"
// * contact[sender].organization.address.text ^definition = "Complete address of the competent authority as a single human-readable string (for display and verification purposes)."
// * contact[sender].organization.address.line 1..* MS
// * contact[sender].organization.address.line ^short = "Street address lines of the issuing authority"
// * contact[sender].organization.address.line ^definition = "Street address (including building, floor, department, P.O. Box, etc.) of the regulatory authority."
// * contact[sender].organization.address.city 1.. MS
// * contact[sender].organization.address.city ^short = "City of the issuing competent authority"
// * contact[sender].organization.address.city ^definition = "City or municipality where the regulatory authority is located."
// * contact[sender].organization.address.district MS
// * contact[sender].organization.address.district ^short = "District (sub-division of city) of the issuing authority"
// * contact[sender].organization.address.district ^definition = "District or borough within the city (if applicable)."
// * contact[sender].organization.address.district ^min = 0
// * contact[sender].organization.address.state MS
// * contact[sender].organization.address.state ^short = "State, province or region of the issuing authority"
// * contact[sender].organization.address.state ^definition = "State, province, canton or equivalent administrative region of the regulatory authority (required when applicable, e.g., for national agencies in federal countries)."
// * contact[sender].organization.address.state ^min = 0
// * contact[sender].organization.address.postalCode 1.. MS
// * contact[sender].organization.address.postalCode ^short = "Postal code of the issuing authority"
// * contact[sender].organization.address.postalCode ^definition = "Postal or ZIP code of the regulatory authority’s address."
// * contact[sender].organization.address.country 1.. MS
// * contact[sender].organization.address.country ^short = "Country of the issuing competent authority"
// * contact[sender].organization.address.country ^definition = "ISO 3166-1 alpha-2 country code of the country in which the regulatory authority is established (e.g., 'NL' for Netherlands, 'GB' for United Kingdom)."
// * contact[sender].organization.contact 1.. MS
// * contact[sender].organization.contact ^short = "Primary contact at the issuing authority"
// * contact[sender].organization.contact ^definition = "Designated contact person or role within the regulatory authority responsible for this Questionnaire and for receiving the completed response."
* contact[sender].telecom 1..2 MS
* contact[sender].telecom ^slicing.discriminator.type = #value
* contact[sender].telecom ^slicing.discriminator.path = "system"
* contact[sender].telecom ^slicing.rules = #closed
* contact[sender].telecom contains
    email 1..1 and
    phone 0..1
* contact[sender].telecom[email] ^short = "Official email for the designated regulatory contact"
* contact[sender].telecom[email] ^definition = "Official email for the designated regulatory contact"
* contact[sender].telecom[email].system = #email (exactly)
* contact[sender].telecom[email].value 1..
* contact[sender].telecom[phone] ^short = "Telephone number for the responsible regulatory contact"
* contact[sender].telecom[phone] ^definition = "Telephone number for the responsible regulatory contact."
* contact[sender].telecom[phone].system = #phone (exactly)
* contact[sender].telecom[phone].value 1..
* contact[receiver] ^short = "Contact details of the marketing authorisation holder/applicant"
* contact[receiver] ^definition = "Identifies the pharmaceutical company, marketing authorisation holder, submitter or applicant that is the recipient of this Questionnaire and is obliged to provide the completed response."
* contact[receiver].extension[purpose].valueCoding = $contact-purpose#RECIPIENT "Recipient (Marketing Authorization Holder)"
// * contact[receiver].organization 1.. MS
// * contact[receiver].organization ^short = "Marketing authorisation holder / applicant organisation"
// * contact[receiver].organization ^definition = "The legal entity (MAH or applicant) to whom the Questionnaire is addressed."
// * contact[receiver].organization.identifier 1.. MS
// * contact[receiver].organization.identifier ^short = "Organisation identifier of the MAH/applicant (e.g., OMS Organization ID)"
// * contact[receiver].organization.identifier ^definition = "Official identifier of the receiving organisation as registered in an authoritative system."
* contact[receiver].name 1.. MS
* contact[receiver].name ^short = "Legal name of the MAH/applicant"
* contact[receiver].name ^definition = "Full legal name of the marketing authorisation holder or applicant."
// * contact[receiver].organization.address 1..1 MS
// * contact[receiver].organization.address ^short = "Official registered address of the marketing authorisation holder/sponsor"
// * contact[receiver].organization.address ^definition = "Complete official registered address of the MAH or sponsor organisation to whom the Questionnaire is addressed."
// * contact[receiver].organization.address.text 1.. MS
// * contact[receiver].organization.address.text ^short = "Full formatted address of the MAH/sponsor (human-readable)"
// * contact[receiver].organization.address.text ^definition = "Complete address of the marketing authorisation holder or sponsor as a single formatted string for display, verification, and correspondence purposes."
// * contact[receiver].organization.address.line 1..* MS
// * contact[receiver].organization.address.line ^short = "Street address lines of the MAH/sponsor"
// * contact[receiver].organization.address.line ^definition = "One or more lines containing the street address, building name/number, floor, department, P.O. Box, etc., of the marketing authorisation holder or sponsor as registered in OMS or equivalent authoritative source."
// * contact[receiver].organization.address.city 1.. MS
// * contact[receiver].organization.address.city ^short = "City of the MAH/sponsor registered address"
// * contact[receiver].organization.address.city ^definition = "City or municipality in which the marketing authorisation holder or sponsor is legally registered."
// * contact[receiver].organization.address.district MS
// * contact[receiver].organization.address.district ^short = "District or borough (if applicable)"
// * contact[receiver].organization.address.district ^definition = "District, borough or sub-division of the city in which the MAH/sponsor is located (used when relevant, e.g., in large metropolitan areas)."
// * contact[receiver].organization.address.district ^min = 0
// * contact[receiver].organization.address.state MS
// * contact[receiver].organization.address.state ^short = "State, province or region of the MAH/sponsor"
// * contact[receiver].organization.address.state ^definition = "State, province, canton, or equivalent administrative region of the MAH/sponsor’s registered address (required when the country has such subdivisions)."
// * contact[receiver].organization.address.state ^min = 0
// * contact[receiver].organization.address.postalCode 1.. MS
// * contact[receiver].organization.address.postalCode ^definition = "Postal code or ZIP code of the marketing authorisation holder or sponsor’s registered address."
// * contact[receiver].organization.address.country 1.. MS
// * contact[receiver].organization.address.country ^short = "Country of the MAH/sponsor registered address"
// * contact[receiver].organization.address.country ^definition = "ISO 3166-1 alpha-2 country code of the country in which the marketing authorisation holder or sponsor is legally established (e.g., 'DE' for Germany, 'US' for United States)."
// * contact[receiver].organization.contact 1.. MS
// * contact[receiver].organization.contact ^short = "Regulatory affairs contact person at the MAH/applicant"
// * contact[receiver].organization.contact ^definition = "Individual or role within the MAH/applicant responsible for completing and returning the response."
* contact[receiver].telecom 2..2 MS
* contact[receiver].telecom ^slicing.discriminator.type = #value
* contact[receiver].telecom ^slicing.discriminator.path = "system"
* contact[receiver].telecom ^slicing.rules = #closed
* contact[receiver].telecom contains
    email 1..1 and
    phone 1..1
* contact[receiver].telecom[email] ^short = "Regulatory contact email of the MAH/applicant"
* contact[receiver].telecom[email] ^definition = "Email address of the person or team at the MAH/applicant responsible for regulatory correspondence related to this regulatory activity."
* contact[receiver].telecom[email].system = #email (exactly)
* contact[receiver].telecom[email].value 1..
* contact[receiver].telecom[phone] ^short = "Telephone number of the regulatory contact at the MAH/applicant"
* contact[receiver].telecom[phone] ^definition = "Direct telephone number (with country code) of the regulatory contact person at the receiving organisation."
* contact[receiver].telecom[phone].system = #phone (exactly)
* contact[receiver].telecom[phone].value 1..
* item MS
* item ^short = "Question in the regulatory questionnaire"
* item.required MS
* item.required ^short = "True for every open question; false only for a question assessed as resolved"
* item.required ^definition = "Every question in an RTQ question set must be answered, so required is true. Standard FHIR validation of a QuestionnaireResponse against this Questionnaire then enforces that every question receives a response item. The single exception is a question re-issued in a follow-up round with the assessment outcome 'resolved': it is closed, no further answer is expected, and required is false (invariant rtq-q-2)."
* item obeys rtq-q-1 and rtq-q-2 and rtq-q-3
* item.extension contains RTQItemReferenceExtension named itemReference 0..* MS
* item.extension[itemReference] ^short = "Supporting document(s) or referenced FHIR resource(s) for this question"
* item.code MS
* item.code from RtqQuestionCategoryVS (preferred)
* item.code ^short = "Category code(s) (at least one) and, in a follow-up round, the regulator's assessment outcome"
* item.code ^definition = "Category codes classify the question. At least one is required on every question or group (invariant rtq-q-1). Categories are regulator-defined: CTD section codes and the RTQ regulatory significance codes are the preferred terminologies, but a regulator may use its own code system, and product domains that do not use the CTD (e.g., medical devices) use the terminology that fits. A question may carry several categories (e.g., a CTD section and 'major-objection', or two CTD sections for a multidisciplinary question). In a follow-up round, the assessment slice records the regulator's conclusion on the previous response to this question."
* item.code ^comment = "Display items carry no codes (FHIR invariant que-3)."
* item.code ^slicing.discriminator.type = #value
* item.code ^slicing.discriminator.path = "system"
* item.code ^slicing.rules = #open
* item.code ^slicing.description = "The assessment slice is identified by its fixed system. All other codings on the item are category codes."
* item.code contains assessment 0..1 MS
* item.code[assessment] from RtqAssessmentOutcomeVS (required)
* item.code[assessment] ^short = "Regulator's assessment of the previous response: resolved | not-resolved | further-questions"
* item.code[assessment] ^definition = "Used only when a question is re-issued in a follow-up question set (which references the assessed response via rtq-in-response-to). 'resolved' closes the question (required = false); 'not-resolved' keeps it open (required = true); 'further-questions' makes the item a group whose child items are the follow-up questions."
* item.code[assessment].system 1.. MS
* item.code[assessment].system = "http://hl7.org/fhir/uv/rtq/CodeSystem/rtq-assessment-outcome" (exactly)
* item.code[assessment].code 1.. MS
* item.text 1.. MS
* item.text.extension ^slicing.discriminator.type = #value
* item.text.extension ^slicing.discriminator.path = "url"
* item.text.extension ^slicing.rules = #open
* item.text.extension contains XhtmlRepresentation named rendering-xhtml 1..1 MS