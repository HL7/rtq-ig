Regulatory Q&A is iterative: question sets get amended, responses get supplemented, and a response often triggers further questions. This page defines how RTQ models versioning, amendments, multi-round exchanges, and commitments, so that every implementation handles the dialogue the same way.

### Identifiers: Artifacts, Not Organizations

A recurring point of confusion, worth settling first: the `company` and `regulator` **identifiers identify the artifacts** — the question-set and response documents — **not the organizations**. The parties themselves are identified by the required contact elements on the Questionnaire and by `author`/`source` on the QuestionnaireResponse.

- On the **Questionnaire**: the regulator identifier is mandatory (the regulator issues the question set); a company identifier is optional (a company may assign its own tracking number on receipt).
- On the **QuestionnaireResponse**: **both identifiers are mandatory.** The responding company must always identify its response with its own identifier, and must echo the regulator's identifier for traceability. A response whose author cannot be unambiguously identified from the artifact itself is not acceptable.

Each question set is addressed from one regulator to one company (1:1). One-to-many distribution of a single question set is not supported, as it would break cross-company confidentiality.

### Versioning

<table border="1" style="border-collapse: collapse; width: 100%; border-color: #ddd;">
  <thead style="background-color: #f5f5f5;">
    <tr>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Concern</th>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Mechanism</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;">Business version of a question set</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>Questionnaire.version</code> (mandatory, e.g., <code>1.0</code>)</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;">Business version of a response</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>rtq-response-version</code> extension (FHIR R5 <code>QuestionnaireResponse</code> has no native version element)</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;">Technical/system version</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>meta.versionId</code> and <code>meta.lastUpdated</code> on both resources</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;">Version of an attached document</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>DocumentReference.version</code> and <code>docStatus</code> (applies to any attachment, including artwork)</td>
    </tr>
  </tbody>
</table>

RTQ artifacts are documents: they can be stored, versioned, and audited wherever current DOCX/PDF questions are stored. Nothing in this model requires a central platform — a system that keeps each received/sent RTQ file has a complete audit trail.

### Amending a Question Set

When a regulator amends or supersedes a question set (adds, removes, or rewords questions):

1. Issue a **new Questionnaire** with a new `version` (e.g., `2.0`) and the same regulator procedure context.
2. Point it at the version it replaces via the native `derivedFrom` canonical element.
3. Retire the superseded version (`status = retired`); the new set is `active`.

Question `linkId`s must remain stable across versions for unchanged questions, so that any draft responses in progress can be carried forward automatically.

### Status Transitions

**Questionnaire** (core `PublicationStatus`):

| From | To | Meaning |
|---|---|---|
| `draft` | `active` | Question set issued to the company |
| `active` | `retired` | Superseded by an amended version (see `derivedFrom`), or procedure closed |

**QuestionnaireResponse** (core `QuestionnaireResponseStatus`):

| From | To | Meaning |
|---|---|---|
| `in-progress` | `completed` | Response finalized and submitted to the regulator |
| `completed` | `amended` | A supplementary or corrected response supersedes/extends the submitted one (new business version) |
| `in-progress` | `stopped` | Response abandoned (e.g., application withdrawn) |
| any | `entered-in-error` | Artifact created by mistake |

No custom status codes are defined. The regulator's conclusion on each answer (accepted, not accepted, further questions) is not a status of the response resource; it is carried question by question in the next question set, as described under [Assessment of Responses](#assessment-of-responses) below.

### Every Question Must Have a Response

**Rule: every open question in the Questionnaire must be answered by a response item with the matching `linkId` — always.** The only questions that need no answer are those the regulator has re-issued as `resolved` in a follow-up round. Where no substantive answer applies, the company still responds explicitly, for example:

- *"No response required."*
- *"See response to question 3."* (or an answer reference to the relevant document)

This way the regulator's system is never left with an open question, wondering whether an answer was lost in transit. The rule is enforced twice over: every open question in the RTQ Questionnaire is marked `required = true`, so standard FHIR validation of a response against its questionnaire fails if any question is unanswered; and invariant `rtq-qr-1` on the response rejects any reported item that carries neither an answer nor nested items.

### Assessment of Responses

Regulatory assessment templates record a conclusion for every answer: the issue is resolved, it is not resolved, or the answer raises further questions. RTQ builds this conclusion into the **Questionnaire** so that it travels with the question it concerns. When the regulator has assessed a response, it issues a follow-up question set that re-issues each question from the previous round, keeping its `linkId` and category codes, and adds an **assessment outcome** in the `assessment` slice of `item.code` (code system [RTQ Assessment Outcome](CodeSystem-rtq-assessment-outcome.html)):

<table border="1" style="border-collapse: collapse; width: 100%; border-color: #ddd;">
  <thead style="background-color: #f5f5f5;">
    <tr>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Outcome</th>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Meaning</th>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">How the item is structured</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>resolved</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">The regulator accepts the answer; the question is closed.</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>type = question</code>, <code>required = false</code>. No further answer is expected.</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>not-resolved</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">The answer is not accepted; the question stays open.</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>type = question</code>, <code>required = true</code>. The company answers again. The assessor's reasoning can be given in a nested <code>display</code> item (e.g., <code>linkId</code> <code>product-3.assessment</code>).</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>further-questions</code></td>
      <td style="padding: 8px; border: 1px solid #ddd;">The answer raises follow-up questions.</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>type = group</code>, <code>required = true</code>. The follow-up questions are child items with hierarchical <code>linkId</code>s (e.g., <code>quality-4.1</code>, <code>quality-4.2</code>), each answered in the next response.</td>
    </tr>
  </tbody>
