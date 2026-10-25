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

No custom status codes are defined. Regulatory business states beyond these (e.g., "accepted by assessor") belong to workflow resources such as `Task.businessStatus`, not to the response itself.

### Every Question Must Have a Response

**Rule: every question item in the Questionnaire must be answered by a response item with the matching `linkId` — always.** Where no substantive answer applies, the company still responds explicitly, for example:

- *"No response required."*
- *"See response to question 3."* (or an answer reference to the relevant document)

This way the regulator's system is never left with an open question, wondering whether an answer was lost in transit. The rule is enforced twice over: every question in the RTQ Questionnaire is marked `required = true`, so standard FHIR validation of a response against its questionnaire fails if any question is unanswered; and invariant `rtq-qr-1` on the response rejects any reported item that carries neither an answer nor nested items.

### Multi-Round Q&A and Branching

Real dialogues thread: a company responds, the regulator accepts five of six answers, and rounds continue on the sixth. RTQ models this as a **chain of complete question/response pairs**:

1. **Round 1:** Questionnaire `Q1 v1.0` → QuestionnaireResponse `R1 v1.0` (all questions answered).
2. **Round 2:** The regulator issues a *new* question set `Q2 v1.0` containing only the follow-up questions. `Q2` carries the `rtq-in-response-to` extension referencing `R1`, which preserves the thread, and the same procedure identifier, which groups all rounds under one procedure.
3. Follow-up questions that drill into a specific earlier question should use hierarchical `linkId`s (e.g., `quality-4.1`, `quality-4.2`) so parent–child relationships between an original question and its sub-questions are explicit and machine-readable.
4. The thread closes per question when a round produces no further follow-ups on it; the procedure-level outcome is communicated through the regulator's normal decision process (out of scope for RTQ).

**Multi-part questions** within a single round are modeled as nested `item` groups: a parent item (the overall question) containing child items (the parts), each with its own `linkId`, CTD code(s), and — because every question must be answered — its own response item. Parts relevant only under certain conditions can use the native `enableWhen` mechanism. Multidisciplinary questions may carry multiple CTD codes and can be routed to several owners; the response still comes back as one consolidated set.

### Commitments and Follow-Up Measures

Questions or responses that establish post-approval commitments are handled in three steps:

1. **Mark:** the item carries the category code `commitment` (see [Terminology](terminology.html)).
2. **Track:** the organization tracking the commitment creates a `Task` whose `focus` references the QuestionnaireResponse (or the specific item via its `linkId`), with `Task.businessStatus` carrying the commitment state (e.g., due, submitted, fulfilled) and a `Flag` optionally marking the open commitment on the relevant record.
3. **Fulfil:** when the commitment is fulfilled — often much later, and possibly through a separate submission — the fulfilment references the original procedure identifier and question `linkId`, closing the loop even when the fulfilment is far removed in time from the original Q&A exchange.

This is a usage pattern rather than a set of profiles; profiles for the Task/Flag pattern may be added in a future version once pilot experience confirms the shape.
