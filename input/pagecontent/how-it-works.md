<p>This page explains what a regulatory question and its response actually look like, section by section, using the same format as the interactive examples. It is written for a business audience and does not require any technical knowledge of FHIR.</p>

<hr/>

<h2>Part 1: The Regulatory Question</h2>

<p>When a health authority has questions about a regulatory submission, it sends a structured <strong>Question Set</strong> to the Marketing Authorization Holder (MAH). The diagram below shows exactly what that message contains.</p>

<div style="display: flex; gap: 48px; align-items: flex-start; margin: 40px 0; flex-wrap: wrap;">

  <!-- LEFT: Annotated document -->
  <div style="flex: 1; min-width: 300px; max-width: 520px; background: #ffffff; border: 1px solid #e2e8f0; border-radius: 14px; padding: 28px; box-shadow: 0 4px 16px rgba(0,0,0,0.07); font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; font-size: 0.9rem; color: #1e293b;">

    <!-- Section A: Metadata -->
    <div id="q-meta" style="background: #eff6ff; border: 2px solid #2563eb; border-radius: 8px; padding: 12px 16px; margin-bottom: 14px;">
      <div style="font-size: 0.7rem; font-weight: 800; color: #2563eb; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 6px;">A — Question Set Metadata</div>
      <div style="color: #475569; font-size: 0.82rem; line-height: 1.6;">
        <strong>ID:</strong> ID001 &nbsp;|&nbsp; <strong>Version:</strong> 1.0 &nbsp;|&nbsp; <strong>Date:</strong> 2025-11-11<br/>
        <strong>Type:</strong> Type II Variation &nbsp;|&nbsp; <strong>Due:</strong> 2025-12-11
      </div>
    </div>

    <!-- Section B: Cover Letter -->
    <div id="q-cover" style="background: #f0fdf4; border: 2px solid #16a34a; border-radius: 8px; padding: 12px 16px; margin-bottom: 14px;">
      <div style="font-size: 0.7rem; font-weight: 800; color: #16a34a; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 6px;">B — Cover Letter</div>
      <div style="color: #475569; font-size: 0.82rem; line-height: 1.6;">
        Please find enclosed the List of Questions regarding the Type II variation for ExampleDrug 10 mg Tablets. Responses are required by the due date above. Please ensure all answers reference the relevant CTD section.
      </div>
    </div>

    <!-- Section C: Sender / Recipient -->
    <div id="q-participants" style="background: #fefce8; border: 2px solid #ca8a04; border-radius: 8px; padding: 12px 16px; margin-bottom: 14px;">
      <div style="font-size: 0.7rem; font-weight: 800; color: #ca8a04; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 8px;">C — Sender &amp; Recipient</div>
      <div style="display: flex; gap: 12px; align-items: center; font-size: 0.82rem;">
        <div style="flex: 1; background: white; border-radius: 6px; padding: 8px 10px; border: 1px solid #e2e8f0;">
          <div style="font-weight: 700; font-size: 0.75rem; color: #64748b; margin-bottom: 2px;">SENDER (REGULATOR)</div>
          <div>National Regulatory Authority</div>
          <div style="color: #64748b; font-size: 0.78rem;">regulatory.contact@example-nra.example.org</div>
        </div>
        <div style="font-size: 1.2rem; color: #94a3b8;">→</div>
        <div style="flex: 1; background: white; border-radius: 6px; padding: 8px 10px; border: 1px solid #e2e8f0;">
          <div style="font-weight: 700; font-size: 0.75rem; color: #64748b; margin-bottom: 2px;">RECIPIENT (MAH)</div>
          <div>SynthPharma AG</div>
          <div style="color: #64748b; font-size: 0.78rem;">john.doe@synthpharma.example</div>
        </div>
      </div>
    </div>

    <!-- Section D: Individual Questions -->
    <div id="q-questions" style="background: #fdf4ff; border: 2px solid #9333ea; border-radius: 8px; padding: 12px 16px;">
      <div style="font-size: 0.7rem; font-weight: 800; color: #9333ea; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 8px;">D — Individual Questions</div>
      <!-- Single question example -->
      <div style="background: white; border: 1px solid #e2e8f0; border-radius: 6px; padding: 10px 12px; margin-bottom: 8px; font-size: 0.82rem;">
        <div style="display: flex; justify-content: space-between; margin-bottom: 6px;">
          <span style="background: #eff6ff; color: #2563eb; font-family: monospace; font-size: 0.72rem; font-weight: 700; padding: 2px 7px; border-radius: 4px;">CTD: 3.2.P.8.1 Stability</span>
          <span style="color: #94a3b8; font-size: 0.72rem;">Q-001</span>
        </div>
        <div style="font-weight: 600; margin-bottom: 4px;">Are there any new stability studies included, or only additional timepoints?</div>
        <div style="color: #64748b; font-size: 0.78rem;">Include protocol deviations if applicable. Reference: ICH Q1A(R2).</div>
        <div style="margin-top: 6px; font-size: 0.75rem; color: #94a3b8;">📎 Attachment: optional — e.g., reference document</div>
      </div>
      <div style="color: #94a3b8; font-size: 0.78rem; font-style: italic; padding: 0 2px;">+ additional questions follow the same structure...</div>
    </div>

  </div>

  <!-- RIGHT: Callout labels -->
  <div style="flex: 1; min-width: 260px; display: flex; flex-direction: column; gap: 18px; padding-top: 8px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;">

    <div style="display: flex; gap: 14px; align-items: flex-start;">
      <div style="width: 28px; height: 28px; background: #2563eb; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 0.85rem; flex-shrink: 0; margin-top: 2px;">A</div>
      <div>
        <div style="font-weight: 700; font-size: 1rem; margin-bottom: 4px;">Question Set Metadata</div>
        <div style="color: #475569; font-size: 0.88rem; line-height: 1.5;">Every question set has a unique <strong>ID</strong>, a <strong>version number</strong>, the <strong>date</strong> it was issued, and a <strong>response due date</strong>. The procedure type (e.g. Type II Variation) is also captured here, so the recipient's system can automatically route it to the right team.</div>
      </div>
    </div>

    <div style="display: flex; gap: 14px; align-items: flex-start;">
      <div style="width: 28px; height: 28px; background: #16a34a; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 0.85rem; flex-shrink: 0; margin-top: 2px;">B</div>
      <div>
        <div style="font-weight: 700; font-size: 1rem; margin-bottom: 4px;">Cover Letter</div>
        <div style="color: #475569; font-size: 0.88rem; line-height: 1.5;">A free-text area carries the narrative content that would traditionally appear in a cover letter — context, instructions, and any overarching comments about the question set. Rich formatting (bold, lists, tables) is fully supported.</div>
      </div>
    </div>

    <div style="display: flex; gap: 14px; align-items: flex-start;">
      <div style="width: 28px; height: 28px; background: #ca8a04; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 0.85rem; flex-shrink: 0; margin-top: 2px;">C</div>
      <div>
        <div style="font-weight: 700; font-size: 1rem; margin-bottom: 4px;">Sender &amp; Recipient</div>
        <div style="color: #475569; font-size: 0.88rem; line-height: 1.5;">The issuing health authority (<strong>Sender</strong>) and the MAH or applicant (<strong>Recipient</strong>) are both identified with their name, contact details, and unique organisational identifiers. This enables fully automated routing without manual address look-up.</div>
      </div>
    </div>

    <div style="display: flex; gap: 14px; align-items: flex-start;">
      <div style="width: 28px; height: 28px; background: #9333ea; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 0.85rem; flex-shrink: 0; margin-top: 2px;">D</div>
      <div>
        <div style="font-weight: 700; font-size: 1rem; margin-bottom: 4px;">Individual Questions</div>
        <div style="color: #475569; font-size: 0.88rem; line-height: 1.5;">Each question is a self-contained unit carrying: a <strong>unique reference ID</strong>, a <strong>CTD section tag</strong> (e.g. 3.2.P.8.1 — Stability) for automatic classification, the <strong>full question text</strong> with rich formatting, and an optional <strong>attachment</strong> (e.g. a reference document or data table). Multiple questions are grouped within a single Question Set.</div>
      </div>
    </div>

    <div style="margin-top: 8px;">
      <a href="examples/sample-question.html" target="_blank" style="display: inline-block; background: #2563eb; color: white; padding: 10px 20px; border-radius: 8px; font-weight: 600; font-size: 0.88rem; text-decoration: none;">👉 View the Interactive Question Example</a>
    </div>

  </div>
