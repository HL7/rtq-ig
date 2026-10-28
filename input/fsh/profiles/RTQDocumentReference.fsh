Profile: RTQDocumentReference
Parent: DocumentReference
Id: rtq-documentreference
Title: "RTQ Document Reference"
Description: "A profile on the DocumentReference resource for use within the Response to Regulatory Questions (RTQ) process to attach supporting documents."
* ^version = "0.2.0"
* ^status = #draft
* ^experimental = true
* ^date = "2026-08-08"
* . ^short = "RTQ DocumentReference for attachments"
* . ^comment = "The document can be embedded in content.attachment.data or referenced by content.attachment.url in a repository accessible to both parties (e.g., a submission portal or shared document store); when referenced, give content.attachment.size so the receiver can decide when to fetch it. RTQ sets no size limit. All supporting documents — including assessment reports provided as background to a question — attach through this profile uniformly; the type and category elements convey the document's intent."
* identifier MS
* status MS
* docStatus MS
* docStatus ^short = "Status of the underlying document (e.g., preliminary, final, appended)"
* type MS
* type ^short = "Specific type of document (e.g., Cover Letter, Certificate of Analysis, Clinical Study Report)"
* category MS
* category ^short = "High-level classification (e.g., CTD Module 1 - Administrative, CTD Module 3 - Quality)"
* version MS
* version ^short = "Business version of the document (e.g., 1.0, 2.1)"
* date MS
* description MS
* description ^short = "Human-readable description of the document"
* content 1..* MS
* content.attachment 1..1 MS
* content.attachment.contentType 1..1 MS
* content.attachment.data MS
* content.attachment.url MS
* content.attachment.title 1..1 MS
* content.attachment.size MS
* content.attachment.creation MS
