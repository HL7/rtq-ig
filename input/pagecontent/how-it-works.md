{% include rtq-style.html %}

This page shows what a regulatory question set and its response contain, part by part, and how the RTQ resources fit together. No FHIR knowledge is needed for Parts 1 and 2.

<div class="rtq-sec" id="question">Part 1: The question set</div>

When a health authority has questions about a submission, it sends a structured **question set** to the marketing authorization holder (MAH) or applicant.

<div class="rtq-anno">
  <div class="rtq-doc">
    <div class="rtq-part a">
      <div class="k">A · Question set metadata</div>
      <strong>ID001</strong> · version 1.0 · List of Questions · issued 2025-11-11<br/>
      Due 2025-12-11 <span style="color:#6b7280">(negotiated dates can be added)</span><br/>
      Procedure NRA/H/C/005432/II/0023 · product MPID-EX-000123
    </div>
    <div class="rtq-part b">
      <div class="k">B · Cover letter (rich text, inside the file)</div>
      Please find enclosed the List of Questions for the Type II variation for ExampleDrug 10 mg Tablets. Responses are required by the due date above.
    </div>
    <div class="rtq-part c">
      <div class="k">C · Sender &amp; recipient</div>
      <strong>National Regulatory Authority</strong> (sender) → <strong>SynthPharma AG</strong> (recipient)
    </div>
    <div class="rtq-part d">
      <div class="k">D · Individual questions</div>
      <div class="rtq-mini">
        <div class="top"><span><span class="rtq-chip">CTD 3.2.P.5.4 Impurities</span><span class="rtq-chip cat">Major Objection</span></span><code>quality-4</code></div>
        <div class="q">Are there any new degradation products identified within the newly submitted data?</div>
        <div class="s">Required · 📎 optional attachment or ePI reference</div>
      </div>
      <div class="s" style="color:#94a3b8;font-style:italic;margin-top:6px;">+ every other question follows the same structure</div>
    </div>
    <div class="rtq-part e">
      <div class="k">E · Assessment (follow-up rounds only)</div>
      <div class="rtq-mini">
        <div class="top"><code>quality-4</code><span class="rtq-badge fq">Further questions</span></div>
        <div class="s">quality-4.1 and quality-4.2 follow under the original question</div>
      </div>
    </div>
  </div>
  <div class="rtq-labels">
    <div class="rtq-lab"><div class="dot" style="background:#2563eb">A</div><div><div class="h">Metadata</div><p>A unique ID, version, type, issue date, and due date, with any negotiated extensions. The procedure number and the product or marketing authorization concerned let the company's system file it against the right records automatically.</p></div></div>
    <div class="rtq-lab"><div class="dot" style="background:#16a34a">B</div><div><div class="h">Cover letter, built in</div><p>A rich-text field inside the question set carries the cover letter content: context, instructions, and overall comments, with tables, lists, and other formatting. <strong>No separate cover letter document is needed</strong>: the question set is self-contained.</p></div></div>
    <div class="rtq-lab"><div class="dot" style="background:#ca8a04">C</div><div><div class="h">Sender &amp; recipient</div><p>The authority and the MAH or applicant, each with contact details. One question set goes to one company.</p></div></div>
    <div class="rtq-lab"><div class="dot" style="background:#9333ea">D</div><div><div class="h">Questions</div><p>Each question is a discrete item with a unique <strong>linkId</strong>, one or more <strong>category tags</strong> set by the regulator (for example a CTD section and "major objection"), rich-text wording, and optional attachments or references to existing content such as the ePI.</p></div></div>
    <div class="rtq-lab"><div class="dot" style="background:#ea580c">E</div><div><div class="h">Assessment</div><p>In follow-up rounds, each question also carries the regulator's verdict on the previous answer: resolved, not resolved, or raising further questions. See <a href="lifecycle.html">Lifecycle</a>.</p></div></div>
    <div><a class="rtq-btn" href="examples/sample-question.html" target="_blank">View the interactive question example</a></div>
  </div>
</div>

<hr class="rtq-hr"/>

<div class="rtq-sec" id="response">Part 2: The response</div>

The MAH or applicant sends back a structured **response** in which every answer is linked to its question.

