# RTQ IG: Summary of Changes, October 2026

Changes made to the Response to Regulatory Questions (RTQ) Implementation Guide between 25 and 28 October 2026, in response to the review feedback (J. Klesh, Kent, Generis form and summary, PF/Bev workbook, combined comments with C. Anderson's notes) and the follow-up review of the IG content and profiles.

IG version: 0.2.0 (FHIR R5). Last commit covered: `24855eb FInal updates`.

---

## 1. Summary

- The site is restructured from 11 tabs to 9, with a new Home page, a shared visual style and the standard HL7 template.
- The scope is explicit: RTQ structures the question and the response only. Exchange, use of AI and automation, and internal workflow are out of scope.
- The regulator's assessment of each answer (resolved, not resolved, further questions) is carried on the questions of the next question set, so a multi-round dialogue is machine-readable through to closure.
- Commitments, the response window, language, and the products, devices, authorizations and organizations a question set concerns are modeled explicitly.
- The CTD code system now uses ICH M4 section numbers.
- The IG canonical was aligned, so the examples are now validated against the RTQ profiles. Before this, they were not.
- New interactive examples show one complete thread from first question to closure.

---

## 2. Site structure and content

### Navigation

| Before (11 tabs) | After (9 tabs) |
|---|---|
| Home, Use Case, How It Works, Architecture, Implementation, Lifecycle, Question Structure, Response Structure, Terminology, Artifacts, Acknowledgements | Home, Use Cases, How It Works, Lifecycle, Question Structure, Response Structure, Terminology, Artifacts, Acknowledgements |

- **Architecture** and **Implementation** pages removed. The resource relationship diagram and system vendor guidance moved to How It Works; attachment guidance moved to Response Structure; terminology extension guidance moved to Terminology.
- Page text reduced from about 12,500 to about 6,000 words, mainly by removing repetition (exchange methods, the "every question answered" rule, due dates and categories were each explained on up to four pages).

### Template and styling

- `ig.ini` switched from `fhir.base.template` to `hl7.fhir.template#current` (standard HL7 red banner).
- `sushi-config.yaml` given HL7 template settings: BR&R work group, trial-use status, FMM 1, World jurisdiction, BR&R publisher.
- New shared stylesheet `input/includes/rtq-style.html`, included at the top of each page, replacing per-page inline styles (hero, cards, callouts, badges, tables, step pipeline, before/after panels).

### Home

- New hero section modeled on the RWI IG: eyebrow, headline, lead paragraph, buttons (See an example, Walk through the lifecycle, Get involved) and the RTQ-versus-PDF diagram, redrawn as SVG.
- Sections: About this IG, Scope (in scope / out of scope cards), How It Works (5 steps: Ask, Answer, Assess, Repeat, Close), Exchange callout, Why adopt RTQ.
- **Removed** at the team's request: "RTQ and other standards" table and "Governance & Participation" section. The Get involved button links to the Confluence project page.
- Scope states that, because categories are regulator-defined, the structure can also serve other product domains (devices, veterinary, OTC).

### Use Cases

- Reduced to five benefit cards: structured and machine-readable; automation; standardization; harmonized across regions; discrete, identified, linked questions and answers.
- Three before/after scenarios: (A) the 24-hour clarification, (B) the complex clinical query (reuse), (C) labelling impact assessment (SmPC to package leaflet and artwork downstream; company core data sheet and sister products upstream).
- Removed: the 9-row benefit table, the CMC analytics scenario, "Future potential" and the exchange/migration section.

### How It Works

- Part 1 (question set) and Part 2 (response) diagrams updated: regulator-defined categories, product and procedure context, response window, assessment outcomes (new section E on the question set), commitments (new section E on the response), MAH as author.
- Cover letter described as built-in rich text: no separate cover letter document.
- Part 3 "How the pieces fit": resource relationship diagram (from the removed Architecture page), "RTQ specifies / your applications decide" comparison, and integration steps "For system vendors" (neutral wording; RIM no longer singled out).
- "Practical Topics" section removed; each topic now lives on the page that owns it.

### Lifecycle

- Banner linking to the lifecycle walkthrough at the top.
- New cycle overview (Issue, Respond, Assess, Close, with repeat loop) and four rule cards.
- Sections: identifiers and versioning; every open question gets an answer; assessment of responses (including multi-part questions); commitments; closing the dialogue; worked example table; reference (amendments and status codes).
- Removed: the working-group open point on an EMA-style "not resolved, no follow-up" outcome (meeting note), and two redundant sentences.

### Question Structure and Response Structure

- Each page: intro, a full-width Examples box linking the FHIR examples and interactive pages, then a Key elements table grouped by purpose.
- "Minimum to conform" boxes removed.
- Response Structure includes the attachments section (embed or point to; ePI attached via DocumentReference).

### Terminology

- Callout: apart from the terms the structure itself requires, business terminology such as categories is defined by each regulator, with an opportunity to harmonize across regulators.
- Code system table split into business terminology (preferred; regulators may use their own) and structural terminology (fixed by RTQ), with bindings shown.
- Sections on regulator-defined question categories, extending the shared terminology, Module 1 as regional, and future semantic architecture work.

### Naming

- APIX renamed throughout to Regulatory Workflows and Interactions (RWI).

---

## 3. Interactive examples (`input/images/examples/`)

- **New: `sample-lifecycle.html`**. One Type II variation (procedure NRA/H/C/005432/II/0023) in five steps: questions, response, follow-up with assessment outcomes, response, closure. It includes a per-question status tracker, both commitments and a commitments summary.
- **`sample-question.html`**: tabs for round 1, round 2 and round 3, showing category chips (major objection, minor concern), assessment badges, the assessor's comment, follow-up questions, accepted commitments and the closure banner.
- **`sample-response.html`**: tabs for response 1 and response 2, showing commitments on answers, resolved questions dimmed in round 2, and status.
- Both pages now show the FHIR `linkId`s, and their question wording matches the FHIR examples.
- Tabs are CSS-only. The IG Publisher rejects inline scripts.

---

## 4. Question set profile (RTQ Questionnaire)

| Element | Change |
|---|---|
| `url` | Now 1..1. The response links to the question set by this canonical URL. |
| `language` | New, 1..1 (BCP 47 code). |
| `derivedFrom` | 0..*. A follow-up round has a new `url` and derives from the previous round(s); an amendment keeps the same `url` with a new `version`. Replaces the `rtq-in-response-to` extension. |
| `effectivePeriod` | New, 1..1. `start` (required) = issue date; `end` = response deadline. A new agreed deadline updates `end`; earlier deadlines stay in version history. A closing question set has no `end`. Replaces the `rtq-due-date` extension. |
| `text` | The cover letter, as rich text (`status = additional`). |
| `subjectType` | Clarified: the kinds of subject (e.g., MedicinalProductDefinition, DeviceDefinition, Organization). |
| `extension:regulatorySubject` | Renamed from `regulatedContext`. 0..*. One occurrence per subject: `product` (0..1; MedicinalProductDefinition, DeviceDefinition or Identifier), `authorization` (0..*; RegulatedAuthorization or Identifier), `organization` (0..*, new; Organization or Identifier). |
| `contact[sender].telecom` | 1..2 (email required, phone optional). Previously 2..2, which effectively required a phone. |
| `item.code` | At least one category code (invariant `rtq-q-1`), preferred binding to the RTQ Question Category value set (CTD sections plus regulatory significance). Regulators may use their own code systems. The former mandatory `ctd` slice is gone. |
| `item.code` (assessment slice) | New. Required binding to Assessment Outcome: `resolved`, `not-resolved`, `further-questions`. Used only in follow-up rounds. |
| `item.required` | `true` for every open question, `false` for a question marked resolved (invariant `rtq-q-2`). No longer fixed to `true`. |
| `item.type` | Examples use `text` (FHIR R5 `question` is abstract and broke rendering). |
| `item.text` | Rich text via `rendering-xhtml` on the text string. |
| `item.extension:itemReference` | Limited to RTQ DocumentReference. ePI content is attached via the DocumentReference attachment URL. |

**Invariants**

- `rtq-q-1`: every question or group carries at least one category code.
- `rtq-q-2`: resolved questions have `required = false`; all other questions have `required = true`.
- `rtq-q-3`: a question with outcome `further-questions` is a group with the follow-up questions as child items.
- `rtq-q-4`: assessment outcomes require `derivedFrom` (fixed so it also checks top-level items).

**Closure rule:** a question set in which every question, including follow-up questions, is resolved closes the dialogue. There is no separate flag, and `status` keeps its standard FHIR meaning.

---

## 5. Response profile (RTQ QuestionnaireResponse)

| Element | Change |
|---|---|
| `language` | New, 1..1. |
| `questionnaire` | Clarified: the link back to the original question set this response answers. |
| `author` | Organization only (the MAH/applicant). Previously described as the regulator. |
| `source` | Now optional, PractitionerRole only (the regulatory contact). FHIR R5 does not allow Organization here. |
| `subject` | Must-Support: the product the response is about. The `regulatedContext` extension was removed from the response. |
| `text` | The cover letter, as rich text (`status = additional`). |
| `item.answer` | `valueString` only, with `rendering-xhtml` on the string for formatting. Attachments are no longer answer values. |
| `item.extension:itemReference` | New on the response. Supporting documents for an answer (RTQ DocumentReference). |
| `item.extension:commitment` | New `rtq-commitment` extension: `description` (required) and `dueDate`. |
| `status` | Documented: a response is sent as `completed`; `in-progress` is the internal draft; `amended` for a supplement or correction. |

Invariant `rtq-qr-1` (every response item has an answer or nested items) is unchanged.

**Commitment model:** the regulator *requests* a commitment with the `commitment` category code on the question; the company *offers* one with `rtq-commitment` on the answer; the regulator *accepts* it by marking the question `resolved` in the next round. Tracking and fulfilment afterwards are out of scope.

---

## 6. RTQ DocumentReference profile

- 10 MB embedding threshold removed. FHIR sets no size limit or threshold; documents are embedded (`attachment.data`) or referenced (`attachment.url`).
- `content.attachment.size` is now Must-Support, so receivers know the size of referenced content.

---

## 7. Extensions

| Extension | Status |
|---|---|
| `rtq-contact-purpose` | Unchanged |
| `rtq-regulatory-subject` | Renamed from `rtq-regulated-context`; now 0..*; adds devices and organizations; question set only |
| `rtq-procedure-identifier` | Unchanged |
| `rtq-response-version` | Unchanged |
| `rtq-commitment` | **New** |
| `rtq-item-reference` | Context set (question and response items), metadata added, limited to RTQ DocumentReference |
| `rtq-due-date` | **Removed** (replaced by `effectivePeriod`) |
| `rtq-in-response-to` | **Removed** (replaced by `derivedFrom`) |

Result: 6 extensions, down from 7.

---

## 8. Terminology

- **CTD Section Categories** (`ctd-categories-full`): recoded from slug codes (e.g., `quality.drug-product.stability.summary`) to ICH M4 section numbers (e.g., `3.2.P.8.1`), 168 codes. Numbering corrected to ICH M4, for example:
  - Impurities is 3.2.P.5.5, not 3.2.P.5.4 (which is Batch Analyses). Examples and pages corrected.
  - 3.2.P.4.5 / 3.2.P.4.6, 3.3, the 4.2.2.x, 4.2.3.7.x and 5.3.x sections, and 2.5 / 2.7 now follow ICH M4.
  - Made-up subdivisions (e.g., 5.3.3.1 Renal) removed.
- **Module 1** is regional, so the shared code system has one code (`1`). Regulators add their own Module 1 codes; an illustrative example code system (`example-nra-module-1`) shows how.
- **Regulatory Significance Category** (`rtq-question-category`): major objection, minor concern, other consideration, commitment. Unchanged codes; now one of the preferred category terminologies.
- **Assessment Outcome** (`rtq-assessment-outcome`): **new**. Resolved, not resolved, further questions.
- **Question Category value set** now combines CTD sections and regulatory significance codes (preferred binding).
- Code system URLs moved into the `http://hl7.org/fhir/uv/rtq` namespace (the CTD and contact-purpose code systems previously used `uv/src-ig` and `uv/brr`).

---

## 9. Example instances

A complete five-step thread for procedure NRA/H/C/005432/II/0023:

| Step | Instance | Content |
|---|---|---|
| 1 | `questionnaire-ID001` | 10 questions; response window 2025-11-11 to 2025-12-11 |
| 2 | `questionnaireresponse-ID001` (SP-RTQ-2025-0148) | All 10 answered; commitment offered on `quality-1` (48-month stability data, due 2027-06-30) |
| 3 | `questionnaire-ID001-round2` | Derives from ID001; 8 resolved (including acceptance of the quality-1 commitment), `product-3` not resolved with assessor comment, `quality-4` raises `quality-4.1` and `quality-4.2`; window 2025-12-01 to 2025-12-31 |
| 4 | `questionnaireresponse-ID001-round2` (SP-RTQ-2025-0163) | Only the three open questions answered; commitment offered on `quality-4.2` (toxicity study, due 2026-09-30) |
| 5 | `questionnaire-ID001-round3` | Derives from ID001-R2; all 12 questions resolved; no deadline; dialogue closed |

Other example changes:

- All examples carry `language = en` and an actual cover letter as narrative.
- `example-docref` is now the fee payment receipt the round-1 answer refers to (previously an unrelated HPLC validation report with a status code as its category).
- New `example-nra-module-1` code system (illustrative regulator Module 1 sections).
- Module 1 questions carry the shared CTD code `1` plus the regulator's own code (e.g., `1.3.1`).

---

## 10. Technical and build fixes

- **Canonical:** changed from `https://build.fhir.org/ig/HL7/rtq-ig` to `http://hl7.org/fhir/uv/rtq`, matching the URLs already used by the extensions, code systems and examples. Before this, the profiles were published under a different URL from the one the examples declared, so the examples were never validated against the RTQ profiles.
- **Question set URLs:** the examples had none, so responses could not be checked against their question sets. Now set, and each response links to its question set by canonical URL.
- **Rich text placement:** `rendering-xhtml` is only allowed on string elements; moved from items and answers to `item.text` and `answer.valueString`.
- **Item type:** `question` replaced by `text` (FHIR R5 `question` is abstract and crashed the renderer).
- **Build failures fixed:**
  - Jekyll recursion caused by a Liquid tag inside a stylesheet comment.
  - Inline `<script>` tags rejected by the IG Publisher (tabs rebuilt with CSS).
  - Slice names used in instances not declared against the profile.
- **Cleanup:**
  - Response `author` corrected from the regulator to the MAH.
  - 86 lines of commented-out code removed.
  - Unreferenced contained organization and unused aliases removed.
  - `ig.ini` entries pointing to non-existent files removed.
  - Orphaned `examples.md` removed.

---

## 11. Feedback traceability

| Feedback | Resolution |
|---|---|
| Yellow bar on Use Case page (Klesh) | Page rebuilt |
| "Human authoring is reduced" wording (Klesh) | Applied |
| Regulator reuse of past questions (Klesh) | Use Cases benefit 4 |
| "Lights out" wording (Klesh) | Removed |
| RIM integration wording (Klesh) | Tool-agnostic wording; vendor guidance made neutral |
| Company identifier on response (Klesh) | Both identifiers mandatory on the response |
| Relation to eCTD, portals; replace vs complement (Kent) | Exchange callout on Home |
| Versioning, amendments, traceability (Kent, PF/Bev, Generis) | Lifecycle page; `derivedFrom`; response version |
| Simple exchanges and early adoption (Kent) | Exchange callout; scope statement |
| Large documents and file size (Kent) | Embed or point to; no size limit |
| AI on top of the structure (Kent, Anderson) | Stated as out of scope |
| Product / authorization linkage (Generis, PF/Bev) | `rtq-regulatory-subject` |
| Procedure linkage (Generis) | `rtq-procedure-identifier` |
| Resource relationship diagram (Generis) | How It Works Part 3 |
| Commitment tracking (Generis, PF/Bev) | Commitment model (request, offer, accept); tracking out of scope |
| Multi-round Q&A, branching, accept 5 of 6 (PF/Bev, Generis) | Assessment outcomes, follow-up questions, closure rule |
| Every question matched by a response (PF/Bev) | `required` rule, invariants, examples aligned |
| Multiple categories per question (PF/Bev) | At least one category per question (`rtq-q-1`); several allowed |
| Due date model (PF/Bev) | `effectivePeriod` |
| Diagram vs example alignment (PF/Bev) | Examples and diagrams aligned |
| Referencing ePI content (PF/Bev) | Via DocumentReference attachment |
| Terminology for non-CTD domains (Anderson) | Regulator-defined categories; Terminology callout |
| Assessment conclusion per question (EMA template) | Assessment Outcome code system |
| Impact assessment use case (PF/Bev) | Use Cases scenario C |

---

## 12. Open items

- **EMA "issue not resolved, but no follow-up questions":** ends the dialogue with an issue on record. Not expressible with the current outcome codes; a fourth code (e.g., `not-resolved-closed`) would cover it. Removed from the IG text; needs a working group decision.
- **Amended response example:** `amended` status is documented but not shown in the examples.
- **QA report review:** first build in which the examples are validated against the profiles; review `output/qa.html` for new messages.
- **Semantic Architecture Tiger Team:** terminology for content referenced from questions and answers (future work).
- **Master files (DMF/ASMF):** tripartite communication planned for a future phase.
- **HL7 PQI collaboration:** moving quality/CMC answers from attachments toward structured data.
- **Pilots:** recruiting regulator and company pairs.
