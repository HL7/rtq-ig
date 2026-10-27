// ============================================================================
// RTQ Extensions (v0.2.0)
// Added in response to implementer feedback (April 2026 review round):
//  - rtq-contact-purpose:       machine-readable sender/receiver discrimination
//  - rtq-regulatory-subject:    the product / authorisation a question set is about
//  - rtq-procedure-identifier:  link a question set to the regulatory procedure
//  - rtq-response-version:      business version of a response (R5 QuestionnaireResponse
//                               has no native version element)
// ============================================================================

Extension: RtqContactPurposeExtension
Id: rtq-contact-purpose
Title: "RTQ Contact Purpose"
Description: "Machine-readable role of a contact in regulatory correspondence: the sender (issuing health authority) or receiver (marketing authorisation holder/applicant). Used as the slicing discriminator for the RTQ Questionnaire contact element."
Context: Questionnaire.contact
* ^url = "http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-contact-purpose"
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-08-08"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding from RtqContactPurposeVS (required)

Extension: RtqRegulatorySubjectExtension
Id: rtq-regulatory-subject
Title: "RTQ Regulatory Subject"
Description: "A regulated subject the question set is about, so receiving systems (e.g., RIM systems) can automatically file it against the right records. Questionnaire.subjectType only states the kinds of subject (e.g., MedicinalProductDefinition, DeviceDefinition); this extension identifies the actual ones. Repeat the extension for each subject: each occurrence describes one product (medicinal product or device) with its marketing authorisation(s) and any related organisations (e.g., a manufacturer). Each part accepts either a Reference (for parties with FHIR registries) or an Identifier (e.g., an MPID, a marketing authorisation number, or an organisation ID) for parties without."
Context: Questionnaire
* ^url = "http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-regulatory-subject"
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-10-26"
* value[x] 0..0
* extension contains
    product 0..1 MS and
    authorization 0..* MS and
    organization 0..* MS
* extension[product] ^short = "Medicinal product or device the questions are about"
* extension[product] ^definition = "The medicinal product or device this subject describes, as a Reference to a MedicinalProductDefinition or DeviceDefinition, or as an Identifier (e.g., MPID, device identifier, local product code)."
* extension[product].value[x] only Reference(MedicinalProductDefinition or DeviceDefinition) or Identifier
* extension[authorization] ^short = "Marketing authorisation or registration of the product"
* extension[authorization] ^definition = "A marketing authorisation or registration of this product that the questions concern, as a Reference to a RegulatedAuthorization or as an Identifier (e.g., marketing authorisation number)."
* extension[authorization].value[x] only Reference(RegulatedAuthorization) or Identifier
* extension[organization] ^short = "Related organisation (e.g., manufacturer, site)"
* extension[organization] ^definition = "An organisation the questions concern for this subject, such as a manufacturer or manufacturing site, as a Reference to an Organization or as an Identifier (e.g., an organisation or site ID)."
* extension[organization].value[x] only Reference(Organization) or Identifier

Extension: RtqProcedureIdentifierExtension
Id: rtq-procedure-identifier
Title: "RTQ Regulatory Procedure Identifier"
Description: "The identifier of the regulatory procedure instance this question set or response belongs to, as assigned by the regulator (e.g., an EU procedure number such as NRA/H/C/005432/II/0023, an eCTD sequence, or a national case number). This links the Q&A exchange to the submission activity that triggered it."
Context: Questionnaire, QuestionnaireResponse
* ^url = "http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-procedure-identifier"
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-08-08"
* value[x] only Identifier
* valueIdentifier 1..1 MS

Extension: RtqResponseVersionExtension
Id: rtq-response-version
Title: "RTQ Response Business Version"
Description: "Business version of a response (e.g., '1.0', '2.0'). FHIR R5 QuestionnaireResponse has no native version element, so this extension carries the business version of the response document; meta.versionId remains available for technical versioning. A supplementary or corrected response is issued as a new business version with status 'amended'."
Context: QuestionnaireResponse
* ^url = "http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-response-version"
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-08-08"
* value[x] only string
* valueString 1..1 MS

Extension: RtqCommitmentExtension
Id: rtq-commitment
Title: "RTQ Commitment"
Description: "Marks an answer in which the MAH/applicant offers a commitment (e.g., to submit further data or complete a study by a given date). The regulator accepts or rejects the commitment through the assessment outcome on that question in the follow-up question set. Questions in which the regulator requests a commitment carry the 'commitment' category code instead. Tracking and fulfilment of commitments after the exchange are application-layer concerns and out of scope for RTQ."
Context: QuestionnaireResponse.item
* ^url = "http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-commitment"
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-10-25"
* value[x] 0..0
* extension contains
    description 1..1 MS and
    dueDate 0..1 MS
* extension[description] ^short = "What the company commits to do"
* extension[description].value[x] only markdown
* extension[dueDate] ^short = "Date by which the commitment will be fulfilled"
* extension[dueDate].value[x] only date
