{% include rtq-style.html %}

This page summarizes the terminology used in RTQ. The full definitions are on the [Artifacts](artifacts.html) page.

<div class="rtq-callout">
  <div class="ic">💡</div>
  <div>
    <div class="h">Business terminology is defined by each regulator, with an opportunity to harmonize</div>
    <p>Apart from the terms FHIR and RTQ require for the structure itself (resource types, status codes, identifier types, contact roles, and assessment outcomes), the <strong>business terminology</strong>, such as question categories and questionnaire types, <strong>can be defined by each regulator</strong>, in its own code system and language.</p>
    <p>There is, however, a real <strong>opportunity to harmonize across regulators</strong>. Wherever authorities can agree on shared terms, such as the CTD sections and the significance categories below, companies can route, reuse, and analyze questions the same way for every authority. The terminologies in this guide are offered as that common starting point.</p>
  </div>
</div>

<div class="rtq-sec" id="code-systems">Code systems</div>

<table class="rtq-table">
  <thead><tr><th>Code system</th><th>Purpose</th><th>Used on</th><th>Binding</th></tr></thead>
  <tbody>
    <tr class="grp"><td colspan="4">Business terminology: preferred, regulators may use their own</td></tr>
    <tr><td><a href="CodeSystem-ctd-categories-full.html"><strong>CTD Categories (Full)</strong></a></td><td>Common Technical Document sections at ICH M4 granularity, with the section number as the code (e.g., <code>3.2.P.8.1</code>). Tagging a question with its CTD section lets it be routed to the module owner and matched with earlier answers. Module 1 is regional, so it has a single code (<code>1</code>).</td><td><code>Questionnaire.item.code</code> (category)</td><td>Preferred</td></tr>
    <tr><td><a href="CodeSystem-rtq-question-category.html"><strong>Regulatory Significance Category</strong></a></td><td><code>major-objection</code>, <code>minor-concern</code>, <code>other-consideration</code>, <code>commitment</code>.</td><td><code>Questionnaire.item.code</code> (category)</td><td>Preferred</td></tr>
    <tr><td><a href="CodeSystem-rtq-questionnaire-type-cs.html"><strong>Questionnaire Type</strong></a></td><td>The template a question set represents: list of questions, list of issues, information request, request for clarification, request for supplementary information, deficiency letter, consolidated list of questions.</td><td><code>Questionnaire.code</code></td><td>Extensible</td></tr>
    <tr class="grp"><td colspan="4">Structural terminology: fixed by RTQ</td></tr>
    <tr><td><a href="CodeSystem-rtq-assessment-outcome.html"><strong>Assessment Outcome</strong></a></td><td><code>resolved</code>, <code>not-resolved</code>, <code>further-questions</code>: the regulator's verdict on an answer in a follow-up round. See <a href="lifecycle.html#assessment-of-responses">Lifecycle</a>.</td><td><code>Questionnaire.item.code</code> (assessment)</td><td>Required</td></tr>
    <tr><td><a href="CodeSystem-rtq-identifier-type.html"><strong>Identifier Type</strong></a></td><td>Distinguishes company-issued and regulator-issued identifiers.</td><td><code>identifier.type</code> on both profiles</td><td>Fixed</td></tr>
    <tr><td><a href="CodeSystem-contact-purpose.html"><strong>Contact Purpose</strong></a></td><td><code>SENDER</code> (authority) and <code>RECIPIENT</code> (MAH), plus <code>CC</code> and <code>REVIEWER</code> for local use.</td><td><code>Questionnaire.contact</code></td><td>Required</td></tr>
  </tbody>
</table>

<div class="rtq-sec" id="categories">Question categories</div>

Every question carries **at least one category code**, set by the regulator. The [RTQ Question Category value set](ValueSet-rtq-question-category-vs.html) combines the two preferred terminologies, CTD sections and regulatory significance, with a *preferred* binding:

- A question can carry several categories, such as a CTD section plus `major-objection`, or two CTD sections for a multidisciplinary question.
- A regulator can add its own codes, or use its own code system instead.
- Product domains that do not use the CTD, such as medical devices, veterinary, or OTC products, use the terminology that fits them.
- Categories belong to the regulator's question set. A company that wants its own classifications keeps them in its internal applications, on top of the question set it received.

<div class="rtq-sec" id="extending">Extending the shared terminology</div>

The CTD code system follows the ICH M4 table of contents for Modules 2 to 5, using the section numbers as codes (e.g., `3.2.P.8.1` Stability Summary and Conclusion), which suits routing and reuse.

**Module 1 is regional.** Its sections differ by region, so the shared code system has one Module 1 code (`1`). A regulator tags a Module 1 question with that shared code plus a code from its own Module 1 code system. The examples show this with an [illustrative regulator code system](CodeSystem-example-nra-module-1.html), for example `1` + `1.3.1` (SmPC, Labelling and Package Leaflet). If you need finer granularity, new topics, or more categories or questionnaire types, ask for them through the [project page](https://confluence.hl7.org/spaces/BRR/pages/358267438/Response+to+Health+Authority+Questions+RTQ) rather than creating codes in isolation. The project will extend the shared code systems so that every implementation benefits.
