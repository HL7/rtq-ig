This page provides a technical outline of the **Regulatory Questionnaire Response** profile structure. Built on HL7 FHIR R5, this resource enables the structured, machine-readable exchange of answers from a Marketing Authorization Holder (MAH) back to a regulator.

---

### Example: EMA Regulatory Response

The following demonstrates a **synthetic regulatory questionnaire response** submitted by a marketing authorization holder (MAH) during a Type II variation procedure.

#### [NEW] [HTML presentation sample](assets/response-sample.html)

<div class="markdown-alert markdown-alert-tip">
<p class="markdown-alert-title">Tip</p>
<p><strong>Open the sample in a new tab</strong> to experience the full "Modern SaaS" dashboard layout:</p>
<p><a href="assets/response-sample.html" target="_blank">Sample response from a market authorization to a regulator (Full Page)</a></p>
</div>


#### FHIR Integration Highlights

*   **Traceable Answers**: Each answer maps to a `QuestionnaireResponse.item` with a `linkId` matching the original question (e.g., `"1"`).
*   **Response Context**: Explicitly links to the original `Questionnaire` and includes a submission timestamp.
*   **Rich Content**: Supports rich text answers (via extension), updated ePI translations, and technical data like climatic zone confirmation.
*   **Attachments**: References supporting documents (e.g., PDFs) using the APIX DocumentReference profile.

[View the underlying FHIR QuestionnaireResponse resource (GitHub)](https://raw.githubusercontent.com/HL7/rtq-ig/main/input/examples/Example-QuestionnaireResponse.json)

---

### Key Elements of a Regulatory Response

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
      <td style="padding: 8px; border: 1px solid #ddd;">Fixed to <code>http://hl7.org/fhir/uv/rtq/StructureDefinition/rtq-questionnaireresponse</code> to ensure conformance and API routing.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>identifier</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..2</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Unique IDs. Slices: <code>regulator-id</code> (Mandatory) and <code>company-id</code> (Optional).</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>questionnaire</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Canonical reference to the original <code>rtq-questionnaire</code> being answered.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>status</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Lifecycle state (e.g., <code>completed</code> for final submissions).</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>text</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Human-readable narrative (XHTML) containing the overview of the whole response.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>author</code> (SENDER/MAH)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">The Marketing Authorization Holder or applicant providing the response.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.linkId</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Matches the <code>linkId</code> of the corresponding question in the source Questionnaire.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.answer.extension</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">The answer text. <strong>Requires</strong> the <code>rendering-xhtml</code> extension for formatted content like tables or lists.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.answer.valueReference</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">0..*</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Reference to supporting documents (e.g., PDFs) using the <strong>APIX DocumentReference</strong> profile.</td>
    </tr>
  </tbody>
</table>