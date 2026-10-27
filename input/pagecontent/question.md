{% include rtq-style.html %}

The **RTQ Questionnaire** profile defines a regulatory question set: the cover letter, the individual questions, supporting attachments, and metadata, with rich formatting preserved. Full definition: [RTQ Questionnaire profile](StructureDefinition-rtq-questionnaire.html).

<div class="rtq-two">
  <div class="rtq-card">
    <div class="t">✓ Minimum to conform</div>
    <ul class="rtq-check">
      <li><code>meta.profile</code> set to the RTQ Questionnaire profile</li>
      <li>A canonical <code>url</code>, a regulator-issued identifier, and a business <code>version</code></li>
      <li><code>status</code>, issue <code>date</code>, and the cover letter as rich text in <code>text</code></li>
      <li>A questionnaire type in <code>code</code> and <code>subjectType</code> (e.g., MedicinalProductDefinition)</li>
      <li>Two contacts, sender and recipient, each with a name, email, and (recipient) phone</li>
      <li>One <code>item</code> per question: unique <code>linkId</code>, at least one category code, <code>required = true</code>, and the question text</li>
    </ul>
  </div>
  <div class="rtq-card soft">
    <div class="t">Examples</div>
    <p>The three question sets in the worked example, from first round to closure:</p>
    <ul>
      <li><a href="Questionnaire-questionnaire-ID001.html">ID001</a>: round 1, ten questions</li>
      <li><a href="Questionnaire-questionnaire-ID001-round2.html">ID001-R2</a>: assessment outcomes and follow-up questions</li>
      <li><a href="Questionnaire-questionnaire-ID001-round3.html">ID001-R3</a>: closing set, all resolved</li>
    </ul>
    <p style="margin-top:10px"><a class="more" href="examples/sample-question.html" target="_blank">Interactive question example →</a><br/><a class="more" href="examples/sample-lifecycle.html" target="_blank">Lifecycle walkthrough →</a></p>
  </div>
</div>

Everything beyond the minimum, such as product and procedure context, due dates, and attachments, is optional but Must-Support: systems that have the information populate it, and receiving systems use it when present.

<div class="rtq-sec" id="key-elements">Key elements</div>

<table class="rtq-table">
  <thead><tr><th>Element</th><th>Card.</th><th>Purpose</th></tr></thead>
  <tbody>
    <tr class="grp"><td colspan="3">Identity and version</td></tr>
    <tr><td><code>url</code></td><td>1..1</td><td>Canonical URL of the question set. The response points to it in <code>questionnaire</code>; an amended version points to the one it replaces in <code>derivedFrom</code>.</td></tr>
    <tr><td><code>identifier</code></td><td>1..2</td><td>Identifies the question set (not the organizations). <code>regulator-id</code> is mandatory; <code>company-id</code> is optional.</td></tr>
    <tr><td><code>version</code></td><td>1..1</td><td>Business version, e.g., <code>1.0</code>. An amended question set is a new version linked by <code>derivedFrom</code>.</td></tr>
    <tr><td><code>code</code></td><td>1..*</td><td>Questionnaire type: <code>list-of-questions</code>, <code>information-request</code>, <code>deficiency-letter</code>, and others.</td></tr>
    <tr><td><code>date</code>, <code>status</code></td><td>1..1</td><td>Issue date and FHIR publication status.</td></tr>
    <tr><td><code>text</code></td><td>1..1</td><td>The cover letter, as rich text (<code>status = additional</code>). No separate cover letter document is needed.</td></tr>
    <tr class="grp"><td colspan="3">Context and dates</td></tr>
    <tr><td><code>extension</code> (procedureIdentifier)</td><td>0..1</td><td>Regulator-assigned procedure number, e.g., <code>NRA/H/C/005432/II/0023</code>. The same number groups every round.</td></tr>
    <tr><td><code>extension</code> (regulatedContext)</td><td>0..1</td><td>The product and marketing authorization concerned, as a reference (<code>MedicinalProductDefinition</code>, <code>RegulatedAuthorization</code>) or an identifier (e.g., MPID, MA number).</td></tr>
    <tr><td><code>extension</code> (dueDate)</td><td>0..1</td><td>Original due date plus any negotiated due dates; the latest negotiated date is current. Omitted on a closing question set.</td></tr>
    <tr><td><code>extension</code> (inResponseTo)</td><td>0..1</td><td>Follow-up rounds: the response this question set assesses.</td></tr>
    <tr><td><code>subjectType</code></td><td>1..*</td><td>Resource type the questions are about, normally <code>MedicinalProductDefinition</code>.</td></tr>
    <tr class="grp"><td colspan="3">Parties</td></tr>
    <tr><td><code>contact</code> (sender)</td><td>1..1</td><td>The issuing authority: name, email, and optionally phone.</td></tr>
    <tr><td><code>contact</code> (receiver)</td><td>1..1</td><td>The MAH or applicant: name, email, phone.</td></tr>
    <tr class="grp"><td colspan="3">Questions</td></tr>
    <tr><td><code>item.linkId</code></td><td>1..1</td><td>Unique question identifier. Stays the same in every round; follow-up questions extend it (e.g., <code>quality-4.1</code>).</td></tr>
    <tr><td><code>item.text</code></td><td>1..1</td><td>The question wording, with the <code>rendering-xhtml</code> extension for tables, lists, and other formatting.</td></tr>
    <tr><td><code>item.code</code> (category)</td><td>1..*</td><td>At least one regulator-defined category code. CTD sections and the RTQ significance codes (e.g., <code>major-objection</code>) are preferred; regulators may use their own. See <a href="terminology.html">Terminology</a>.</td></tr>
    <tr><td><code>item.code</code> (assessment)</td><td>0..1</td><td>Follow-up rounds only: <code>resolved</code>, <code>not-resolved</code>, or <code>further-questions</code>. See <a href="lifecycle.html#assessment-of-responses">Lifecycle</a>.</td></tr>
    <tr><td><code>item.required</code></td><td>1..1</td><td><code>true</code> for every open question; <code>false</code> only for a question marked <code>resolved</code>.</td></tr>
    <tr><td><code>item.item</code></td><td>0..*</td><td>Nested items: parts of a multi-part question, follow-up questions under a <code>further-questions</code> outcome, or a display item with the assessor's comment.</td></tr>
    <tr><td><code>item.extension</code> (itemReference)</td><td>0..*</td><td>Supporting content for the question: an RTQ DocumentReference, or existing FHIR content such as an ePI Bundle, Composition, or MedicinalProductDefinition.</td></tr>
  </tbody>
</table>
