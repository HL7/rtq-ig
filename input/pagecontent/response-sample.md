---
layout: null
---
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Regulatory Questionnaire Response – RTQ IG</title>
    <style>
        /* RTQ IG Universal Stylesheet - Modern SaaS Theme */

        :root {
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --bg-main: #f8fafc;
            --bg-card: #ffffff;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --border: #e2e8f0;
        }

        body {
            font-family: 'Inter', -apple-system, system-ui, sans-serif;
            background: var(--bg-main);
            color: var(--text-main);
            margin: 0;
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 280px;
            background: white;
            border-right: 1px solid var(--border);
            padding: 32px 20px;
            display: flex;
            flex-direction: column;
            position: sticky;
            top: 0;
            height: 100vh;
            box-sizing: border-box;
        }

        .logo {
            font-weight: 800;
            font-size: 1.5rem;
            color: var(--primary);
            margin-bottom: 40px;
        }

        .nav-label {
            font-size: 0.75rem;
            font-weight: 700;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-bottom: 12px;
        }

        .nav-item {
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 0.9rem;
            color: var(--text-muted);
            text-decoration: none;
            margin-bottom: 4px;
            transition: all 0.2s;
            display: flex;
            justify-content: space-between;
        }

        .nav-item:hover {
            background: #f1f5f9;
            color: var(--text-main);
        }

        .nav-item.active {
            background: #eff6ff;
            color: var(--primary);
            font-weight: 600;
        }

        .count-pill {
            background: #e2e8f0;
            padding: 2px 8px;
            border-radius: 999px;
            font-size: 0.75rem;
            color: var(--text-muted);
        }

        /* Main Content Area */
        .main {
            flex: 1;
            padding: 40px 60px;
            max-width: 1000px;
        }

        .top-bar {
            margin-bottom: 30px;
        }

        .top-bar h1 {
            margin: 0;
            font-size: 1.875rem;
            font-weight: 800;
            letter-spacing: -0.025em;
        }

        .top-bar p {
            margin: 8px 0 0;
            color: var(--text-muted);
        }

        .intro-text {
            font-size: 1.1rem;
            line-height: 1.6;
            color: #475569;
            margin-bottom: 40px;
        }

        /* Grid for Participant Cards */
        .contact-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            margin-bottom: 40px;
        }

        .card {
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        .card-header {
            font-size: 0.875rem;
            font-weight: 700;
            border-bottom: 1px solid var(--border);
            margin-bottom: 16px;
            padding-bottom: 12px;
            color: var(--text-muted);
            text-transform: uppercase;
        }

        .section-title {
            font-size: 1.25rem;
            font-weight: 700;
            margin: 60px 0 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            scroll-margin-top: 40px;
        }

        .section-title::after {
            content: '';
            height: 1px;
            background: var(--border);
            flex: 1;
        }

        /* Question Card Styles */
        .question-card {
            margin-bottom: 24px;
            padding: 24px;
            border-radius: 12px;
            background: white;
            border: 1px solid var(--border);
            transition: all 0.2s;
        }

        .question-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .q-meta-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
            border-bottom: 1px solid #f1f5f9;
            padding-bottom: 12px;
        }

        .q-ref {
            font-family: 'SF Mono', monospace;
            font-size: 0.75rem;
            color: var(--primary);
            font-weight: 700;
            background: #eff6ff;
            padding: 4px 8px;
            border-radius: 4px;
        }

        .q-id {
            font-size: 0.75rem;
            color: var(--text-muted);
            font-weight: 600;
        }

        .q-body {
            display: flex;
            gap: 20px;
        }

        .q-num {
            background: var(--primary);
            color: white;
            width: 32px;
            height: 32px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            font-size: 0.9rem;
            flex-shrink: 0;
        }

        .q-content {
            flex: 1;
        }

        .q-title {
            font-size: 1.1rem;
            font-weight: 600;
            line-height: 1.4;
            color: var(--text-main);
            margin: 0 0 10px;
        }

        .q-text {
            color: #475569;
            font-size: 0.95rem;
            line-height: 1.6;
        }

        .q-text ul {
            padding-left: 20px;
            margin: 10px 0;
        }

        .q-text table {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
            font-size: 0.85rem;
        }

        .q-text th,
        .q-text td {
            border: 1px solid var(--border);
            padding: 10px;
            text-align: left;
        }

        .q-text th {
            background: #f8fafc;
            font-weight: 600;
        }


        .img-box {
            background: #f8fafc;
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 12px;
            margin: 20px 0;
            text-align: center;
        }

        .img-box img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        .img-ph {
            padding: 60px;
            text-align: center;
            color: #94a3b8;
            font-size: 0.9rem;
            font-style: italic;
            background: #f1f5f9;
            border: 2px dashed #cbd5e1;
            border-radius: 8px;
        }

        /* Answer Card Styles */
        .answer-card {
            margin: 0 0 40px 0;
            /* No indentation, more space between pairs */
            padding: 24px;
            border-radius: 0 0 12px 12px;
            background: #f1f5f9;
            /* Darker background for stronger differentiation */
            border: 1px solid var(--border);
            border-top: none;
            border-left: 6px solid #475569;
            /* Darker, thicker accent border */
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.05);
            /* Subtle inner shadow for 'filled' feel */
        }

        .answer-label {
            font-size: 0.7rem;
            font-weight: 800;
            color: #475569;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .answer-label::before {
            content: '→';
            font-size: 1rem;
        }

        .answer-text {
            color: var(--text-main);
            font-size: 0.95rem;
            line-height: 1.6;
        }

        .answer-text p {
            margin: 0 0 10px;
        }

        .answer-text p:last-child {
            margin-bottom: 0;
        }

        .footer {
            text-align: center;
            margin-top: 80px;
            padding: 40px 0;
            color: var(--text-muted);
            font-size: 0.85rem;
            border-top: 1px solid var(--border);
        }
    </style>
