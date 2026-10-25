This page summarizes the terminology defined and used by the RTQ Implementation Guide. The complete, rendered definitions are on the [Artifacts](artifacts.html) page.

### Code Systems

<table border="1" style="border-collapse: collapse; width: 100%; border-color: #ddd;">
  <thead style="background-color: #f5f5f5;">
    <tr>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Code System</th>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Purpose</th>
      <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Used on</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>RTQ CTD Categories (Full)</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;">The full Common Technical Document hierarchy (modules, sections, subsections). Every question carries at least one CTD code — this is what enables automated routing to module owners and response reuse across similar queries.</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>Questionnaire.item.code</code> (ctd slice, mandatory)</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>RTQ Question Category</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;">Regulatory significance of a question: <code>major-objection</code>, <code>minor-concern</code>, <code>other-consideration</code>, <code>commitment</code>. Regulators are encouraged to adopt these as <em>preferred</em> terms for international alignment; local terminology remains welcome in the question text.</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>Questionnaire.item.code</code> (category slice, optional)</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>RTQ Questionnaire Type</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;">The regulatory template the question set represents: list of questions, list of issues, information request, request for clarification, request for supplementary information, deficiency letter, consolidated list of questions.</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>Questionnaire.code</code></td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>RTQ Identifier Type</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;">Distinguishes company-issued and regulator-issued identifiers on both artifacts.</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>identifier.type</code> on both profiles</td>
    </tr>
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;"><strong>Contact Purpose</strong></td>
      <td style="padding: 8px; border: 1px solid #ddd;">Role of a contact in the exchange: <code>SENDER</code> (health authority) and <code>RECIPIENT</code> (MAH), plus <code>CC</code> and <code>REVIEWER</code> for local use.</td>
      <td style="padding: 8px; border: 1px solid #ddd;"><code>Questionnaire.contact</code> (via the <code>rtq-contact-purpose</code> extension)</td>
    </tr>
  </tbody>
</table>

### CTD Granularity Policy

The CTD CodeSystem follows the CTD section hierarchy — questions are coded at section/subsection level (e.g., `3.2.P.8.1`). Experience so far indicates this is the right default granularity for routing and reuse. **Some implementers may need finer granularity**, and the CodeSystem is designed to be extended rather than forked:

- If you need more granular codes (or additional regulatory topics beyond the standard CTD structure), request them via the [RTQ project page](https://confluence.hl7.org/spaces/BRR/pages/358267438/Response+to+Health+Authority+Questions+RTQ) or a [GitHub issue](https://github.com/HL7/rtq-ig/issues). The project will extend the shared CodeSystem so that all implementations stay aligned.
- Avoid minting local codes in private systems: the value of the CTD tagging comes from every party interpreting the same code the same way.

The item-level CTD binding is *extensible* — codes beyond the current CodeSystem are permitted where genuinely necessary, but the expectation is that they are fed back into the shared CodeSystem promptly.

### Semantic Architecture (Future Work)

A Semantic Architecture Tiger Team is being formed to define recommended terminology bindings for the *content* domains referenced from questions and responses (for example, terminologies used within referenced ePI or product data, such as substance, dose form, and route vocabularies). This work will land in a future version of this page. Implementers interested in contributing should join via the project page above.