</div>

<hr/>

<h2>Part 2: The Response</h2>

<p>Once the MAH has prepared their answers, they send back a structured <strong>Response</strong> that maps directly back to each question in the original Question Set. The diagram below shows exactly what that response contains.</p>

<div style="display: flex; gap: 48px; align-items: flex-start; margin: 40px 0; flex-wrap: wrap;">

  <!-- LEFT: Annotated document -->
  <div style="flex: 1; min-width: 300px; max-width: 520px; background: #ffffff; border: 1px solid #e2e8f0; border-radius: 14px; padding: 28px; box-shadow: 0 4px 16px rgba(0,0,0,0.07); font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; font-size: 0.9rem; color: #1e293b;">

    <!-- Section A: Metadata -->
    <div style="background: #eff6ff; border: 2px solid #2563eb; border-radius: 8px; padding: 12px 16px; margin-bottom: 14px;">
      <div style="font-size: 0.7rem; font-weight: 800; color: #2563eb; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 6px;">A — Response Metadata</div>
      <div style="color: #475569; font-size: 0.82rem; line-height: 1.6;">
        <strong>Response ID:</strong> ID001-R &nbsp;|&nbsp; <strong>Status:</strong> Completed<br/>
        <strong>Submitted:</strong> 2025-11-18 &nbsp;|&nbsp; <strong>Linked to:</strong> Question Set ID001
      </div>
    </div>

    <!-- Section B: Cover Letter -->
    <div style="background: #f0fdf4; border: 2px solid #16a34a; border-radius: 8px; padding: 12px 16px; margin-bottom: 14px;">
      <div style="font-size: 0.7rem; font-weight: 800; color: #16a34a; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 6px;">B — Response Cover Letter</div>
      <div style="color: #475569; font-size: 0.82rem; line-height: 1.6;">
        Please find enclosed SynthPharma AG's responses to the List of Questions (ID001). All responses are provided in full, with supporting documentation attached where applicable.
      </div>
    </div>

    <!-- Section C: Sender / Recipient -->
    <div style="background: #fefce8; border: 2px solid #ca8a04; border-radius: 8px; padding: 12px 16px; margin-bottom: 14px;">
      <div style="font-size: 0.7rem; font-weight: 800; color: #ca8a04; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 8px;">C — Sender &amp; Recipient</div>
      <div style="display: flex; gap: 12px; align-items: center; font-size: 0.82rem;">
        <div style="flex: 1; background: white; border-radius: 6px; padding: 8px 10px; border: 1px solid #e2e8f0;">
          <div style="font-weight: 700; font-size: 0.75rem; color: #64748b; margin-bottom: 2px;">SENDER (MAH)</div>
          <div>SynthPharma AG</div>
          <div style="color: #64748b; font-size: 0.78rem;">john.doe@synthpharma.example</div>
        </div>
        <div style="font-size: 1.2rem; color: #94a3b8;">→</div>
        <div style="flex: 1; background: white; border-radius: 6px; padding: 8px 10px; border: 1px solid #e2e8f0;">
          <div style="font-weight: 700; font-size: 0.75rem; color: #64748b; margin-bottom: 2px;">RECIPIENT (REGULATOR)</div>
          <div>National Regulatory Authority</div>
          <div style="color: #64748b; font-size: 0.78rem;">regulatory.contact@example-nra.example.org</div>
        </div>
      </div>
    </div>

    <!-- Section D: Answers -->
    <div style="background: #fdf4ff; border: 2px solid #9333ea; border-radius: 8px; padding: 12px 16px;">
      <div style="font-size: 0.7rem; font-weight: 800; color: #9333ea; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 8px;">D — Answers</div>
      <div style="background: white; border: 1px solid #e2e8f0; border-radius: 6px; overflow: hidden; font-size: 0.82rem;">
        <!-- Question -->
        <div style="padding: 8px 12px; background: #f8fafc; border-bottom: 1px solid #e2e8f0; color: #64748b; font-size: 0.78rem;">
          <span style="background: #eff6ff; color: #2563eb; font-family: monospace; font-size: 0.72rem; font-weight: 700; padding: 2px 7px; border-radius: 4px; margin-right: 6px;">Q-001</span>
          Are there any new stability studies included, or only additional timepoints?
        </div>
        <!-- Answer -->
        <div style="padding: 10px 12px; border-left: 4px solid #2563eb;">
          <div style="font-size: 0.72rem; font-weight: 800; color: #2563eb; text-transform: uppercase; margin-bottom: 4px;">Response</div>
          <div>The submission includes both extended long-term data and new studies for pilot batches in the new packaging. No protocol deviations occurred.</div>
          <div style="margin-top: 6px; font-size: 0.75rem; color: #94a3b8;">📎 Stability_Summary_Report.pdf &nbsp; 📊 Stability_Data_Tables.xlsx</div>
        </div>
      </div>
      <div style="color: #94a3b8; font-size: 0.78rem; font-style: italic; padding: 6px 2px 0;">+ all other questions are answered in the same format...</div>
    </div>

  </div>

  <!-- RIGHT: Callout labels -->
  <div style="flex: 1; min-width: 260px; display: flex; flex-direction: column; gap: 18px; padding-top: 8px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;">

    <div style="display: flex; gap: 14px; align-items: flex-start;">
      <div style="width: 28px; height: 28px; background: #2563eb; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 0.85rem; flex-shrink: 0; margin-top: 2px;">A</div>
      <div>
        <div style="font-weight: 700; font-size: 1rem; margin-bottom: 4px;">Response Metadata</div>
        <div style="color: #475569; font-size: 0.88rem; line-height: 1.5;">The response carries its own unique <strong>ID</strong> and <strong>submission date</strong>, and is explicitly linked back to the original Question Set ID. The <strong>status</strong> (e.g. Completed) lets the receiving system know the response is final.</div>
      </div>
    </div>

    <div style="display: flex; gap: 14px; align-items: flex-start;">
      <div style="width: 28px; height: 28px; background: #16a34a; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 0.85rem; flex-shrink: 0; margin-top: 2px;">B</div>
      <div>
        <div style="font-weight: 700; font-size: 1rem; margin-bottom: 4px;">Response Cover Letter</div>
        <div style="color: #475569; font-size: 0.88rem; line-height: 1.5;">Just like the question, the response includes a free-text cover letter for any overarching narrative — introductory remarks, caveats, or cross-references — before the individual answers begin.</div>
      </div>
    </div>

    <div style="display: flex; gap: 14px; align-items: flex-start;">
      <div style="width: 28px; height: 28px; background: #ca8a04; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 0.85rem; flex-shrink: 0; margin-top: 2px;">C</div>
      <div>
        <div style="font-weight: 700; font-size: 1rem; margin-bottom: 4px;">Sender &amp; Recipient</div>
        <div style="color: #475569; font-size: 0.88rem; line-height: 1.5;">The roles are now reversed — the <strong>MAH is the Sender</strong> and the <strong>Regulator is the Recipient</strong>. Both parties are fully identified, enabling automatic acknowledgement and filing at the receiving end.</div>
      </div>
    </div>

    <div style="display: flex; gap: 14px; align-items: flex-start;">
      <div style="width: 28px; height: 28px; background: #9333ea; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 0.85rem; flex-shrink: 0; margin-top: 2px;">D</div>
      <div>
        <div style="font-weight: 700; font-size: 1rem; margin-bottom: 4px;">Answers</div>
        <div style="color: #475569; font-size: 0.88rem; line-height: 1.5;">Each answer is <strong>linked directly to its original question</strong> by ID, so there is never any ambiguity. The answer text supports rich formatting, and <strong>supporting documents</strong> (PDFs, spreadsheets, images) can be attached directly to each individual answer.</div>
      </div>
    </div>

    <div style="margin-top: 8px;">
      <a href="examples/sample-response.html" target="_blank" style="display: inline-block; background: #2563eb; color: white; padding: 10px 20px; border-radius: 8px; font-weight: 600; font-size: 0.88rem; text-decoration: none;">👉 View the Interactive Response Example</a>
    </div>

  </div>
