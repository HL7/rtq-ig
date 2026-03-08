Instance: example-docref
InstanceOf: DocumentReference
Usage: #example
* meta.profile = "http://hl7.org/fhir/uv/apix/StructureDefinition/apix-documentreference"
// // * masterIdentifier.system = "urn:ietf:rfc:3986"
// * masterIdentifier.value = "urn:uuid:12345678-1234-5678-1234-567812345678"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:oid:1.2.3.4.5"
* status = #current
* type = $ctd-section#3-2-P-5-3 "3.2.P.5.3 Validation of Analytical Procedures"
* subject = Reference(urn:uuid:3b52d929-ac2e-4b47-ba21-1b120fdb4a5b) "WonderDrug 10mg Tablets"
* date = "2025-11-20T10:00:00Z"
* content.attachment.contentType = #application/pdf
* content.attachment.title = "Validation Report for HPLC Method"
* content.attachment.creation = "2025-11-19T15:00:00Z"
// * content.attachment.data = JVBERi0xLjQKJcOkw7zDtsOxdHJhaWxlcjw8L1Jvb3Q8PC9QYWdlczw8L0tpZHMW4+PC9NZWRpYUJveFswIDAgNTk1LjI4IDg0MS44OV0+Pj4+Pj47Cg==