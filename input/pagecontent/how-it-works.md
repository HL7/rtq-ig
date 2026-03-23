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
