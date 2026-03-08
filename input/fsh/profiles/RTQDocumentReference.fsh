Profile: RTQDocumentReference
Parent: DocumentReference
Id: rtq-documentreference
Title: "RTQ Document Reference"
Description: "A profile on the DocumentReference resource for use within the Response to Regulatory Questions (RTQ) process to attach supporting documents."
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true
* ^date = "2025-11-21"
* . ^short = "RTQ DocumentReference for attachments"
* identifier MS
* status MS
* type MS
* subject MS
* date MS
* content 1..* MS
* content.attachment 1..1 MS
* content.attachment.contentType 1..1 MS
* content.attachment.data MS
* content.attachment.url MS
* content.attachment.title 1..1 MS
* content.attachment.creation MS
