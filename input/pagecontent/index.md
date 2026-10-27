{% include rtq-style.html %}

<!-- HERO -->
<div class="rtq-hero">
  <div class="rtq-eyebrow">HL7 FHIR R5 · Global Standard</div>
  <div class="rtq-h1">Regulatory questions,<br/><span class="rtq-grad">answered in structure.</span></div>
  <p class="rtq-lead">Health authority questions and company responses are still exchanged as Word and PDF documents. RTQ turns every question and every answer into structured, machine-readable FHIR data: uniquely identified, categorized, linked to each other, and traceable from the first question to final resolution.</p>
  <div class="rtq-btns">
    <a class="rtq-btn" href="examples/sample-question.html" target="_blank">See an example</a>
    <a class="rtq-btn alt" href="examples/sample-lifecycle.html" target="_blank">Walk through the lifecycle</a>
    <a class="rtq-btn ghost" href="#get-involved">Get involved</a>
  </div>
</div>

<div class="rtq-figure">
  <img src="rtq-vs-pdf-diagram.svg" width="560" alt="Today's process compared with FHIR RTQ. Today: the regulator writes questions, emails a PDF to the MAH, the MAH responds manually and the regulator reviews manually, taking weeks; manual, error-prone, no data extraction. With FHIR RTQ: the regulator publishes a Questionnaire, it is delivered instantly, the MAH returns a structured digital response, and analysis and tracking are automated, in real time; automated, machine-readable, data analytics."/>
  <div class="cap">From weeks of manual PDF handling to structured, real-time Q&amp;A</div>
</div>

<!-- ABOUT -->
<div class="rtq-sec" id="about">About this IG</div>

The **Response to Regulatory Questions (RTQ)** Implementation Guide standardizes the structure of regulatory questions from health authorities and the responses from marketing authorization holders (MAHs) and applicants. A question set is an RTQ **Questionnaire**; the answers come back as an RTQ **QuestionnaireResponse**. Each covers the whole package: cover letter, individual questions or answers, supporting attachments, and metadata.

