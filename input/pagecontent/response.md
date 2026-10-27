{% include rtq-style.html %}

The **RTQ QuestionnaireResponse** profile defines the response a marketing authorization holder (MAH) or applicant returns to a question set: the cover letter, one answer per open question, supporting attachments, commitments, and metadata. Full definition: [RTQ QuestionnaireResponse profile](StructureDefinition-rtq-questionnaireresponse.html).

<div class="rtq-two">
  <div class="rtq-card">
    <div class="t">✓ Minimum to conform</div>
    <ul class="rtq-check">
      <li><code>meta.profile</code> set to the RTQ QuestionnaireResponse profile</li>
      <li>Both identifiers: your own response ID and the regulator's question set ID, and the <code>language</code></li>
      <li><code>questionnaire</code>: the canonical URL of the question set being answered</li>
      <li><code>status</code>, <code>authored</code> date, and the cover letter as rich text in <code>text</code></li>
      <li><code>author</code> and <code>source</code>: your organization (the MAH or applicant)</li>
      <li>One answer item for every open question, matched by <code>linkId</code></li>
    </ul>
  </div>
  <div class="rtq-card soft">
    <div class="t">Examples</div>
    <p>The two responses in the worked example:</p>
    <ul>
      <li><a href="QuestionnaireResponse-questionnaireresponse-ID001.html">SP-RTQ-2025-0148</a>: answers all ten round-1 questions; offers a commitment</li>
      <li><a href="QuestionnaireResponse-questionnaireresponse-ID001-round2.html">SP-RTQ-2025-0163</a>: answers only the open round-2 questions; offers a second commitment</li>
    </ul>
    <p style="margin-top:10px"><a class="more" href="examples/sample-response.html" target="_blank">Interactive response example →</a><br/><a class="more" href="examples/sample-lifecycle.html" target="_blank">Lifecycle walkthrough →</a></p>
  </div>
</div>

<div class="rtq-sec" id="key-elements">Key elements</div>

<table class="rtq-table">
  <thead><tr><th>Element</th><th>Card.</th><th>Purpose</th></tr></thead>
  <tbody>
    <tr class="grp"><td colspan="3">Identity, version, and context</td></tr>
    <tr><td><code>identifier</code></td><td>2..2</td><td>Both mandatory: <code>company-id</code> (your ID for the response) and <code>regulator-id</code> (echoed from the question set).</td></tr>
    <tr><td><code>language</code></td><td>1..1</td><td>Language of the response, as a BCP 47 code (e.g., <code>en</code>, <code>fr</code>, <code>de</code>).</td></tr>
    <tr><td><code>questionnaire</code></td><td>1..1</td><td>Canonical URL of the question set being answered, including its round (e.g., ID001-R2).</td></tr>
    <tr><td><code>extension</code> (responseVersion)</td><td>0..1</td><td>Business version, e.g., <code>1.0</code>. A supplement is a new version with status <code>amended</code>.</td></tr>
    <tr><td><code>extension</code> (procedureIdentifier)</td><td>0..1</td><td>The procedure number, echoed from the question set.</td></tr>
    <tr><td><code>subject</code></td><td>0..1</td><td>The product the response is about (e.g., a <code>MedicinalProductDefinition</code>). The full product and authorization context is on the question set.</td></tr>
    <tr><td><code>status</code></td><td>1..1</td><td><code>in-progress</code>, <code>completed</code>, <code>amended</code>, <code>stopped</code>, or <code>entered-in-error</code>.</td></tr>
    <tr><td><code>authored</code></td><td>1..1</td><td>Date the response was finalized.</td></tr>
    <tr><td><code>text</code></td><td>1..1</td><td>The cover letter, as rich text (<code>status = additional</code>). No separate cover letter document is needed.</td></tr>
    <tr><td><code>author</code>, <code>source</code></td><td>1..1</td><td>The MAH or applicant that prepared and answered the response. The regulator is identified on the question set.</td></tr>
    <tr class="grp"><td colspan="3">Answers</td></tr>
    <tr><td><code>item.linkId</code></td><td>1..1</td><td>The <code>linkId</code> of the question being answered. <strong>Every open question must have an answer</strong>; questions marked <code>resolved</code> need none.</td></tr>
    <tr><td><code>item.answer.valueString</code></td><td>0..*</td><td>The answer as text, with the <code>rendering-xhtml</code> extension on the string for tables, lists, and formatting. A group carries nested items instead; invariant <code>rtq-qr-1</code> requires one or the other. Where there is nothing substantive to say, answer explicitly (e.g., "No response required.").</td></tr>
    <tr><td><code>item.item</code></td><td>0..*</td><td>Answers to follow-up questions or parts of a multi-part question, nested under the parent question.</td></tr>
    <tr><td><code>item.extension</code> (itemReference)</td><td>0..*</td><td>Supporting content for the answer, as an RTQ DocumentReference. The same extension carries supporting content on questions.</td></tr>
    <tr><td><code>item.extension</code> (commitment)</td><td>0..1</td><td>A commitment offered in this answer: what will be done and, optionally, by when. The regulator accepts it by marking the question <code>resolved</code> in the next round. See <a href="lifecycle.html#commitments">Lifecycle</a>.</td></tr>
  </tbody>
</table>

<div class="rtq-sec" id="attachments">Attachments and large documents</div>

Supporting documents attach to answers and to questions with the <a href="StructureDefinition-rtq-item-reference.html">rtq-item-reference</a> extension, pointing to the [RTQ DocumentReference](StructureDefinition-rtq-documentreference.html) profile. All documents are handled the same way whatever their purpose; the document's `type` and `category` say what it is.

<div class="rtq-grid rtq-g3">
  <div class="rtq-card soft"><div class="t">Up to about 10 MB: embed</div><p>Include the document in the file itself (<code>attachment.data</code>).</p></div>
  <div class="rtq-card soft"><div class="t">Larger: point to it</div><p>Reference the document by URL (<code>attachment.url</code>) in a repository both parties can reach, such as a submission portal or shared document store. Strongly preferred for very large datasets.</p></div>
  <div class="rtq-card soft"><div class="t">Existing structured content: point to it</div><p>Structured content such as an ePI is attached the same way: the DocumentReference attachment points to it (e.g., the ePI Bundle URL with content type <code>application/fhir+json</code>). In a decentralized exchange, make sure the receiver can resolve the URL, or embed the content.</p></div>
</div>

The 10 MB threshold is guidance, not a conformance rule, and any file format can be attached. Over time the direction is from binary attachments toward structured data, in collaboration with the HL7 PQI project. CMC and manufacturing experts are invited to share real-world content, such as large stability datasets, to test this guidance.
