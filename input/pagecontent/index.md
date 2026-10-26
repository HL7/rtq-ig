### Introduction

The **Response to Question (RTQ)** Implementation Guide is the standardized framework for **structuring regulatory questions and responses to regulatory questions**. 

Built on HL7 FHIR R5, it replaces static Word and PDF question/response documents with traceable, machine-readable FHIR resources, enabling precise tracking, automated triage, and global harmonization.

RTQ encapsulates the entire question (e.g., cover letter, questions, supporting attachments, and metadata) and the response to questions (e.g., cover letter, response to questions, supporting attachments, and metadata).

*This guide defines the technical framework to create a seamless Q&A loop between Regulators and Applicants.*

<div style="background-color: #f0fdf4; border: 1px solid #bbf7d0; border-radius: 8px; padding: 20px; margin: 24px 0; text-align: center; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);">
  <h3 style="margin-top: 0; color: #166534; font-size: 1.25rem;">✨ See It In Action</h3>
  <p style="color: #15803d; margin-bottom: 16px; font-size: 1rem;">Experience the power of structured FHIR data rendered into high-fidelity, interactive dashboards.</p>
  <div style="display: flex; gap: 16px; justify-content: center; flex-wrap: wrap;">
    <a href="examples/sample-question.html" target="_blank" style="background-color: #22c55e; color: white; padding: 10px 20px; border-radius: 6px; text-decoration: none; font-weight: 600; font-size: 0.95rem;">View Regulator Question</a>
    <a href="examples/sample-response.html" target="_blank" style="background-color: #3b82f6; color: white; padding: 10px 20px; border-radius: 6px; text-decoration: none; font-weight: 600; font-size: 0.95rem;">View Applicant Response</a>
  </div>
</div>

### Why Adopt RTQ?

<div style="display: flex; gap: 0; margin-bottom: 28px; border: 1px solid #e2e8f0; border-radius: 10px; overflow: hidden; text-align: center;">
  <div style="flex: 1; padding: 20px 16px; border-right: 1px solid #e2e8f0; background: #fafbff;">
    <div style="font-size: 1.6rem; font-weight: 800; color: #2563eb;">Days → Min</div>
    <div style="font-size: 0.82rem; color: #64748b; margin-top: 4px;">Triage time with automated routing</div>
  </div>
  <div style="flex: 1; padding: 20px 16px; border-right: 1px solid #e2e8f0; background: #fafbff;">
    <div style="font-size: 1.6rem; font-weight: 800; color: #2563eb;">1 Format</div>
    <div style="font-size: 0.82rem; color: #64748b; margin-top: 4px;">For all regulators</div>
  </div>
  <div style="flex: 1; padding: 20px 16px; background: #fafbff;">
    <div style="font-size: 1.6rem; font-weight: 800; color: #2563eb;">100%</div>
    <div style="font-size: 0.82rem; color: #64748b; margin-top: 4px;">Machine-readable content</div>
  </div>
</div>

**Structured &amp; Traceable.** Every question is a discrete `Questionnaire` item; every answer is a linked `QuestionnaireResponse`. No more lost questions or ambiguous email threads.

**Harmonized Across Agencies.** One standard format for all international regulators. Build your system once to handle questions from all regulators.

**Analytics-Ready.** Because questions are structured data, instantly visualize trends: response cycle times, most frequent question topics, regional variances, and predict questions in advance or response quality.

**Automated Workflow.** Route questions to the correct SME based on metadata (e.g., each question is tagged with a specific CTD section), reducing triage time from days to minutes.

### Background

In biopharmaceutical regulatory affairs, health authorities routinely issue formal questions during the review of regulatory applications. Traditionally, these are exchanged as unstructured Word or PDF documents via email or portals. This results in high manual effort, limited traceability, and "dead data" that cannot be analyzed.

RTQ changes that by modeling questions as **Questionnaires** and responses as versioned **QuestionnaireResponses**, leveraging the FHIR standard to align regulatory Q&A processes with the modern digital systems.

<div style="text-align: center; margin: 32px 0;">
  <img src="rtq-vs-pdf-diagram.png" alt="Circular diagram comparing today's manual PDF process (weeks, manual, error-prone) versus FHIR RTQ (real-time, automated, machine-readable)" style="max-width: 560px; width: 100%;" />
  <p style="font-size: 0.85rem; color: #64748b; margin-top: 8px; font-style: italic;">Figure 1: Manual PDF exchange vs. FHIR RTQ — from weeks to real-time</p>
