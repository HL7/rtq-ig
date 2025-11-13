The HTML rendering below shows an example Regulator Question using synthetic data.

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Regulatory Questionnaire - EMA List of Questions (ID001)</title>
    <style>
        body{font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;background:#f5f5f7;color:#1d1d1f;line-height:1.5;margin:0;padding:40px 20px;max-width:840px;margin:0 auto}
        .header{text-align:center;margin-bottom:40px;border-bottom:1px solid #d2d2d7;padding-bottom:20px}
        .header h1{color:#007aff;font-size:2.5em;font-weight:600;margin:0}
        .header p{color:#86868b;font-size:1.1em;margin:8px 0 0}
        .contacts{display:flex;gap:20px;margin-bottom:30px}
        .contact{flex:1;background:#fff;border-radius:12px;padding:20px;box-shadow:0 4px 12px rgba(0,0,0,0.05)}
        .contact h3{color:#007aff;margin-top:0}
        .container{background:#fff;border-radius:12px;box-shadow:0 4px 12px rgba(0,0,0,0.05);overflow:hidden}
        .title{background:#f2f2f7;padding:20px 30px;border-bottom:1px solid #d2d2d7}
        .title h2{margin:0;font-size:1.8em}
        .question{margin:0;padding:28px 30px;border-bottom:1px solid #f2f2f7;display:flex;gap:24px;align-items:flex-start}
        .question:last-child{border-bottom:none}
        .q-number{width:44px;height:44px;background:#007aff;color:#fff;border-radius:50%;display:flex;align-items:center;justify-content:center;
                  font-weight:bold;font-size:1.3em;flex-shrink:0;box-shadow:0 4px 12px rgba(0,122,255,0.3)}
        .q-content{flex:1}
        .q-code-badge{background:#e5f0ff;color:#0051bb;padding:8px 14px;border-radius:8px;font-size:0.85em;font-weight:600;
                       display:inline-block;margin-bottom:12px;letter-spacing:0.5px;box-shadow:0 2px 6px rgba(0,81,187,0.15)}
        .q-title{font-weight:600;font-size:1.18em;margin:0 0 10px;color:#1d1d1f;line-height:1.4}
        .q-text{font-size:1em;color:#1d1d1f}
        .q-text p{margin:6px 0}
        .q-text a{color:#007aff;text-decoration:none}
        .q-text a:hover{text-decoration:underline}
        .q-text ul{margin:8px 0;padding-left:22px}
        .q-text li{margin:4px 0}
        .q-text table{width:100%;border-collapse:collapse;margin-top:12px;font-size:0.95em}
        .q-text th,.q-text td{border:1px solid #d2d2d7;padding:9px;text-align:left}
        .q-text th{background:#f2f2f7;font-weight:600}
        .note{background:#f9fbff;padding:12px;border-left:4px solid #0066cc;margin:12px 0;border-radius:0 6px 6px 0}
        .image-placeholder{background:#e5e5ea;border:1px dashed #999;border-radius:10px;padding:50px;text-align:center;
                             color:#666;font-style:italic;margin:16px 0;font-size:0.95em}
        .footer{text-align:center;padding:36px 20px;color:#86868b;font-size:0.9em;border-top:1px solid #d2d2d7}
    </style>
</head>
<body>

<div class="header">
    <h1>Regulatory Questionnaire</h1>
    <p>EMA List of Questions – Type II Variation (ID001)</p>
    <p>Procedure Number: EMEA/H/C/005432/II/0023 | Response due: 2025-12-11</p>
</div>

<div class="contacts">
    <div class="contact">
        <h3>Sender: European Medicines Agency</h3>
        <p style="margin:0;font-weight:bold;">Dr. Jane Doe</p>
        <p style="margin:0;font-style:italic;">Scientific Officer</p>
        <p style="margin:0;"><b>Scientific and Regulatory Management</b><br>Human Medicines Evaluation Division<br>European Medicines Agency</p>
        <p style="margin:0;color:#0066cc"><a href="mailto:jane.doe@ema.europa.eu">jane.doe@ema.europa.eu</a> | +31-88-781-6000</p>
        <p style="margin:0;font-size:0.9em;color:#666">Domenico Scarlattilaan 6, 1083 HS Amsterdam, Netherlands</p>
    </div>
    <div class="contact">
        <h3>Recipient: SynthPharma AG</h3>
        <p style="margin:0;font-weight:bold;">Dr. John Doe</p>
        <p style="margin:0;font-style:italic;">Head of Regulatory Affairs</p>
        <p style="margin:0;"><b>SynthPharma AG</b><br>Global Regulatory Strategy<br>Basel, Switzerland</p>
        <p style="margin:0;color:#0066cc"><a href="mailto:john.doe@synthpharma.example">john.doe@synthpharma.example</a></p>
        <p style="margin:0;font-size:0.9em;color:#666">123 Synthetic Research Blvd, 4000 Basel, Switzerland</p>
    </div>
</div>

<div class="container">
    <div class="title"><h2>Questionnaire: RegulatoryQA-ID001</h2></div>

    <!-- Question 1 -->
    <div class="question">
        <div class="q-number">1</div>
        <div class="q-content">
            <div class="q-code-badge">1.0 Administrative Information → 1.1 Application Form</div>
            <div class="q-title">Is the fee for the Type II variation fully paid and documented?</div>
            <div class="q-text">
                <p style="font-size:0.9em;color:#555">
                    See <a href="https://www.ema.europa.eu/en/documents/regulatory-procedural-guidance/fees-payable-european-medicines-agency_en.pdf">EMA Fee Guidance</a> for payment confirmation requirements.
                </p>
            </div>
        </div>
    </div>

    <!-- Question 2 -->
    <div class="question">
        <div class="q-number">2</div>
        <div class="q-content">
            <div class="q-code-badge">1.0 Administrative Information → 1.1 Application Form</div>
            <div class="q-title">Are all required metadata fields in the application form complete?</div>
            <div class="q-text">
                <ul>
                    <li>Marketing Authorisation Holder</li>
                    <li>Product Name (INN)</li>
                    <li>Procedure Number</li>
                    <li>Submission Date</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Question 3 -->
    <div class="question">
        <div class="q-number">3</div>
        <div class="q-content">
            <div class="q-code-badge">1.3 Product Information → 1.3.1 SmPC, Labelling and Package Leaflet</div>
            <div class="q-title">Do the updated storage conditions (2–8°C for 36 months) require additional patient guidance?</div>
            <div class="q-text">
                <p>Current ePI states: “Store in a refrigerator (2°C – 8°C). Do not freeze.”</p>
            </div>
        </div>
    </div>

    <!-- Question 4 -->
    <div class="question">
        <div class="q-number">4</div>
        <div class="q-content">
            <div class="q-code-badge">1.3 Product Information → 1.3.1 SmPC, Labelling and Package Leaflet</div>
            <div class="q-title">Is the patient leaflet revised to clarify the extended shelf life?</div>
            <div class="q-text">
                <p style="font-style:italic">“Shelf life after first opening: 36 months when stored at 2–8°C”</p>
            </div>
        </div>
    </div>

    <!-- Question 5 -->
    <div class="question">
        <div class="q-number">5</div>
        <div class="q-content">
            <div class="q-code-badge">1.3 Product Information → 1.3.1 SmPC, Labelling and Package Leaflet</div>
            <div class="q-title">Is the updated ePI text sufficiently clear for all EU languages?</div>
            <div class="q-text">
                <table>
                    <tr><th>Language</th><th>Status</th></tr>
                    <tr><td>English</td><td>Approved</td></tr>
                    <tr><td>French</td><td>Under Review</td></tr>
                    <tr><td>German</td><td>Pending</td></tr>
                </table>
            </div>
        </div>
    </div>

    <!-- Question 6 -->
    <div class="question">
        <div class="q-number">6</div>
        <div class="q-content">
            <div class="q-code-badge">3.2.P.8 Stability → 3.2.P.8.1 Stability Summary and Conclusion</div>
            <div class="q-title">Are there any new stability studies conducted, or does the submission include only data from additional timepoints from previously submitted studies?</div>
            <div class="q-text">
                <ul>
                    <li>Include protocol deviations if any.</li>
                    <li>Reference: <a href="https://www.ich.org/page/ich-guidelines">ICH Q1A(R2)</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Question 7 -->
    <div class="question">
        <div class="q-number">7</div>
        <div class="q-content">
            <div class="q-code-badge">3.2.P.8 Stability → 3.2.P.8.1 Stability Summary and Conclusion</div>
            <div class="q-title">Does the data support all intended climatic zones?</div>
            <div class="q-text">
                <div class="note"><b>Note:</b> Confirm coverage for Zone IVb (30°C/75% RH) per <a href="https://www.who.int/publications/i/item/9789240011922">WHO TRS 1010</a></div>
            </div>
        </div>
    </div>

    <!-- Question 8 -->
    <div class="question">
        <div class="q-number">8</div>
        <div class="q-content">
            <div class="q-code-badge">3.2.P.5 Control of Drug Product → 3.2.P.5.2 Analytical Procedures</div>
            <div class="q-title">Are the test methods used the same as in the previously submitted stability information?</div>
            <div class="q-text">
                <p style="color:#d32f2f">If changed: justify and provide validation data.</p>
            </div>
        </div>
    </div>

    <!-- Question 9 -->
    <div class="question">
        <div class="q-number">9</div>
        <div class="q-content">
            <div class="q-code-badge">3.2.P.5 Control of Drug Product → 3.2.P.5.4 Impurities</div>
            <div class="q-title">Are there any new degradation products identified within the newly submitted data?</div>
            <div class="q-text">
                <p style="font-size:0.9em">Threshold: <b>>0.10%</b> per <a href="https://www.ich.org/page/quality-guidelines">ICH Q3B(R2)</a></p>
            </div>
        </div>
    </div>

    <!-- Question 10 -->
    <div class="question">
        <div class="q-number">10</div>
        <div class="q-content">
            <div class="q-code-badge">3.2.P.7 Container Closure System</div>
            <div class="q-title">Any changes in the packaging configuration and/or storage of the samples during stability?</div>
            <div class="q-text">
                <div class="image-placeholder">[Figure 1: Cross-section of proposed aluminum/aluminum blister pack]</div>
                <p style="font-size:0.9em;color:#555"><b>Figure 1:</b> Cross-section of new Alu/Alu blister showing foil thickness and sealing layer.</p>
                <table>
                    <tr><th>Original</th><th>New</th></tr>
                    <tr><td>PVC/PVDC Blister</td><td>Alu/Alu Blister</td></tr>
                    <tr><td>25°C/60% RH</td><td>Unchanged</td></tr>
                </table>
            </div>
        </div>
    </div>

</div>

<div class="footer">
    <p>Built with the HL7 FHIR RTQ standard – enabling fast, structured, and machine-readable regulatory Q&A in life sciences and healthcare.</p>
    <p><a href="https://build.fhir.org/ig/HL7/rtq-ig/branches/main/index.html" style="color:#007aff;">RTQ Implementation Guide →</a></p>
</div>

</body>
</html>