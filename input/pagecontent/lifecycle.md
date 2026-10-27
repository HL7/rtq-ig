{% include rtq-style.html %}

<div class="rtq-callout violet">
  <div class="ic">▶️</div>
  <div>
    <div class="h">Walk through a complete thread</div>
    <p>Follow one Type II variation from the first ten questions to closure: answers, assessment outcomes, follow-up questions, two commitments, and the closing question set, with a tracker showing every question's status at each step.</p>
    <p><a class="rtq-btn alt" href="examples/sample-lifecycle.html" target="_blank">Open the lifecycle walkthrough</a></p>
  </div>
</div>

Regulatory Q&amp;A is iterative: an answer is accepted, sent back, or raises new questions, and the dialogue continues until every question is resolved. This page defines how RTQ models that cycle so every implementation handles it the same way.

<div class="rtq-sec" id="cycle">The cycle at a glance</div>

<div class="rtq-steps">
  <div class="rtq-step"><div class="c">❓</div><div class="n">Regulator</div><div class="t">Issue</div><p>A question set with a due date. Every question is required.</p></div>
  <div class="rtq-arrow">→</div>
  <div class="rtq-step co"><div class="c">💬</div><div class="n">Company</div><div class="t">Respond</div><p>One answer per open question, matched by linkId, with any commitments.</p></div>
  <div class="rtq-arrow">→</div>
  <div class="rtq-step"><div class="c">⚖️</div><div class="n">Regulator</div><div class="t">Assess</div><p>A new question set repeats every question with its outcome.</p></div>
  <div class="rtq-arrow">→</div>
  <div class="rtq-step done"><div class="c">✅</div><div class="n">Regulator</div><div class="t">Close</div><p>When every question is resolved, the dialogue is closed.</p></div>
</div>
<div class="rtq-loop">🔁 If any question is not resolved or raises further questions, the company responds again and the cycle repeats.</div>

<div class="rtq-grid rtq-g4">
  <div class="rtq-card soft"><div class="t">Same linkId every round</div><p>A question keeps its linkId from round to round, and follow-up questions extend it (quality-4 → quality-4.1).</p></div>
  <div class="rtq-card soft"><div class="t">New question set per round</div><p>Each round is a new question set that derives from the previous round (<code>derivedFrom</code>) and carries the same procedure number.</p></div>
  <div class="rtq-card soft"><div class="t">Every open question answered</div><p>Only questions marked resolved need no answer. Nothing is left open by accident.</p></div>
  <div class="rtq-card soft"><div class="t">Closure is computed</div><p>The dialogue is closed when every question in the latest question set is resolved.</p></div>
</div>

Each round has its own response window in `effectivePeriod`: `start` is the issue date and `end` is the deadline. If the company and the regulator agree a new deadline, the regulator updates `end`; earlier deadlines remain in the question set's version history. A response is late if it is authored after `end`.

<div class="rtq-sec" id="identifiers-and-versioning">Identifiers and versioning</div>

The `company` and `regulator` **identifiers identify the documents**, not the organizations. The parties are identified by the contacts on the question set and by `author` on the response.

- **Question set:** the regulator's identifier is mandatory; the company may add its own tracking number.
- **Response:** both identifiers are mandatory. The company identifies its response with its own ID and echoes the regulator's ID.
- Each question set goes from one regulator to one company. Sending one question set to several companies is not supported, as it would break confidentiality between them.

<table class="rtq-table">
  <thead><tr><th>Version of…</th><th>Where it is recorded</th></tr></thead>
  <tbody>
    <tr><td>A question set</td><td><code>Questionnaire.version</code> (mandatory, e.g., <code>1.0</code>)</td></tr>
    <tr><td>A response</td><td><code>rtq-response-version</code> extension (FHIR R5 QuestionnaireResponse has no version element)</td></tr>
    <tr><td>The stored record</td><td><code>meta.versionId</code> and <code>meta.lastUpdated</code> on both resources</td></tr>
    <tr><td>An attached document, including artwork</td><td><code>DocumentReference.version</code> and <code>docStatus</code></td></tr>
  </tbody>
