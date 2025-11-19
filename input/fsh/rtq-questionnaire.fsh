Profile: RegulatoryQuestionnaire
Parent: Questionnaire
Id: rtq-questionnaire
Title: "Regulatory Questionnaire"
Description: "A Questionnaire constrained for structured regulatory Q&A in biopharmaceutical and life sciences (e.g., medicinal product identification, strength, dose form, indications)."

* item ^slicing.discriminator.type = #value
* item ^slicing.discriminator.path = "linkId"
* item ^slicing.rules = #closed
* item ^slicing.ordered = false

* item contains
    product-identifier 1..1 MS and
    product-name 0..1 MS and
    strength 0..1 MS and
    pharmaceutical-form 0..1 MS and
    route-of-administration 0..1 MS and
    therapeutic-indication 0..1 MS

* item[product-identifier].linkId = "product-identifier"
* item[product-name].linkId = "product-name"
* item[strength].linkId = "strength"
* item[strength].repeats = true
* item[pharmaceutical-form].linkId = "pharmaceutical-form"
* item[route-of-administration].linkId = "route-of-administration"
* item[route-of-administration].repeats = true
* item[therapeutic-indication].linkId = "therapeutic-indication"
* item[therapeutic-indication].repeats = true

* item.item MS