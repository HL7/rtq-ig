This page contains an example of a structured question from a regulator to a Market Authorization Holder. The example scenario is based on a European EMA application. However, it is designed to work with any question from any international regulator.

---

## EMA Regulatory Question – Type II Variation (List of Questions)

**Scenario:**  
This example represents **a real-world regulatory question issued by the European Medicines Agency (EMA)** as part of a **List of Questions (LOQ)** during the assessment of a **Type II variation application** for a medicinal product.

It illustrates how a health authority structures a formal question to a Market Authorization Holder using FHIR.

**Key Features Demonstrated:**

* **Rich-text question formatting** via the `questionnaire-itemRichText` extension (bold, links, tables, etc.)  
* **Hierarchical CTD classification** using the `ctd-categories-full` CodeSystem  
* **Complete regulator contact block** with email-signature-style formatting  
* **Full conformance** to the `RegulatoryQuestionnaire` profile  

**Resource Type:** `Questionnaire`  
**Profile:** [`RegulatoryQuestionnaire`](StructureDefinition-RegulatoryQuestionnaire.html)  
**Code System:** [`ctd-categories-full`](CodeSystem-ctd-categories-full.html)

---

**Next Step:** See the **[Response to Questions](response.md)** page for a matching `QuestionnaireResponse` example from the sponsor.

```xml

```