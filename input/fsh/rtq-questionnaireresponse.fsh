Profile: RegulatoryQuestionnaireResponse
Parent: QuestionnaireResponse
Id: rtq-questionnaireresponse
Title: "Regulatory Questionnaire Response"
Description: """
A QuestionnaireResponse constrained for regulatory Q&A use in biopharmaceutical and life sciences submissions.
"""

* identifier 0..1 MS
* questionnaire 1..1 MS
* status 1..1 MS
* subject 1..1 MS
* subject only Reference(MedicinalProductDefinition or PackagedProductDefinition)
* authored 1..1 MS
* author 1..1 MS
* source 0..1 MS

// Closed slicing on top-level items by linkId – enforces regulatory structure
* item ^slicing.discriminator.type = #value
* item ^slicing.discriminator.path = "linkId"
* item ^slicing.rules = #closed
* item ^slicing.ordered = false

* item contains
    product-identifier 1..1 MS and
    product-name 0..1 MS and
    strength 0..* MS and
    pharmaceutical-form 0..1 MS and
    route-of-administration 0..* MS and
    therapeutic-indication 0..* MS

* item[product-identifier].linkId = "product-identifier"
* item[product-name].linkId = "product-name"
* item[strength].linkId = "strength"
* item[pharmaceutical-form].linkId = "pharmaceutical-form"
* item[route-of-administration].linkId = "route-of-administration"
* item[therapeutic-indication].linkId = "therapeutic-indication"

* item.item MS
* item.answer MS