</div>

<hr/>

<h2>Part 3: Practical Topics</h2>

<h3>Every question gets a response</h3>
<p>A core rule of RTQ: <strong>every question in a question set must receive a response item</strong> — even when the answer is simply "No response required." or a cross-reference to another answer or document. This guarantees that the regulator's system is never left with an open question wondering whether a response was lost. Technically, every question in the RTQ <code>Questionnaire</code> is marked <em>required</em>, and the RTQ <code>QuestionnaireResponse</code> enforces that no reported item is empty. See <a href="lifecycle.html">Lifecycle &amp; Versioning</a> for the full set of rules.</p>

<h3>Due dates</h3>
<p>Health authority questions are always time-sensitive, so the question set carries a canonical due-date model (the <code>rtq-due-date</code> extension): the <strong>original due date</strong> assigned by the regulator, plus any <strong>negotiated due dates</strong> agreed afterwards. The current due date is the most recent negotiated date, or the original when none has been negotiated, and lateness is derivable by comparing the response's submission date to it. Reminders and escalation behaviour are the responsibility of each implementer's application — RTQ provides the dates that make them possible.</p>

<h3>Question categories</h3>
<p>Every question carries at least one <strong>category</strong> code, set by the regulator. Two terminologies are preferred: the <strong>CTD section</strong> the question concerns (which drives routing to module owners), and its <strong>regulatory significance</strong>: <em>major objection</em>, <em>minor concern</em>, <em>other consideration</em>, or <em>commitment</em>. A question can carry several categories. Regulators may also use their own category codes, and product domains that do not use the CTD (such as medical devices) use the terminology that fits them; see <a href="terminology.html">Terminology</a>.</p>