</div>

This aligns with the broader strategy defined in the [APIX Implementation Guide](https://build.fhir.org/ig/HL7/APIX---API-Exchange-for-Medicinal-Products/branches/main/index.html): moving towards the "Real-time algorithmic exchange" envisioned in the 2023 *International Journal of Pharmaceutics* framework [(click to read)](https://www.sciencedirect.com/science/article/pii/S0378517323007627). 

Just as [ISO 20022](https://www.iso20022.org) harmonized global payments, RTQ + APIX harmonizes the regulatory dialogue—standardizing the *content* (RTQ) and the *exchange* (APIX) to unlock sub-second workflows.

<table style="width: 100%; border-collapse: collapse; margin-bottom: 24px;">
  <thead>
    <tr style="background-color: #f1f5f9; border-bottom: 2px solid #cbd5e1;">
      <th style="padding: 12px; text-align: left; width: 50%;">✅ In Scope</th>
      <th style="padding: 12px; text-align: left; width: 50%;">❌ Out of Scope</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 12px; border-bottom: 1px solid #e2e8f0; vertical-align: top;">
        <ul style="margin: 0; padding-left: 20px;">
          <li style="margin-bottom: 8px;"><strong>Health Authority Questions:</strong> Profiling of <code>Questionnaire</code> for widely used regulatory templates (Validation issues, Major Objections, List of Questions).</li>
          <li style="margin-bottom: 8px;"><strong>Sponsor Responses:</strong> Profiling of <code>QuestionnaireResponse</code> for applicant replies, supporting evidence attachments, and cross-references.</li>
          <li style="margin-bottom: 8px;"><strong>Regulatory Metadata:</strong> Tagging questions and responses with category codes (e.g., CTD sections, regulatory significance), dates, unique identifiers, organization details.</li>
          <li><strong>Assessment of Responses:</strong> The regulator's per-question conclusion on a response (resolved, not resolved, raises further questions), carried in the follow-up question set.</li>
        </ul>
      </td>
      <td style="padding: 12px; border-bottom: 1px solid #e2e8f0; vertical-align: top;">
        <ul style="margin: 0; padding-left: 20px;">
          <li style="margin-bottom: 8px;"><strong>Exchange of questions and responses:</strong> How the files travel between the parties (email, portal, eCTD, central platform, or API) and how they are packaged for transport. For API-based exchange, see the <a href="https://build.fhir.org/ig/HL7/APIX---API-Exchange-for-Medicinal-Products/branches/main/index.html">APIX Implementation Guide</a>. The exchange methods described in this guide are illustrative examples only.</li>
          <li style="margin-bottom: 8px;"><strong>Use of AI and automation:</strong> How organizations use AI or automation to triage, draft, check, or analyze questions and responses. The structure makes this possible; how to do it is each implementer's choice.</li>
          <li style="margin-bottom: 8px;"><strong>Application features and internal workflow:</strong> Routing, task assignment, reminders, search, dashboards, and any categories a company adds internally on top of the question set it received.</li>
          <li><strong>Master Files (DMF/ASMF) — future scope:</strong> Tripartite communication between regulator, applicant, and Master File holder (access via Letter of Authorization) is planned for a future phase, after RTQ is established for standard drug applications.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

### How RTQ Is Exchanged

*Exchange is out of scope for RTQ: RTQ only structures the question and the response. This section shows, as examples, how the structured files can travel over channels that exist today.*

RTQ deliberately separates **content** from **transport**. An RTQ Questionnaire or QuestionnaireResponse is just a file (XML or JSON) — the structured equivalent of today's DOCX/PDF question document — so it can be sent and received the same way current question documents are:

<table style="width: 100%; border-collapse: collapse; margin-bottom: 24px;">
  <thead>
    <tr style="background-color: #f1f5f9; border-bottom: 2px solid #cbd5e1;">
      <th style="padding: 10px; text-align: left;">Channel</th>
      <th style="padding: 10px; text-align: left;">How RTQ travels</th>
    </tr>
  </thead>
  <tbody>
    <tr><td style="padding: 10px; border-bottom: 1px solid #e2e8f0;"><strong>Email</strong></td><td style="padding: 10px; border-bottom: 1px solid #e2e8f0;">The RTQ file is attached to an email, exactly as a PDF would be today. Suitable for simple clarification exchanges and for early adoption before portals or APIs are available.</td></tr>
    <tr><td style="padding: 10px; border-bottom: 1px solid #e2e8f0;"><strong>Regulatory portals</strong> (e.g., FDA ESG, national gateways)</td><td style="padding: 10px; border-bottom: 1px solid #e2e8f0;">The RTQ file is uploaded/downloaded through the existing portal, like any other submission document.</td></tr>
    <tr><td style="padding: 10px; border-bottom: 1px solid #e2e8f0;"><strong>eCTD</strong></td><td style="padding: 10px; border-bottom: 1px solid #e2e8f0;">The RTQ response file is placed inside an eCTD sequence and submitted to the regulator through the normal submission route.</td></tr>
    <tr><td style="padding: 10px; border-bottom: 1px solid #e2e8f0;"><strong>Central platform</strong></td><td style="padding: 10px; border-bottom: 1px solid #e2e8f0;">A shared platform hosts the question/response exchange; both parties read and write RTQ resources there.</td></tr>
    <tr><td style="padding: 10px; border-bottom: 1px solid #e2e8f0;"><strong>API (APIX)</strong></td><td style="padding: 10px; border-bottom: 1px solid #e2e8f0;">The RTQ resource is carried in an APIX Task for fully automated, real-time exchange — the target end-state.</td></tr>
  </tbody>
</table>

Three points follow from this design, answering the most common first-adopter questions:

**RTQ complements current processes — it does not replace them.** It changes the *format* of the question/response document, not the channel it travels on or the procedure it belongs to. A regulator or company can adopt RTQ without waiting for any counterpart infrastructure. Any current or future method of exchange is acceptable.

**Regulator differences are handled by harmonizing structure, not content.** RTQ harmonizes only the *structure* of the question and response template. FDA, EMA, PMDA, and other authorities can continue to phrase their questions exactly as they do now, apply their own local rules, and use their own procedures — all within the common RTQ structure. Jurisdiction, country, and language metadata accommodate local needs without jurisdiction-specific profiles.

**Simple exchanges stay simple.** Where a regulator today accepts simple responses by email, meeting, or web page, an RTQ file can travel the same simple route. Adopting RTQ does not force a formal submission process onto informal exchanges. See [Implementation & Exchange](implementation.html) for migration guidance and hybrid operation.

### Governance & Collaboration

RTQ is developed under the **HL7's Biomedical Research and Regulation (BR&R) Working Group** with active participation from regulators, pharmaceutical companies, and technology vendors.

All meetings are public; notes and recordings are available via [HL7 BR&R Working Group's RTQ project page](https://confluence.hl7.org/spaces/BRR/pages/358267438/Response+to+Health+Authority+Questions+RTQ).

The RTQ project coordinates with related HL7 initiatives so that response structures stay compatible with emerging standards for structured regulatory data — in particular the **Product Quality Information (PQI)** project for structured CMC/quality data (joint use cases and testing), the **APIX** project for API-based exchange, and the **ePI** work for structured product information. A Semantic Architecture Tiger Team is being formed to define terminology bindings for content domains referenced from RTQ questions and responses.

### Pilots

Pilot implementations are the next step for this guide: we are recruiting regulator/sponsor pairs to run pilot exchanges using the profiles in this version. If your organization is interested in piloting RTQ, please get in touch via the project page below.

### Get Involved

- **Join the weekly calls** — meeting links, notes, and recordings are on the [RTQ project page on HL7 Confluence](https://confluence.hl7.org/spaces/BRR/pages/358267438/Response+to+Health+Authority+Questions+RTQ) (see also the [HL7 BR&R Working Group page](http://www.hl7.org/Special/committees/brr)).
- **Test the reference implementation** — try the [interactive question example](examples/sample-question.html) and [interactive response example](examples/sample-response.html), and validate your own instances against the [profiles](artifacts.html).
- **Contribute on GitHub** — source for this guide lives at [github.com/HL7/rtq-ig](https://github.com/HL7/rtq-ig/); issues and pull requests are welcome.
- **CMC and Manufacturing SMEs are specifically invited** to contribute reference content — such as complex stability tables or analytical validation reports — to ensure the standard handles large-scale technical datasets well (see the attachment guidance on the [Implementation & Exchange](implementation.html) page).

We welcome industry, solution providers, and regulators from every region to contribute to this global standard.