</table>

RTQ files are documents, so they can be stored and audited wherever DOCX and PDF questions are stored today. No central platform is needed: keeping every file sent and received gives a complete audit trail.

<div class="rtq-sec" id="every-question-answered">Every open question gets an answer</div>

**Every open question must be answered by a response item with the same `linkId`.** Where there is nothing substantive to say, the company still answers explicitly, for example *"No response required."* or *"See response to question 3."* The rule is enforced twice: open questions are marked `required = true`, so standard FHIR validation fails if one is unanswered, and invariant `rtq-qr-1` rejects any empty answer item. The only questions that need no answer are those the regulator has marked `resolved`.

<div class="rtq-sec" id="assessment-of-responses">Assessment of responses</div>

Assessment templates record a conclusion for every answer. RTQ carries that conclusion on the question itself. After assessing a response, the regulator issues a **new question set** that:

- repeats every question from the previous round with the same `linkId` and category codes;
- adds an **assessment outcome** to each, in the `assessment` slice of `item.code` ([RTQ Assessment Outcome](CodeSystem-rtq-assessment-outcome.html));
- derives from the previous round's question set (`derivedFrom`, including its version) and keeps the same procedure number. The response it assesses is the response to that question set: each question set has exactly one response.

<table class="rtq-table">
  <thead><tr><th>Outcome</th><th>Meaning</th><th>How the question is structured</th></tr></thead>
  <tbody>
    <tr><td><span class="rtq-badge res">resolved</span></td><td>The answer is accepted; the question is closed.</td><td><code>type = text</code>, <code>required = false</code>. No further answer expected.</td></tr>
    <tr><td><span class="rtq-badge nr">not-resolved</span></td><td>The answer is not accepted; the question stays open.</td><td><code>type = text</code>, <code>required = true</code>. The company answers again. The assessor's reasons can go in a nested <code>display</code> item (e.g., <code>product-3.assessment</code>).</td></tr>
    <tr><td><span class="rtq-badge fq">further-questions</span></td><td>The answer raises follow-up questions.</td><td><code>type = group</code>, <code>required = true</code>. The follow-up questions are child items (e.g., <code>quality-4.1</code>, <code>quality-4.2</code>), each answered in the next response.</td></tr>
  </tbody>
</table>

The company's next response answers only the open questions. Invariants `rtq-q-2`, `rtq-q-3`, and `rtq-q-4` on the question set profile enforce these rules.

**Multi-part questions** in a single round use the same nesting: a parent item with a child item for each part, each with its own `linkId`, category codes, and answer. Parts that apply only in some cases can use FHIR's `enableWhen`. A multidisciplinary question can carry several category codes (for example two CTD sections) and be routed to several owners, while the response still comes back as one set.

<div class="rtq-sec" id="commitments">Commitments</div>

A commitment can start on either side, and RTQ marks it where it starts:

<table class="rtq-table">
  <thead><tr><th>Step</th><th>Who</th><th>How it is recorded</th></tr></thead>
  <tbody>
    <tr><td><strong>Request</strong></td><td>Regulator</td><td>The question carries the category code <code>commitment</code>.</td></tr>
    <tr><td><strong>Offer</strong></td><td>Company</td><td>The answer carries the <a href="StructureDefinition-rtq-commitment.html"><code>rtq-commitment</code></a> extension: what will be done and, optionally, by when.</td></tr>
    <tr><td><strong>Accept</strong></td><td>Regulator</td><td>The question is marked <code>resolved</code> in the next round. <code>not-resolved</code> or <code>further-questions</code> sends the commitment back.</td></tr>
  </tbody>
</table>

Tracking and fulfilling a commitment after the exchange, often much later and through a separate submission, is out of scope. Because the commitment sits on an identified answer in an identified response for an identified procedure, any tracking application can point back to exactly where it was requested, offered, and accepted.

<div class="rtq-sec" id="closing-the-dialogue">Closing the dialogue</div>

