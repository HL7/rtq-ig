CodeSystem: RtqAssessmentOutcomeCS
Id: rtq-assessment-outcome
Title: "RTQ Assessment Outcome Code System"
Description: "The regulator's assessment of the company's response to a question, carried on that question when it is re-issued in a follow-up question set. Mirrors the per-question conclusion used in regulatory assessment templates (e.g., issue resolved / not resolved / additional resulting questions)."
* ^version = "0.2.0"
* ^url = "http://hl7.org/fhir/uv/rtq/CodeSystem/rtq-assessment-outcome"
* ^status = #draft
* ^experimental = true
* ^date = "2026-10-25"
* ^caseSensitive = true
* ^content = #complete
* #resolved "Resolved" "The regulator accepts the response. The question is closed and no further answer is expected."
* #not-resolved "Not Resolved" "The response is not accepted. The question remains open and must be answered again in the next response."
* #further-questions "Raises Further Questions" "The response raises follow-up questions. The follow-up questions are carried as child items of this question and must each be answered."
