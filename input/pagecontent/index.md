### Introduction

The **Response to Question (RTQ)** Implementation Guide is the standardized framework for the **structured, algorithmic exchange** of regulatory questions and responses. Built on HL7 FHIR R5, it replaces static Word and PDF documents with traceable, machine-readable resources—enabling precise tracking, automated triage, and global harmonization.

*This guide defines the technical framework to create a seamless Q&A loop between Regulators and Applicants.*

### Why Adopt RTQ?

1.  **Structured & Traceable**
    Every question is a discrete `Questionnaire` item; every answer is a linked `QuestionnaireResponse`. No more lost questions or ambiguous email threads.

2.  **Harmonized Across Agencies**
    One standard format for FDA, EMA, PMDA, and other health authorities. Build your system once to handle questions from any regulator.

3.  **Analytics-Ready**
    Because questions are structured data, you can instantly visualize trends: response cycle times, most frequent question topics, and regional variances.

4.  **Automated Workflow**
    APIs can automatically route questions to the correct Subject Matter Expert (SME) based on metadata (e.g., "Quality", "Clinical"), reducing triage time from days to minutes.

### Background

In biopharmaceutical regulatory affairs, health authorities routinely issue formal questions during the review of marketing authorization applications. Traditionally, these are exchanged as unstructured Word or PDF documents via email or portals. This results in high manual effort, limited traceability, and "dead data" that cannot be analyzed.

RTQ changes that by modeling questions as reusable **FHIR Questionnaires** and responses as versioned **QuestionnaireResponses**, aligning regulatory Q&A with the modern digital ecosystem of healthcare.

This aligns with the broader strategy defined in the **APIX Implementation Guide**: moving towards the "Real-time algorithmic exchange" envisioned in the 2023 *International Journal of Pharmaceutics* framework [(click to read)](https://www.sciencedirect.com/science/article/pii/S0378517323007627). 

Just as [ISO 20022](https://www.iso20022.org) harmonized global payments, RTQ + APIX harmonizes the regulatory dialogue—standardizing the *content* (RTQ) and the *exchange* (APIX) to unlock sub-second decision making.

### In Scope

- **Health Authority Questions**: Profiling of `Questionnaire` for widely used regulatory templates (Validation issues, Major Objections, Request for Information).
- **Sponsor Responses**: Profiling of `QuestionnaireResponse` for applicant replies, supporting evidence attachments, and cross-references.
- **Regulatory Metadata**: Standardized extensions for due dates, severity, and review status.

### Out of Scope

- The full submission packaging and transport layer (see the [APIX Implementation Guide](https://build.fhir.org/ig/HL7/APIX---API-Exchange-for-Medicinal-Products/branches/main/index.html) for instructions on how to package and transport the questionnaire and questionnaire response).

### Governance & Collaboration

RTQ is developed under the **HL7's Biomedical Research and Regulation (BR&R) Working Group** with active participation from regulators, pharmaceutical companies, and technology vendors.

All meetings are public; notes and recordings are available via [HL7 BR&R Working Group's RTQ project page](https://confluence.hl7.org/spaces/BRR/pages/358267438/Response+to+Health+Authority+Questions+RTQ).

### Get Involved

- Join the weekly calls.
- Test the reference implementation.

We welcome industry, solution providers, and regulators from every region to contribute to this global standard.