<div class="rtq-anno">
  <div class="rtq-doc">
    <div class="rtq-part a">
      <div class="k">A · Response metadata</div>
      <strong>SP-RTQ-2025-0148</strong> (company ID) · answers <strong>ID001</strong> (regulator ID)<br/>
      Version 1.0 · completed · authored 2025-11-18<br/>
      Procedure NRA/H/C/005432/II/0023
    </div>
    <div class="rtq-part b">
      <div class="k">B · Cover letter (rich text, inside the file)</div>
      Please find enclosed SynthPharma AG's responses to the List of Questions ID001, with supporting documents attached where applicable.
    </div>
    <div class="rtq-part c">
      <div class="k">C · Sender &amp; recipient</div>
      <strong>SynthPharma AG</strong> (author) → <strong>National Regulatory Authority</strong>
    </div>
    <div class="rtq-part d">
      <div class="k">D · Answers</div>
      <div class="rtq-mini">
        <div class="top"><code>quality-1</code><span class="s">answers question quality-1</span></div>
        <div class="q">Are there any new stability studies, or only additional timepoints?</div>
        <div class="s" style="margin-top:4px;color:#1e293b">Both: 36-month data for batches A-001 to A-003, and new studies for pilot batches in the Alu/Alu pack.</div>
        <div class="s">📎 Stability_Summary_Report.pdf · 📊 Stability_Data_Tables.xlsx</div>
      </div>
    </div>
    <div class="rtq-part e">
      <div class="k">E · Commitments</div>
      <div class="rtq-mini">
        <div class="top"><code>quality-1</code><span class="s">due 2027-06-30</span></div>
        <div class="s" style="color:#1e293b">Submit 48-month stability results for batches A-001, A-002 and A-003.</div>
      </div>
    </div>
  </div>
  <div class="rtq-labels">
    <div class="rtq-lab"><div class="dot" style="background:#2563eb">A</div><div><div class="h">Metadata</div><p>The company's own ID for the response plus the regulator's question set ID, a version, status, and date. The response points to the exact question set it answers.</p></div></div>
    <div class="rtq-lab"><div class="dot" style="background:#16a34a">B</div><div><div class="h">Cover letter, built in</div><p>The same rich-text field carries the company's cover letter content: introduction, overall remarks, and cross-references. <strong>No separate cover letter document is needed</strong>: the response is self-contained.</p></div></div>
    <div class="rtq-lab"><div class="dot" style="background:#ca8a04">C</div><div><div class="h">Sender &amp; recipient</div><p>The roles reverse: the MAH or applicant authors and sends the response.</p></div></div>
    <div class="rtq-lab"><div class="dot" style="background:#9333ea">D</div><div><div class="h">Answers</div><p><strong>Every open question gets an answer</strong>, matched by linkId, even if the answer is "No response required." Answers support rich text, attachments, and references to existing content.</p></div></div>
    <div class="rtq-lab"><div class="dot" style="background:#ea580c">E</div><div><div class="h">Commitments</div><p>When an answer includes a commitment, it is flagged on that answer with what will be done and by when. The regulator accepts it in the next round.</p></div></div>
    <div><a class="rtq-btn" href="examples/sample-response.html" target="_blank">View the interactive response example</a></div>
  </div>
</div>

<hr class="rtq-hr"/>

<div class="rtq-sec" id="pieces">Part 3: How the pieces fit</div>

<div class="rtq-figure">
  <img src="rtq-architecture.svg" width="900" alt="RTQ resource relationships. The RTQ Questionnaire (question set from the regulator, with category codes and, in follow-up rounds, an assessment outcome per question) and the RTQ QuestionnaireResponse (response set from the MAH, one answer per question, with commitments) are linked by a canonical reference, with answers matched by linkId. A follow-up question set points to the response it assesses through rtq-in-response-to. Both link to RTQ DocumentReference for attachments, and through optional context extensions to MedicinalProductDefinition, RegulatedAuthorization, the regulatory procedure identifier, and ePI content. A transport band shows email, portal, eCTD, central platform and APIX as interchangeable channels."/>
</div>

The core is a pair of resources. The **RTQ Questionnaire** (the question set) and the **RTQ QuestionnaireResponse** (the response) are linked at two levels: the response names the question set it answers, and each answer carries the `linkId` of its question. **RTQ DocumentReference** carries attachments on either side. Optional context links connect both to the product (`MedicinalProductDefinition`), the marketing authorization (`RegulatedAuthorization`), and the procedure number, so receiving systems can file them without manual matching. In follow-up rounds, each new question set points back to the response it assesses (`rtq-in-response-to`), which keeps the whole thread together.

<div class="rtq-two">
  <div class="rtq-in">
    <div class="h">RTQ specifies</div>
    <ul>
      <li>The structure of question sets and responses</li>
      <li>Identifiers, versions, dates, and due dates</li>
      <li>Category codes, assessment outcomes, and commitments</li>
      <li>The links between questions, answers, rounds, attachments, and context</li>
    </ul>
  </div>
  <div class="rtq-out">
    <div class="h">Your applications decide</div>
    <ul>
      <li>How files are exchanged (email, portal, eCTD, platform, API)</li>
      <li>Routing, task assignment, review, and approval</li>
      <li>Reminders, search, dashboards, analytics, and use of AI</li>
      <li>Tracking and fulfilment of commitments after the exchange</li>
    </ul>
  </div>
</div>

**For RIM system vendors**, the intended integration is:

1. **Inbound:** use the procedure number and product context to file the question set against the right records, category codes to route and prioritize each question, and assessment outcomes to see what is still open.
2. **Outbound:** answer every open question by `linkId`, attach supporting documents, flag commitments, set your own response ID and version, and echo the regulator's IDs.
3. **Status:** a response moves from `in-progress` to `completed`, and to `amended` for supplements. The regulator's verdict on each answer arrives in the next question set, not as a response status.
