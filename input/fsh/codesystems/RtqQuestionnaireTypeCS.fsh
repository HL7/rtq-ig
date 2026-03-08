CodeSystem: RtqQuestionnaireTypeCS
Id: rtq-questionnaire-type-cs
Title: "RTQ Questionnaire Type Code System"
Description: "Code system defining the high-level types of regulatory questionnaires exchanged between industry and health authorities."
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true
* ^date = "2025-11-21"
* ^caseSensitive = true
* ^content = #complete
* #list-of-questions "List of Questions" "A formal list of questions raised by a regulator requiring a written response from the marketing authorisation holder."
* #list-of-issues "List of Issues" "A consolidated list of major and minor issues identified during assessment that must be resolved before approval or variation."
* #information-request "Information Request" "A formal request for additional information or clarification during evaluation of a submission (e.g., EMA Day 120/180 LoQ, FDA IR, Health Canada Clarifax)."
* #request-for-clarification "Request for Clarification" "Request seeking clarification on specific points in a submission (often used by PMDA, Health Canada, Swissmedic)."
* #request-for-supplementary-information "Request for Supplementary Information" "Used by some regulators (e.g., Swissmedic RSI, Saudi SFDA) for additional data requests."
* #deficiency-letter "Deficiency Letter" "Formal notification of deficiencies that must be addressed (common in some national procedures)."
* #consolidated-list-of-questions "Consolidated List of Questions" "A single consolidated set of questions from multiple assessment teams (e.g., EMA PRAC/RAPPS/CHMP consolidated LoQ)."