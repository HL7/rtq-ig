# Regulatory Questions (Questionnaire)

The **Regulatory Questionnaire** profile defines a structured, machine-readable format for **regulatory questions** issued by a health authority (e.g., EMA, FDA) to a marketing authorization holder (MAH) during the review of a regulatory submission such as a **Type II Variation**, **NDA**, or **MAA**.

This resource enables **automated routing, tracking, and response management** while preserving rich formatting, organizational context, and traceability to the **Common Technical Document (CTD)** structure.

---

## Purpose & Business Value

| Benefit | Description |
|--------|-------------|
| **Standardized Communication** | Eliminates ambiguity in question format across agencies and sponsors |
| **Automated Workflow** | Enables integration with eCTD systems, RIM, and document management platforms |
| **Audit Trail** | Full traceability of sender, recipient, deadlines, and CTD section linkage |
| **Rich Text Support** | Preserves bolding, hyperlinks, tables, and formatting from regulator tools |
| **Global Interoperability** | Aligns with ICH, HL7 FHIR, and IDMP standards |

---

## Key Elements of a Regulatory Question

| Element | Purpose | Example |
|--------|--------|--------|
| **`identifier`** | Unique IDs for the **question set** and **regulatory procedure** | `ID001`, `EMEA/H/C/005432/II/0023` |
| **`title`** | Human-readable summary of the question set | `Responses to Question Set ID001` |
| **`effectivePeriod`** | Deadline for sponsor response | `2025-11-11` to `2025-12-11` |
| **`contact` (SENDER)** | Issuing **health authority** with full organizational context | EMA, Dr. Jane Doe, Amsterdam HQ |
| **`contact` (RECIPIENT)** | **MAH** responsible for response | SynthPharma AG, Dr. John Doe, Basel |
| **`item.linkId`** | Unique question identifier within the set | `cmc-1-DP-Stability` |
| **`item.code`** | **CTD section mapping** (hierarchical) | `3.2.P.8` to `3.2.P.8.1 Stability Summary` |
| **`item.text`** | The **regulatory question** in **rich text** (XHTML) | Includes bold, links, tables, and references |
| **`contact-signature` extension** | **Email-style signature block** with name, title, org, and contact info | Preserves official formatting |

---

## Example Use Case: EMA Type II Variation

> **Scenario**: EMA issues 10 questions on stability and labeling during review of a shelf-life extension.

**With this profile**:
- Questions are **machine-readable**
- Each maps to **CTD section** (e.g., `3.2.P.8.1`)
- Sponsor system **auto-routes** to CMC and labeling teams
- Response deadline is **enforced**
- Full **audit trail** from EMA to MAH

---

## How to Use This Profile

| Role | Action |
|------|--------|
| **Health Authority** | Generate Questionnaire from review tool; include rich text and CTD codes |
| **MAH (Sponsor)** | Import into RIM system; assign owners; link responses via `QuestionnaireResponse` |
| **Vendors** | Support structured authoring of the question and export to a FHIR-compliant XML or JSON file for submission via email or portal; or incorporate into a `Task` resource for submission via API [Refer to the API Exchange for Medicinal Products (APIX) IG](https://build.fhir.org/ig/HL7/APIX---API-Exchange-for-Medicinal-Products/branches/main/index.html) for further details.|

---

## Related Resources

- [QuestionnaireResponse Profile](questionnaireresponse.html) – For structured sponsor replies
- [CTD Section Code System](codesystem-ctd-section.html) – Full hierarchy
- [Contact Purpose Code System](codesystem-contact-purpose.html) – SENDER / RECIPIENT