<h3>Assessment of responses</h3>
<p>When the regulator assesses a response, it issues a follow-up question set that repeats each question with its <strong>assessment outcome</strong>: <em>resolved</em> (accepted, no further answer needed), <em>not resolved</em> (answer again), or <em>raises further questions</em> (the follow-up questions sit under the original one). The whole thread stays machine-readable from round to round; see <a href="lifecycle.html">Lifecycle &amp; Versioning</a>.</p>

<h3>Attachments &amp; large documents</h3>
<p>Supporting documents attach to questions and to answers through the <strong>RTQ DocumentReference</strong> profile, and all documents are treated the same way regardless of intent — an assessment report providing background to a question attaches exactly like a validation report supporting an answer, with the document's <code>type</code> and <code>category</code> conveying what it is.</p>
<p>As a baseline best practice: <strong>embed</strong> documents of up to about <strong>10&nbsp;MB</strong> directly in the file (<code>attachment.data</code>); <strong>reference</strong> larger documents by URL (<code>attachment.url</code>) pointing to a repository accessible to both parties, such as a submission portal or shared document store. This threshold is guidance, not a conformance rule — implementers with different constraints are invited to share their experience so the guidance can evolve. Any file format may be attached (PDF, spreadsheets, images, structured datasets); over time, the direction of travel is from unstructured binary attachments toward structured data sets (see the PQI collaboration noted on the <a href="index.html">Home page</a>).</p>
<p>When a question concerns existing structured content — for example the product information — the question or answer can also <strong>reference FHIR resources directly</strong> (an ePI <code>Bundle</code>, a <code>Composition</code>, or a <code>MedicinalProductDefinition</code>) instead of attaching a document copy. In a centralized system both parties resolve the same reference; in a decentralized exchange, referenced content should either be attached alongside or be resolvable by the receiver.</p>

<h3>Out of scope: AI &amp; automation</h3>
<p>RTQ provides the structured, machine-readable substrate; AI and automation are what implementers build on top of it — inbound question understanding, mapping to CTD sections and impacted systems, AI-assisted response drafting, completeness checks, consistency checks against previously approved data, and so on. These are examples of what the structure enables, not part of RTQ. RTQ's scope is limited to structuring the question and the response; how each organization applies AI and automation, and how the files are exchanged, are out of scope.</p>

<h3>What the standard does — and what your application does</h3>
<p>RTQ harmonizes <em>data structure only</em>. Features such as keyword or semantic search over historical questions, automated routing, reminders, dashboards, and analytics live in the application layer of each implementer's systems. The RTQ metadata — CTD codes, categories, identifiers, <code>linkId</code>s, dates — is what makes those features feasible and interoperable, but this guide does not specify them.</p>