Because every question is a discrete item with its own identifier and category codes, and every answer is linked to its question, the dialogue becomes data that systems can route, track, reuse, and analyze. RTQ standardizes the *content* of the dialogue; the [APIX Implementation Guide](https://build.fhir.org/ig/HL7/APIX---API-Exchange-for-Medicinal-Products/branches/main/index.html) standardizes one way to *exchange* it. Just as [ISO 20022](https://www.iso20022.org) harmonized global payments, the two together move regulatory Q&amp;A toward the real-time algorithmic exchange described in the [2023 *International Journal of Pharmaceutics* framework](https://www.sciencedirect.com/science/article/pii/S0378517323007627).

<!-- SCOPE -->
<div class="rtq-sec" id="scope">Scope</div>

<div class="rtq-grid rtq-g2">
  <div class="rtq-in">
    <div class="h">✅ In scope: the structure of the question and the response</div>
    <ul>
      <li><strong>Question sets</strong> for widely used regulatory templates: lists of questions, validation issues, information requests, deficiency letters.</li>
      <li><strong>Responses</strong> with answers, supporting attachments, cross-references, and commitments.</li>
      <li><strong>Metadata:</strong> identifiers, versions, dates, category codes, and product, authorization, and procedure context.</li>
      <li><strong>Assessment and closure:</strong> the regulator's outcome for each answer, round by round, until every question is resolved.</li>
    </ul>
  </div>
  <div class="rtq-out">
    <div class="h">⛔ Out of scope</div>
    <ul>
      <li><strong>Exchange:</strong> how the files travel between parties (see below).</li>
      <li><strong>Use of AI and automation:</strong> the structure makes it possible; how to apply it is each implementer's choice.</li>
      <li><strong>Application features and internal workflow:</strong> routing, task assignment, reminders, search, dashboards, commitment tracking, and any categories a company adds internally.</li>
      <li><strong>Master files (DMF/ASMF):</strong> tripartite communication with the master file holder is planned for a future phase.</li>
    </ul>
  </div>
</div>

Medicinal products are the first focus. Because question categories are defined by each regulator, the same structure can also serve other regulated product domains, such as medical devices, veterinary, and OTC products.

<hr class="rtq-hr"/>

<!-- HOW IT WORKS -->
<div class="rtq-sec-c">
  <div class="rtq-sec">How It Works</div>
  <p>One question set, one linked response, round after round until every question is resolved.</p>
</div>

<div class="rtq-steps">
  <div class="rtq-step"><div class="c">❓</div><div class="n">Step 1</div><div class="t">Ask</div><p>The regulator issues a question set: discrete questions with unique IDs and category tags.</p></div>
  <div class="rtq-arrow">→</div>
  <div class="rtq-step co"><div class="c">💬</div><div class="n">Step 2</div><div class="t">Answer</div><p>The company returns one linked answer per question, with attachments and any commitments.</p></div>
  <div class="rtq-arrow">→</div>
  <div class="rtq-step"><div class="c">⚖️</div><div class="n">Step 3</div><div class="t">Assess</div><p>The regulator marks each answer resolved, not resolved, or raising further questions.</p></div>
  <div class="rtq-arrow">→</div>
  <div class="rtq-step co"><div class="c">🔁</div><div class="n">Step 4</div><div class="t">Repeat</div><p>Only the open questions go another round, each linked to the round before.</p></div>
  <div class="rtq-arrow">→</div>
  <div class="rtq-step done"><div class="c">✅</div><div class="n">Step 5</div><div class="t">Close</div><p>When every question is resolved, the dialogue is closed.</p></div>
</div>
<div class="rtq-loop"><a href="how-it-works.html">What a question set and a response contain →</a> &nbsp;·&nbsp; <a href="lifecycle.html">The full lifecycle →</a></div>

<!-- EXCHANGE -->
<div class="rtq-callout violet" id="exchange">
  <div class="ic">📨</div>
  <div>
    <div class="h">Exchange is out of scope. RTQ is a file: send it the way you send question documents today.</div>
    <p>An RTQ question set or response is an XML or JSON file, the structured equivalent of today's DOCX or PDF. It can travel by <strong>email</strong>, through a <strong>regulatory portal</strong> (e.g., FDA ESG or a national gateway), inside an <strong>eCTD</strong> sequence, on a <strong>central platform</strong>, or by <strong>API</strong> using an APIX Task. The content is the same whatever the channel, so each party can modernize at its own pace.</p>
    <p><strong>RTQ complements current processes.</strong> It changes the format of the document, not the channel or the procedure. <strong>It harmonizes structure, not wording:</strong> each regulator keeps its own phrasing, rules, and terminology. <strong>Simple exchanges stay simple:</strong> a clarification answered by email can still be answered by email. A typical path is to send the RTQ file alongside the PDF first, then parse incoming files automatically, then author in structured form, and finally move to API exchange where both parties support it.</p>
  </div>
</div>

<!-- STANDARDS -->
<div class="rtq-sec" id="standards">RTQ and other standards</div>

<table class="rtq-table">
  <thead><tr><th>Standard</th><th>Relationship to RTQ</th></tr></thead>
  <tbody>
    <tr><td><strong>APIX</strong></td><td>One exchange option: RTQ files are exchanged through APIX-defined APIs as the payload of an APIX Task. RTQ defines what is inside; APIX defines the wrapper, API operations, and delivery state.</td></tr>
    <tr><td><strong>eCTD</strong></td><td>An RTQ response file can be placed in an eCTD sequence and submitted through the normal route.</td></tr>
    <tr><td><strong>ePI</strong></td><td>Questions and answers about product information can point to ePI content through a DocumentReference whose attachment links to the ePI, instead of attaching a PDF copy.</td></tr>
    <tr><td><strong>PQI</strong></td><td>The project works with HL7 Product Quality Information so that quality and CMC answers can move from attachments to structured data over time.</td></tr>
    <tr><td><strong>IDMP / SPOR</strong></td><td>No direct use case yet. IDMP identifiers such as the MPID can already be carried in the product context of a question set or response.</td></tr>
  </tbody>
</table>

<hr class="rtq-hr"/>

<!-- WHY ADOPT -->
<div class="rtq-sec-c">
  <div class="rtq-sec">Why adopt RTQ</div>
  <p>Structured questions and answers change what both sides can do with them.</p>
</div>

<div class="rtq-stats">
  <div><b>Days → Minutes</b><span>Triage with automated routing</span></div>
  <div><b>1 Format</b><span>For every regulator</span></div>
  <div><b>100%</b><span>Machine-readable content</span></div>
  <div><b>Every answer</b><span>Linked to its question</span></div>
</div>

<div class="rtq-grid rtq-g3">
  <div class="rtq-card soft"><div class="ic">🧭</div><div class="t">Automated triage</div><p>Each question carries its category codes, such as a CTD section, so it can be routed to the right expert the moment it arrives.</p><a class="more" href="use-case.html">Use cases →</a></div>
  <div class="rtq-card soft"><div class="ic">🌍</div><div class="t">One structure for every regulator</div><p>Build once and handle question sets from any authority, while each regulator keeps its own wording and terminology.</p><a class="more" href="terminology.html">Terminology →</a></div>
  <div class="rtq-card soft"><div class="ic">📈</div><div class="t">Traceable and analytics-ready</div><p>Every answer, assessment outcome, and commitment is linked and timestamped, from the first question to closure.</p><a class="more" href="lifecycle.html">Lifecycle →</a></div>
</div>

<hr class="rtq-hr"/>

<!-- GOVERNANCE -->
<div class="rtq-sec" id="get-involved">Governance &amp; Participation</div>

<div class="rtq-grid rtq-g3">
  <div class="rtq-card">
    <div class="ic">🤝</div><div class="t">Governance</div>
    <p>RTQ is developed by the HL7 Biomedical Research and Regulation (BR&amp;R) Work Group with regulators, pharmaceutical companies, and technology vendors. It coordinates with the HL7 PQI, APIX, and ePI projects, and a Semantic Architecture Tiger Team is forming to align content terminologies. All meetings are public.</p>
  </div>
  <div class="rtq-card">
    <div class="ic">🧪</div><div class="t">Pilots</div>
    <p>We are recruiting regulator and company pairs to run pilot exchanges with this version of the profiles. If your organization is interested, contact the project through the project page.</p>
  </div>
  <div class="rtq-card">
    <div class="ic">🚀</div><div class="t">Get involved</div>
    <ul>
      <li><a href="https://confluence.hl7.org/spaces/BRR/pages/358267438/Response+to+Health+Authority+Questions+RTQ">Join the weekly calls</a> (links, notes, and recordings)</li>
      <li>Try the <a href="examples/sample-question.html">question</a>, <a href="examples/sample-response.html">response</a>, and <a href="examples/sample-lifecycle.html">lifecycle</a> examples, and validate your own instances against the <a href="artifacts.html">profiles</a></li>
      <li>Contribute on <a href="https://github.com/HL7/rtq-ig/">GitHub</a></li>
      <li>CMC and manufacturing experts: share real-world content, such as large stability tables, to test the attachment guidance</li>
    </ul>
  </div>
</div>
