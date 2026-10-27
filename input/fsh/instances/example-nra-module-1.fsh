Instance: example-nra-module-1
InstanceOf: CodeSystem
Usage: #example
Title: "Example Regulator Module 1 Sections"
Description: "Illustrative code system of a fictional national regulatory authority for its regional CTD Module 1 sections. CTD Module 1 is regional, so each regulator defines its own Module 1 categories; questions combine them with the shared CTD code for Module 1."
* url = "http://hl7.org/fhir/uv/rtq/CodeSystem/example-nra-module-1"
* version = "0.2.0"
* name = "ExampleNraModule1Sections"
* title = "Example Regulator Module 1 Sections"
* status = #active
* experimental = true
* date = "2026-10-26"
* description = "Illustrative regional Module 1 sections of a fictional national regulatory authority, used by the RTQ examples."
* caseSensitive = true
* hierarchyMeaning = #is-a
* content = #complete
* concept[+].code = #1.0
* concept[=].display = "Administrative Information"
* concept[=].concept[+].code = #1.1
* concept[=].concept[=].display = "Application Form"
* concept[+].code = #1.3
* concept[=].display = "Product Information"
* concept[=].concept[+].code = #1.3.1
* concept[=].concept[=].display = "SmPC, Labelling and Package Leaflet"