</table>

Invariants on the RTQ Questionnaire profile enforce these rules (`rtq-q-2`, `rtq-q-3`), and assessment outcomes are only allowed in a question set that references the response it assesses via `rtq-in-response-to` (`rtq-q-4`).

### Closing the Dialogue

There is no separate "question set resolved" flag. **A follow-up question set in which every question (including every follow-up question) is marked `resolved` closes the Q&A dialogue for that procedure.** Because resolved questions have `required = false`, the closing set needs no response, and it normally carries no due date. Closure is computed from the questions themselves, so it can never contradict them, and `Questionnaire.status` keeps its standard FHIR meaning (draft, active, retired).

The regulator still sends the closing set: without it, the company could not tell "closed" from "not yet assessed". Two points to note:

- **Closing the Q&A is not the regulatory decision.** Approval or refusal of the application is communicated through the regulator's normal decision process and is out of scope for RTQ.
- **Open point: closing with an issue still unresolved.** Some assessment templates (e.g., EMA) allow the conclusion "issue not resolved, but no follow-up questions", which ends the dialogue with an issue on record. The current outcome codes cannot express this. If needed, a fourth code (e.g., `not-resolved-closed`) would cover it, and the closure rule would become "every question is resolved or closed". This is open for working group discussion.

### Worked Example: A Complete Thread

The examples form one complete exchange for procedure NRA/H/C/005432/II/0023. The [interactive walkthrough](examples/sample-lifecycle.html) shows all five steps side by side.

| Step | Example | What happens |
|---|---|---|
| 1. Questions | [ID001](Questionnaire-questionnaire-ID001.html) | The regulator asks 10 questions. |
| 2. Response | [SP-RTQ-2025-0148](QuestionnaireResponse-questionnaireresponse-ID001.html) | The company answers all 10 and offers a commitment on `quality-1` (48-month stability data). |
| 3. Follow-up questions | [ID001-R2](Questionnaire-questionnaire-ID001-round2.html) | Eight answers are `resolved`, including acceptance of the `quality-1` commitment. `product-3` is `not-resolved` with the assessor's comment. `quality-4` raises two follow-up questions, `quality-4.1` and `quality-4.2`. |
| 4. Response | [SP-RTQ-2025-0163](QuestionnaireResponse-questionnaireresponse-ID001-round2.html) | The company answers only the three open questions and offers a new commitment on `quality-4.2` (toxicity study). |
| 5. Closure | [ID001-R3](Questionnaire-questionnaire-ID001-round3.html) | Every question is `resolved`, including the `quality-4.2` commitment. No due date and no response expected: the dialogue is closed. |

### Multi-Round Q&A and Branching

Real dialogues thread: a company responds, the regulator accepts five of six answers, and rounds continue on the sixth. RTQ models this as a **chain of complete question/response pairs**:

1. **Round 1:** Questionnaire `Q1 v1.0` → QuestionnaireResponse `R1 v1.0` (all questions answered).
2. **Round 2:** The regulator issues a *new* question set `Q2 v1.0` that re-issues every round-1 question with its assessment outcome (see above): the five accepted answers are marked `resolved`, and the sixth is marked `not-resolved` or `further-questions`. `Q2` carries the `rtq-in-response-to` extension referencing `R1`, which preserves the thread, and the same procedure identifier, which groups all rounds under one procedure.
3. **Response to round 2:** `R2` answers only the open questions in `Q2` (those not marked `resolved`).
4. The thread closes per question when it is marked `resolved`, and closes as a whole when every question is resolved (see [Closing the Dialogue](#closing-the-dialogue)).

**Multi-part questions** within a single round are modeled as nested `item` groups: a parent item (the overall question) containing child items (the parts), each with its own `linkId`, category code(s), and — because every question must be answered — its own response item. Parts relevant only under certain conditions can use the native `enableWhen` mechanism. Multidisciplinary questions may carry multiple category codes (e.g., two CTD sections) and can be routed to several owners; the response still comes back as one consolidated set.

### Commitments and Follow-Up Measures

A commitment can start on either side of the exchange, and RTQ marks it where it starts:

| Step | Who | How it is represented |
|---|---|---|
| **Request** | Regulator asks for a commitment | The question carries the category code `commitment` (see [Terminology](terminology.html)). |
| **Offer** | MAH/applicant commits in its answer | The answer carries the [`rtq-commitment`](StructureDefinition-rtq-commitment.html) extension on `QuestionnaireResponse.item`: what the company commits to do and, optionally, the date by which it will do it. |
| **Accept** | Regulator | The assessment outcome on that question in the follow-up question set: `resolved` accepts the commitment; `not-resolved` or `further-questions` sends it back. |

In the [worked example](#worked-example-a-complete-thread), the company offers commitments on `quality-1` (round 1) and `quality-4.2` (round 2), and the regulator accepts each one by marking the question `resolved` in the next round.

Tracking the commitment after the exchange, and fulfilling it (often much later and through a separate submission), are out of scope for RTQ. Because the commitment sits on an identified answer in an identified response for an identified procedure, any application that tracks commitments can point back to exactly where it was requested, offered, and accepted.