There is no separate "resolved" flag on the question set. **A question set in which every question, including every follow-up question, is marked `resolved` closes the dialogue for that procedure.** Resolved questions are not required, so the closing set needs no response, and its response window has a start and no end. Because closure is computed from the questions, it can never contradict them, and `Questionnaire.status` keeps its standard FHIR meaning.

The regulator still sends the closing set; without it, the company could not tell "closed" from "not yet assessed".

- **Closing the Q&amp;A is not the regulatory decision.** Approval or refusal of the application follows the regulator's normal decision process, outside RTQ.
- **Open point for the working group:** some templates (e.g., EMA) allow "issue not resolved, but no follow-up questions", which ends the dialogue with an issue on record. The current outcome codes cannot express this. A fourth code (e.g., `not-resolved-closed`) would cover it, and the closure rule would become "every question is resolved or closed".

<div class="rtq-sec" id="worked-example">Worked example: a complete thread</div>

The examples form one complete exchange for procedure NRA/H/C/005432/II/0023. The [interactive walkthrough](examples/sample-lifecycle.html) shows all five steps.

<table class="rtq-table">
  <thead><tr><th>Step</th><th>Example</th><th>What happens</th></tr></thead>
  <tbody>
    <tr><td>1. Questions</td><td><a href="Questionnaire-questionnaire-ID001.html">ID001</a></td><td>The regulator asks 10 questions.</td></tr>
    <tr><td>2. Response</td><td><a href="QuestionnaireResponse-questionnaireresponse-ID001.html">SP-RTQ-2025-0148</a></td><td>All 10 answered; a commitment is offered on <code>quality-1</code> (48-month stability data).</td></tr>
    <tr><td>3. Follow-up</td><td><a href="Questionnaire-questionnaire-ID001-round2.html">ID001-R2</a></td><td>8 resolved, including acceptance of the <code>quality-1</code> commitment; <code>product-3</code> not resolved with the assessor's comment; <code>quality-4</code> raises <code>quality-4.1</code> and <code>quality-4.2</code>.</td></tr>
    <tr><td>4. Response</td><td><a href="QuestionnaireResponse-questionnaireresponse-ID001-round2.html">SP-RTQ-2025-0163</a></td><td>Only the three open questions answered; a new commitment is offered on <code>quality-4.2</code> (toxicity study).</td></tr>
    <tr><td>5. Closure</td><td><a href="Questionnaire-questionnaire-ID001-round3.html">ID001-R3</a></td><td>All 12 questions resolved, including the <code>quality-4.2</code> commitment. No due date and no response expected.</td></tr>
  </tbody>
</table>

<div class="rtq-sec" id="reference">Reference: amendments and status codes</div>

**Amending a question set before it is answered** (adding, removing, or rewording questions) is different from a follow-up round:

1. Issue a new version of the same question set (e.g., `2.0`) with the same procedure context.
2. Point it at the version it replaces with `derivedFrom`, and keep the same `url`. (A follow-up round also uses `derivedFrom` but has a new `url`, which is how the two are told apart.)
3. Retire the old version (`status = retired`); the new one is `active`.

Keep `linkId`s stable for unchanged questions so draft answers carry forward.

<table class="rtq-table">
  <thead><tr><th>Resource</th><th>From → To</th><th>Meaning</th></tr></thead>
  <tbody>
    <tr><td>Question set</td><td><code>draft</code> → <code>active</code></td><td>Issued to the company</td></tr>
    <tr><td>Question set</td><td><code>active</code> → <code>retired</code></td><td>Superseded by an amended version</td></tr>
    <tr><td>Response</td><td><code>in-progress</code> → <code>completed</code></td><td>Finalized and submitted</td></tr>
    <tr><td>Response</td><td><code>completed</code> → <code>amended</code></td><td>Supplemented or corrected (new business version)</td></tr>
    <tr><td>Response</td><td><code>in-progress</code> → <code>stopped</code></td><td>Abandoned, e.g., application withdrawn</td></tr>
    <tr><td>Either</td><td>any → <code>entered-in-error</code></td><td>Created by mistake</td></tr>
  </tbody>
</table>

No custom status codes are defined. The regulator's verdict on an answer is not a response status; it arrives as an assessment outcome in the next question set.
