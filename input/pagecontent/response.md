# Regulatory Questionnaire **Response** – Structure & Guidance

> **For:** Pharmaceutical Regulatory Affairs Teams • Health Authority Reviewers  
> **Goal:** Understand how **responses** are structured in the HL7 FHIR RTQ standard — **no technical background required**

---

## Overview

When a **marketing authorization holder (MAH)** receives a list of questions from a **health authority** (e.g., EMA, FDA, PMDA), they submit a **structured, machine-readable response** using the **RTQ (Response to Regulatory Questions)** FHIR profile.

This resource enables automated routing, tracking, and review management while preserving rich formatting, organizational context, and traceability to the Common Technical Document (CTD) structure.

---

### Purpose & Business Value
- **Standardized Communication**: Ensures consistent, unambiguous response format across sponsors and agencies
- **Automated Workflow**: Enables integration with RIM systems, document management platforms, automation tools, and AI agents
- **Audit Trail**: Full traceability of sender (MAH), recipient (authority), submission date, and coded categorization of each answer
- **Rich Text Support**: Preserves bold, hyperlinks, tables, images, and formatting from standard authoring tools
- **Global Interoperability**: Aligns with ICH, HL7 FHIR, and IDMP standards

---

### Key Elements of a Regulatory Response
<table border="1" style="border-collapse: collapse; width: 100%; border-color: #ddd;">
<thead style="background-color: #f5f5f5;">
<tr>
<th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Element</th>
<th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Purpose</th>
<th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Example</th>
</tr>
</thead>
<tbody>
<tr>
<td style="padding: 8px; border: 1px solid #ddd;"><code>identifier</code></td>
<td style="padding: 8px; border: 1px solid #ddd;">Unique IDs for the response set and regulatory procedure</td>
<td style="padding: 8px; border: 1px solid #ddd;"><code>ID001</code>, <code>EMEA/H/C/005432/II/0023</code></td>
</tr>
<tr>
<td style="padding: 8px; border: 1px solid #ddd;"><code>questionnaire</code></td>
<td style="padding: 8px; border: 1px solid #ddd;">Link to the original question set</td>
<td style="padding: 8px; border: 1px solid #ddd;"><code>RegulatoryQA-ID001</code></td>
</tr>
<tr>
<td style="padding: 8px; border: 1px solid #ddd;"><code>authored</code></td>
<td style="padding: 8px; border: 1px solid #ddd;">Date and time the response was submitted</td>
<td style="padding: 8px; border: 1px solid #ddd;"><code>2025-11-15T14:59:00-05:00</code></td>
</tr>
<tr>
<td style="padding: 8px; border: 1px solid #ddd;"><code>contact</code> (SENDER)</td>
<td style="padding: 8px; border: 1px solid #ddd;">MAH submitting the response with full organizational context</td>
<td style="padding: 8px; border: 1px solid #ddd;">SynthPharma AG, Dr. John Doe, Basel</td>
</tr>
<tr>
<td style="padding: 8px; border: 1px solid #ddd;"><code>contact</code> (RECIPIENT)</td>
<td style="padding: 8px; border: 1px solid #ddd;">Health authority receiving the response</td>
<td style="padding: 8px; border: 1px solid #ddd;">EMA, Dr. Jane Doe, Amsterdam</td>
</tr>
<tr>
<td style="padding: 8px; border: 1px solid #ddd;"><code>item.linkId</code></td>
<td style="padding: 8px; border: 1px solid #ddd;">Matches the original question ID</td>
<td style="padding: 8px; border: 1px solid #ddd;"><code>cmc-1-DP-Stability</code></td>
</tr>
<tr>
<td style="padding: 8px; border: 1px solid #ddd;"><code>item.code</code></td>
<td style="padding: 8px; border: 1px solid #ddd;">CTD section mapping (hierarchical)</td>
<td style=" telle:8px; border: 1px solid #ddd;"><code>3.2.P.8</code> → <code>3.2.P.8.1 Stability Summary</code></td>
</tr>
<tr>
<td style="padding: 8px; border: 1px solid #ddd;"><code>item.text</code></td>
<td style="padding: 8px; border: 1px solid #ddd;">The original question (shown exactly as received)</td>
<td style="padding: 8px; border: 1px solid #ddd;">“Are there any new stability studies conducted…?”</td>
</tr>
<tr>
<td style="padding: 8px; border: 1px solid #ddd;"><code>item.answer.value[x]</code></td>
<td style="padding: 8px; border: 1px solid #ddd;">The MAH's answer in rich text (XHTML)</td>
<td style="padding: 8px; border: 1px solid #ddd;">Includes bold, lists, tables, images, and references</td>
</tr>
</tbody>
</table>

---

### Example Use Case: EMA Type II Variation
**Scenario**: MAH receives 10 questions on stability and labeling during review of a shelf-life extension.

With this profile:
- Original questions are preserved exactly
- Each answer maps to the same CTD section
- Regulatory system auto-routes responses to reviewers
- Submission date is tracked
- Full audit trail from MAH to authority

---

### HTML Presentation Example
The following is an HTML rendering of a FHIR QuestionnaireResponse:  
<a href="responseex1.html">Sample response from MAH to regulator</a>

---

### How to Use This Profile
- **MAH (Sponsor)**: Import questions into RIM system; prepare answers; export as FHIR RTQ Response
- **Health Authority**: Receive structured response; auto-match to original questions; route to reviewers
- **Vendors**: Support structured authoring of answers and export to FHIR-compliant XML or JSON for submission via email, portal, or API  
  [Refer to APIX IG for details](https://build.fhir.org/ig/HL7/APIX---API-Exchange-for-Medicinal-Products/branches/main/index.html)

---

### Related Resources
- [Questionnaire Structure](question-structure.html) – For an overview of the original question format
- [CTD Section Code System](CodeSystem-ctd-categories-full.html) – Full hierarchy
- [Contact Purpose Code System](CodeSystem-contact-purpose.html) – SENDER / RECIPIENT