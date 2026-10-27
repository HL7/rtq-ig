Instance: example-docref
InstanceOf: DocumentReference
Title: "Fee Payment Receipt"
Description: "Supporting document attached to the answer to question admin-1 in response SP-RTQ-2025-0148."
Usage: #example
* meta.profile = "http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-documentreference"
* identifier.system = "https://synthpharma.example/identifier/document"
* identifier.value = "SP-DOC-2025-0612"
* status = #current
* docStatus = #final
* version = "1.0"
* type.text = "Fee payment receipt"
* category = $ctd-categories-full#1 "Administrative Information and Prescribing Information"
* description = "Receipt for payment of the Type II variation fee for ExampleDrug 10 mg Tablets, procedure NRA/H/C/005432/II/0023."
* date = "2025-06-25T10:00:00Z"
* content.attachment.contentType = #application/pdf
* content.attachment.title = "Fee_Payment_Receipt.pdf"
* content.attachment.creation = "2025-06-25T09:30:00Z"
