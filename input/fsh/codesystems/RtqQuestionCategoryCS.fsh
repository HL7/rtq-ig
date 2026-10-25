CodeSystem: RtqQuestionCategoryCS
Id: rtq-question-category
Title: "RTQ Question Category Code System"
Description: "Categories that classify the regulatory significance of a question. Regulators are encouraged to adopt these categories as preferred terms to support international alignment, while retaining their own local terminology in the question text where required."
* ^version = "0.2.0"
* ^url = "http://hl7.org/fhir/uv/rtq/CodeSystem/rtq-question-category"
* ^status = #draft
* ^experimental = true
* ^date = "2026-08-08"
* ^caseSensitive = true
* ^content = #complete
* #major-objection "Major Objection" "A significant deficiency that precludes approval unless satisfactorily resolved (e.g., EMA Major Objection, FDA deficiency requiring a complete response)."
* #minor-concern "Minor Concern" "A point requiring clarification or minor supplementary information that does not by itself preclude approval (e.g., EMA Other Concern, clarification request)."
* #other-consideration "Other Consideration" "An observation, recommendation, or administrative point that is not a deficiency but requires acknowledgement or action."
* #commitment "Commitment" "A question or response item that establishes or relates to a post-approval commitment or follow-up measure to be fulfilled at a later date. Items carrying this category are intended to be tracked through linked Task/Flag resources."
