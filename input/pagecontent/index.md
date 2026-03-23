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
          <li><strong>Regulatory Metadata:</strong> Tagging questions and responses with CTD sections, dates, unique identifiers, organization details.</li>
        </ul>
      </td>
      <td style="padding: 12px; border-bottom: 1px solid #e2e8f0; vertical-align: top;">
        <ul style="margin: 0; padding-left: 20px;">
          <li><strong>Transport Mechanisms:</strong> The full submission packaging and transport layer. For instructions on how to package and transport the questionnaire and response via API, see the <a href="https://build.fhir.org/ig/HL7/APIX---API-Exchange-for-Medicinal-Products/branches/main/index.html">APIX Implementation Guide</a>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

### Governance & Collaboration

RTQ is developed under the **HL7's Biomedical Research and Regulation (BR&R) Working Group** with active participation from regulators, pharmaceutical companies, and technology vendors.

All meetings are public; notes and recordings are available via [HL7 BR&R Working Group's RTQ project page](https://confluence.hl7.org/spaces/BRR/pages/358267438/Response+to+Health+Authority+Questions+RTQ).

### Get Involved

- Join the weekly calls.
- Test the reference implementation.

We welcome industry, solution providers, and regulators from every region to contribute to this global standard.