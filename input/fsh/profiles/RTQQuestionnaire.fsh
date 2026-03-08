Profile: RTQQuestionnaire
Parent: Questionnaire
Id: rtq-questionnaire
Title: "Questionnaire"
Description: "Profile for a set of Questions issued from a regulator to a market authorization holder/applicant during the regulated product application lifecycle."
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true
* ^date = "2025-11-21"
* meta 1.. MS
* meta.versionId 1.. MS
* meta.lastUpdated 1.. MS
* meta.profile 1..1 MS
* meta.profile = "http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-questionnaire" (exactly)
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
* text 1.. MS
* subjectType 1.. MS
* subjectType from $rtq-questionnaire-type-vs (required)
* publisher ..0
* contact ..2 MS
* contact ^slicing.discriminator.type = #value
* contact ^slicing.discriminator.path = "organization.name"
* contact ^slicing.rules = #closed
* contact ^short = "Sender (issuing regulatory authority) and receiver (MAH/applicant) contact details"
* contact ^definition = "Exactly two contacts shall be present: one identifying the competent authority that issued the Request to Qualify Questionnaire (sender) and one identifying the marketing authorisation holder or applicant that is required to complete and return the QuestionnaireResponse (receiver). Slicing is based on organization.name to distinguish the two parties."
* contact contains
    sender 1..1 MS and
    receiver 1..1 MS
* contact[sender] ^short = "Contact details of the issuing competent authority (regulator)"
* contact[sender] ^definition = "Identifies the regulatory authority or agency that has created and sent this Questionnaire to the marketing authorisation holder."
// * contact[sender].organization 1.. MS
// * contact[sender].organization ^short = "Issuing competent authority"
// * contact[sender].organization ^definition = "The regulatory agency (e.g., EMA, national competent authority) responsible for issuing Questionnaire."
// * contact[sender].organization.identifier 1.. MS
// * contact[sender].organization.identifier ^short = "Regulatory authority identifier (e.g., OMS Location ID)"
// * contact[sender].organization.identifier ^definition = "Official identifier of the issuing competent authority."
* contact[sender].name 1.. MS
* contact[sender].name ^short = "Official name of the issuing regulatory authority"
* contact[sender].name ^definition = "Full official name of the competent authority issuing the Questionnaire (e.g., European Medicines Agency)."
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
* contact[sender].telecom 2..2 MS
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
* item.code 1..* MS
* item.code from $ctd-categories-full (extensible)
* item.code ^short = "CTD-based category code that classifies the regulatory topic of this question/group"
* item.code ^definition = "A required code from the RTQ CTD Categories CodeSystem (or an allowed extension of it) that identifies which section, subsection, or specific regulatory topic within a medicinal product dossier this questionnaire item pertains to. This enables precise mapping and automated routing in regulatory processes."
* item.code ^comment = "Examples: '2-3-s-4-2' = Nonclinical Overview, '3-2-p-5-3' = Microbiological quality control, etc."
* item.code ^binding.description = "Codes from the full CTD hierarchy as defined in the RTQ CTD Categories CodeSystem. Additional codes beyond the standard CTD structure may be defined locally or in future versions of the CodeSystem when new regulatory topics are required."
* item.code.system 1.. MS
* item.code.system = "http://hl7.org/fhir/uv/rtq/CodeSystem/ctd-categories-full" (exactly)
* item.code.code 1.. MS
* item.code.code ^short = "CTD section/subsection code (e.g., 2-3-s-4-2-1)"
* item.code.display 1.. MS
* item.code.display ^short = "Human-readable title of the CTD category"
* item.text 1.. MS
* item.text.extension ^slicing.discriminator.type = #value
* item.text.extension ^slicing.discriminator.path = "url"
* item.text.extension ^slicing.rules = #open
* item.text.extension contains XhtmlRepresentation named rendering-xhtml 1..1 MS