This page provides a technical outline of the **Regulatory Questionnaire** profile structure. Built on HL7 FHIR R5, this resource enables the structured, machine-readable exchange of regulatory questions while preserving rich formatting and traceability to the Common Technical Document (CTD) structure.

---

### Example: EMA Regulatory Question

The following demonstrates a synthetic regulatory questionnaire issued during a Type II variation procedure.

#### [NEW] [HTML presentation sample](question-sample.html)

<div class="markdown-alert markdown-alert-tip">
<p class="markdown-alert-title">Tip</p>
<p><strong>Open the sample in a new tab</strong> to experience the full "Modern SaaS" dashboard layout with sticky navigation:</p>
<p><a href="question-sample.html" target="_blank">Sample question from a regulator to a market authorization holder (Full Page)</a></p>
</div>

### Interactive Dashboard Preview
The following is a live preview of the questionnaire dashboard. You can interact with the navigation links below to see how a regulator presents questions to a manufacturer.

<div style="border: 1px solid #ddd; border-radius: 8px; overflow: hidden; margin-top: 15px;">
  <div style="background-color: #f8f9fa; padding: 10px; border-bottom: 1px solid #ddd; font-weight: bold;">
    Live Dashboard Fragment
  </div>
  <div style="padding: 0; height: 800px; background-color: white;">
    <iframe src="question-sample.html" style="width: 100%; height: 100%; border: none;"></iframe>
  </div>
</div>

#### FHIR Integration Highlights

*   **CTD Mapping**: Each question maps to a `Questionnaire.item` with a `linkId` (e.g., `"1"`) and a CTD section code.
*   **Rich Text**: Employs the `rendering-xhtml` extension to support bold text, tables, and links within questions.
*   **Organizational Context**: Includes detailed contact information for both the regulator (Sender) and MAH (Recipient).
*   **Traceability**: Links directly to the regulatory procedure via business identifiers.

[View the underlying FHIR Questionnaire resource (GitHub)](https://raw.githubusercontent.com/HL7/rtq-ig/main/input/examples/Example-Questionnaire.json)

---

### Key Elements of a Regulatory Question

<table border="1" style="border-collapse: collapse; width: 100%; border-color: #ddd;">
  <thead style="background-color: #f5f5f5;">
    <tr>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Element</th>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Cardinality</th>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Purpose / Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>meta.profile</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Fixed to <code>http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-questionnaire</code> to ensure conformance and API routing.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>identifier</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..2</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Unique IDs. Slices: <code>regulator-id</code> (Mandatory) and <code>company-id</code> (Optional).</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>version</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">The business version of the questionnaire set (e.g., "1.0").</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>text</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Human-readable narrative (XHTML) containing the summary of the question set.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>subjectType</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..*</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Coded context of the regulatory procedure (e.g., <code>variation-type-ii</code>).</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>contact</code> (SENDER)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Issuing health authority (Regulator) with full organizational IDs, address, and primary contact info.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>contact</code> (RECEIVER)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">The pharmaceutical MAH or applicant expected to respond.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.code</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..*</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>Mandatory</strong> CTD section mapping (e.g., <code>3.2.P.8.1</code>) using the RTQ CTD Categories CodeSystem.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.text</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">The question text. <strong>Requires</strong> the <code>rendering-xhtml</code> extension for formatted content like tables or lists.</td>
    </tr>
  </tbody>
</table>