</head>

<body>

    <aside class="sidebar">
        <div class="logo">Outline</div>

        <div class="nav-label">Administrative</div>
        <a href="#overview" class="nav-item"><span>Procedure Overview</span></a>
        <a href="#participants" class="nav-item"><span>Participants</span></a>

        <div class="nav-label" style="margin-top: 32px;">Questions</div>
        <a href="#admin" class="nav-item"><span>1.0 Administrative</span> <span class="count-pill">2</span></a>
        <a href="#product" class="nav-item"><span>1.3 Product Info</span> <span class="count-pill">3</span></a>
        <a href="#stability" class="nav-item"><span>3.2.P.8 Stability</span> <span class="count-pill">2</span></a>
        <a href="#control" class="nav-item"><span>3.2.P.5 Control</span> <span class="count-pill">2</span></a>
        <a href="#container" class="nav-item"><span>3.2.P.7 Container</span> <span class="count-pill">1</span></a>
    </aside>

    <main class="main" id="overview">
        <div class="top-bar">
            <h1>Regulatory Questionnaire Response</h1>
            <p>Response to EMA List of Questions – Type II Variation (ID001)</p>
            <p style="font-size: 0.9rem;">Procedure: EMEA/H/C/005432/II/0023 | Submitted: 2025-11-18</p>
        </div>

        <div class="intro-text">
            <p>This document presents the official response to the regulatory questions issued by the health authority.
                It
                provides detailed evidence, justifications, and technical data in a structured format that maintains
                full
                traceability to the original request and the CTD structure.</p>
        </div>

        <div id="participants" class="section-title">Participants & Contacts</div>
        <div class="contact-grid">
            <div class="card">
                <div class="card-header">SENDER (MAH)</div>
                <strong>SynthPharma AG</strong><br>
                <span style="font-size: 0.85rem; color: var(--text-muted);">Global Regulatory Strategy</span><br>
                <span style="font-size: 0.85rem; color: var(--text-muted);">Basel, Switzerland</span><br>
                <span style="font-size: 0.85rem; color: var(--primary);"><a href="mailto:john.doe@synthpharma.example"
                        style="color: inherit; text-decoration: none;">john.doe@synthpharma.example</a></span>
            </div>
            <div class="card">
                <div class="card-header">RECIPIENT (REGULATOR)</div>
                <strong>European Medicines Agency</strong><br>
                <span style="font-size: 0.85rem; color: var(--text-muted);">Scientific and Regulatory
                    Management</span><br>
                <span style="font-size: 0.85rem; color: var(--text-muted);">Human Medicines Evaluation
                    Division</span><br>
                <span style="font-size: 0.85rem; color: var(--primary);"><a href="mailto:jane.doe@ema.europa.eu"
                        style="color: inherit; text-decoration: none;">jane.doe@ema.europa.eu</a></span>
            </div>
        </div>

        <div id="admin" class="section-title">1.0 Administrative Information</div>

        <!-- Question 1 -->
        <div class="question-card" style="margin-bottom: 0; border-radius: 12px 12px 0 0;">
            <div class="q-meta-top">
                <span class="q-ref">CTD Ref: 1.1 Application Form</span>
                <span class="q-id">ID: 1</span>
            </div>
            <div class="q-body">
                <div class="q-num">1</div>
                <div class="q-content">
                    <div class="q-title">Is the fee for the Type II variation fully paid and documented?</div>
                </div>
            </div>
        </div>
        <div class="answer-card">
            <span class="answer-label">Response</span>
            <div class="answer-text">
                <p>Yes, the fee was paid on <strong>June 25, 2025</strong>. Payment confirmation and receipt are
                    included in the
                    application form (see Section 1.1).</p>
            </div>
        </div>

        <!-- Question 2 -->
        <div class="question-card" style="margin-bottom: 0; border-radius: 12px 12px 0 0;">
            <div class="q-meta-top">
                <span class="q-ref">CTD Ref: 1.1 Application Form</span>
                <span class="q-id">ID: 2</span>
            </div>
            <div class="q-body">
                <div class="q-num">2</div>
                <div class="q-content">
                    <div class="q-title">Are all required metadata fields in the application form complete?</div>
                </div>
            </div>
        </div>
        <div class="answer-card">
            <span class="answer-label">Response</span>
            <div class="answer-text">
                <p>Yes, all required metadata fields are complete:</p>
                <ul>
                    <li><strong>MAH:</strong> SynthPharma AG</li>
                    <li><strong>Product:</strong> ExampleDrug 10 mg Tablets</li>
                    <li><strong>Procedure:</strong> EMEA/H/C/005432/II/0023</li>
                    <li><strong>Submission Date:</strong> 2025-06-25</li>
                </ul>
            </div>
        </div>

        <div id="product" class="section-title">1.3 Product Information</div>

        <!-- Question 3 -->
        <div class="question-card" style="margin-bottom: 0; border-radius: 12px 12px 0 0;">
            <div class="q-meta-top">
                <span class="q-ref">CTD Ref: 1.3.1 SmPC, Labelling and Package Leaflet</span>
                <span class="q-id">ID: 3</span>
            </div>
            <div class="q-body">
                <div class="q-num">3</div>
                <div class="q-content">
                    <div class="q-title">Do the updated storage conditions require additional patient guidance?</div>
                </div>
            </div>
        </div>
        <div class="answer-card">
            <span class="answer-label">Response</span>
            <div class="answer-text">
                <p>No additional patient guidance is required. The ePI clearly states: “Store in a refrigerator (2°C –
                    8°C). Do
                    not freeze.” The 36-month shelf life is supported by stability data.</p>
            </div>
        </div>

        <!-- Question 4 -->
        <div class="question-card" style="margin-bottom: 0; border-radius: 12px 12px 0 0;">
            <div class="q-meta-top">
                <span class="q-ref: 1.3.1 SmPC, Labelling and Package Leaflet</span>
                <span class=" q-id">ID: 4</span>
            </div>
            <div class="q-body">
                <div class="q-num">4</div>
                <div class="q-content">
                    <div class="q-title">Is the patient leaflet revised to clarify the extended shelf life?</div>
                </div>
            </div>
        </div>
        <div class="answer-card">
            <span class="answer-label">Response</span>
            <div class="answer-text">
                <p>Yes, the patient leaflet has been updated to state: “Shelf life after first opening: 36 months when
                    stored at
                    2–8°C”. The revised leaflet is included in the submission.</p>
            </div>
        </div>

        <div id="stability" class="section-title">3.2.P.8 Stability</div>

        <!-- Question 6 -->
        <div class="question-card" style="margin-bottom: 0; border-radius: 12px 12px 0 0;">
            <div class="q-meta-top">
                <span class="q-ref">CTD Ref: 3.2.P.8.1 Stability Summary and Conclusion</span>
                <span class="q-id">ID: 6</span>
            </div>
            <div class="q-body">
                <div class="q-num">6</div>
                <div class="q-content">
                    <div class="q-title">Are there any new stability studies conducted?</div>
                </div>
            </div>
        </div>
        <div class="answer-card">
            <span class="answer-label">Response</span>
            <div class="answer-text">
                <p>The submission includes both extended long-term data (36 months) for primary batches and new studies
                    for
                    pilot-scale batches in Alu/Alu packaging. No protocol deviations occurred.</p>
            </div>
        </div>

        <!-- Question 7 -->
        <div class="question-card" style="margin-bottom: 0; border-radius: 12px 12px 0 0;">
            <div class="q-meta-top">
                <span class="q-ref">CTD Ref: 3.2.P.8.1 Stability Summary and Conclusion</span>
                <span class="q-id">ID: 7</span>
            </div>
            <div class="q-body">
                <div class="q-num">7</div>
                <div class="q-content">
                    <div class="q-title">Does the data support all intended climatic zones?</div>
                </div>
            </div>
        </div>
        <div class="answer-card">
            <span class="answer-label">Response</span>
            <div class="answer-text">
                <p>Yes, the data supports all ICH climatic zones, including Zone IVb (30°C/75% RH). All batches remain
                    within
                    specification.</p>
            </div>
        </div>

        <div id="container" class="section-title">3.2.P.7 Container Closure System</div>

        <!-- Question 10 -->
        <div class="question-card" style="margin-bottom: 0; border-radius: 12px 12px 0 0;">
            <div class="q-meta-top">
                <span class="q-ref">CTD Ref: 3.2.P.7 Container Closure</span>
                <span class="q-id">ID: 10</span>
            </div>
            <div class="q-body">
                <div class="q-num">10</div>
                <div class="q-content">
                    <div class="q-title">Any changes in the packaging configuration during stability?</div>
                </div>
            </div>
        </div>
        <div class="answer-card">
            <span class="answer-label">Response</span>
            <div class="answer-text">
                <p>Yes, the packaging was changed from PVC/PVDC to Alu/Alu. New stability studies were initiated and
                    stored
                    under standard conditions.</p>
                <div class="img-box">
                    <svg viewBox="0 0 600 240" xmlns="http://www.w3.org/2000/svg"
                        style="border-radius: 8px; width: 100%; height: auto; max-width: 500px; display: block; margin: 0 auto; background: white;">
                        <!-- Lidding Foil -->
                        <rect x="50" y="40" width="500" height="15" fill="#94a3b8" rx="2" />
                        <text x="560" y="52" font-family="Inter, sans-serif" font-size="12" fill="#475569"
                            font-weight="600">Lidding
                            Foil (Aluminium)</text>

                        <!-- Adhesive Layer -->
                        <rect x="50" y="55" width="500" height="5" fill="#3b82f6" opacity="0.4" />
                        <text x="560" y="60" font-family="Inter, sans-serif" font-size="10" fill="#3b82f6"
                            font-weight="600">Dispersion Adhesive</text>

                        <!-- Tablet Cavity Visualization -->
                        <path d="M 50 60 L 150 60 Q 150 140 300 140 Q 450 140 450 60 L 550 60" fill="none"
                            stroke="#cbd5e1" stroke-width="2" />

                        <!-- Coldform Foil (Multilayer) -->
                        <path d="M 50 65 L 150 65 Q 150 145 300 145 Q 450 145 450 65 L 550 65" fill="#f1f5f9"
                            stroke="#64748b" stroke-width="2" />
                        <text x="560" y="145" font-family="Inter, sans-serif" font-size="12" fill="#475569"
                            font-weight="600">Coldform Foil (Alu/PVC/OPA)</text>

                        <!-- Labels with connecting lines -->
                        <line x1="300" y1="145" x2="300" y2="180" stroke="#94a3b8" stroke-dasharray="2 2" />
                        <text x="300" y="200" text-anchor="middle" font-family="Inter, sans-serif" font-size="11"
                            fill="#64748b">Cross-section: Forming Cavity for 10mg Tablet</text>
                    </svg>
                </div>
                <p style="font-size:0.85rem; color:var(--text-muted); margin-top:8px; text-align:center;">
                    <strong>Figure 1:</strong> Cross-section of new Alu/Alu blister showing foil thickness and lidding
                    layers.
                </p>
                <table>
                    <tr>
                        <th>Parameter</th>
                        <th>Original</th>
                        <th>New</th>
                    </tr>
                    <tr>
                        <td>Material</td>
                        <td>PVC/PVDC</td>
                        <td>Alu/Alu</td>
                    </tr>
                    <tr>
                        <td>Storage</td>
                        <td>25°C/60% RH</td>
                        <td>Unchanged</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="footer">
            Regulatory Questionnaire Standard (RTQ) • Enabling machine-readable regulatory Q&A
        </div>
    </main>

</body>

</html>