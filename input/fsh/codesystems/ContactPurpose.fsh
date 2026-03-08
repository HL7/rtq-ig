CodeSystem: ContactPurpose
Id: contact-purpose
Title: "Contact Purpose Code System"
Description: "Defines the role of a contact in regulatory correspondence. Used to distinguish the sender (health authority) and recipient (marketing authorization holder) in structured Q&A."
* ^url = "http://hl7.org/fhir/uv/brr/CodeSystem/contact-purpose"
* ^version = "1.1.5"
* ^status = #active
* ^date = "2025-11-11"
* ^publisher = "HL7 Biopharmaceutical Regulatory Requirements (BRR) Work Group"
* ^contact.name = "HL7 BRR WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/brr"
* ^caseSensitive = true
* ^content = #complete
* #SENDER "Sender (Health Authority)" "The contact represents the health authority issuing the regulatory questions (e.g., EMA, FDA)."
* #RECIPIENT "Recipient (Marketing Authorization Holder)" "The contact represents the sponsor or MAH responsible for responding to the questions."
* #CC "Carbon Copy" "The contact is copied on the correspondence for information purposes (optional)."
* #REVIEWER "Internal Reviewer" "An internal stakeholder (e.g., project lead, legal) involved in review but not primary sender/recipient."