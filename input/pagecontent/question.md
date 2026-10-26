This page provides a technical outline of the **Regulatory Questionnaire** profile structure. Built on HL7 FHIR R5, this resource enables the structured, machine-readable exchange of regulatory questions (including the accompanying cover letter, questions, supporting attachments, and metadata) while preserving rich formatting and traceability to the Common Technical Document (CTD) structure.

---

### Example

View the example below:
- <a href="examples/sample-question.html" target="_blank">👉 View the Interactive Modern SaaS Dashboard Example</a>
- <a href="Questionnaire-questionnaire-ID001.html" target="_blank">View the Regulatory Questionnaire example</a>
- <a href="Questionnaire-questionnaire-ID001.json.html" target="_blank">View the underlying Regulatory Questionnaire code (JSON)</a>

---

### Key Elements of a Regulatory Question

The following table is a simplified view of the key elements of a regulatory question. It maps the technical components of a regulatory question to their implementation in the **RTQ Questionnaire** profile. This breakdown details the required data structures for CTD section mapping, rich-text rendering, and participant identification.

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
      <td style="padding: 8px; border: 1px solid #ddd;">Unique IDs of the question set. Slices: <code>regulator-id</code> (Mandatory) and <code>company-id</code> (Optional). Note: identifiers identify the <em>artifact</em>, not the organizations — the parties are identified by the contact elements. The regulatory <em>procedure</em> number is carried separately in the procedure-identifier extension.</td>
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
      <td style="padding: 8px; border: 1px solid #ddd;">The resource type(s) the questions are about — normally <code>MedicinalProductDefinition</code>. (Per FHIR R5 this element carries resource type codes; the questionnaire type and procedure are carried by <code>code</code> and the procedure-identifier extension below.)</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>code</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..*</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Type of regulatory questionnaire (e.g., <code>list-of-questions</code>, <code>information-request</code>, <code>deficiency-letter</code>) from the RTQ Questionnaire Type CodeSystem.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>extension</code> (procedureIdentifier)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">0..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">The <strong>regulator-assigned procedure number</strong> (e.g., <code>NRA/H/C/005432/II/0023</code>) linking this question set to the regulatory procedure instance it belongs to.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>extension</code> (regulatedContext)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">0..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Product and marketing-authorisation context: references or identifiers for the <code>MedicinalProductDefinition</code> and <code>RegulatedAuthorization</code> concerned, enabling automatic matching in RIM systems.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>extension</code> (dueDate)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">0..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Canonical due-date model: the original due date plus any negotiated due dates (the latest negotiated date is the current one).</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>extension</code> (inResponseTo)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">0..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">For follow-up rounds: references the prior <code>QuestionnaireResponse</code> that triggered this question set. See <a href="lifecycle.html">Lifecycle &amp; Versioning</a>.</td>
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
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.code</code> (category)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..*</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>At least one</strong> category code per question. Categories are regulator-defined: CTD section codes (e.g., <code>3.2.P.8.1</code>) and the regulatory significance codes (<code>major-objection</code>, <code>minor-concern</code>, <code>other-consideration</code>, <code>commitment</code>) are preferred, but a regulator may use its own code system, and non-CTD product domains (e.g., devices) use their own. A question may carry several categories.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.code</code> (assessment)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">0..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Follow-up rounds only: the regulator's assessment of the previous response to this question: <code>resolved</code>, <code>not-resolved</code>, or <code>further-questions</code>. See <a href="lifecycle.html">Lifecycle &amp; Versioning</a>.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.required</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>true</code> for every open question, so every question must be answered. <code>false</code> only for a question re-issued as <code>resolved</code>, which needs no further answer.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.extension</code> (itemReference)</td>
      <td style="padding: 8px; border: 1px solid #ddd;">0..*</td>
      <td style="padding: 8px; border: 1px solid #ddd;">Inline extension to explicitly attach an <strong>RTQ DocumentReference</strong> to this specific question.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>item.text</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">1..1</td>
      <td style="padding: 8px; border: 1px solid #ddd;">The question text. <strong>Requires</strong> the <code>rendering-xhtml</code> extension for formatted content like tables or lists.</td>
    </tr>
  </tbody>
</table>