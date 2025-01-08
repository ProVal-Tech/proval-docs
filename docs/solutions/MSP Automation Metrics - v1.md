---
id: 'cwa-msp-automation-metrics'
title: 'MSP Automation Metrics'
title_meta: 'MSP Automation Metrics for Client Environment'
keywords: ['msp', 'metrics', 'automation', 'data', 'client']
description: 'This document provides a solution for MSPs to gather and store important data related to the client environment through automation metrics. It outlines the associated content, including scripts, custom tables, and dataviews, and provides implementation steps for effective usage.'
tags: ['msp', 'data', 'metrics', 'implementation', 'script', 'custom', 'dataview']
draft: false
unlisted: false
---
## Purpose

This solution is intended to provide important MSP data relating to the clients environment.

## Associated Content

| Content                                                                                                           | Type         | Function                                                                                                          |
|-------------------------------------------------------------------------------------------------------------------|--------------|-------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - MSP Automation Metrics - plugin_proval_h_msp_metrics](https://proval.itglue.com/DOC-5078775-12013482) | Script       | Fetches and stores standardized automation metrics to a custom table.                                            |
| [CWM - Automate - Custom Table - plugin_proval_h_msp_metrics](https://proval.itglue.com/DOC-5078775-12013503)   | Custom Table | Stores the `MSP Automation Metrics` for further use.                                                             |
| [CWM - Automate - Dataview - MSP Automation Metrics](https://proval.itglue.com/DOC-5078775-12013496)             | Dataview     | Displays the standardized automation metrics gathered by [CWM - Automate - Script - MSP Automation Metrics - plugin_proval_h_msp_metrics](https://proval.itglue.com/DOC-5078775-12013482) script. |

## Implementation

- Import the [CWM - Automate - Script - MSP Automation Metrics - plugin_proval_h_msp_metrics](https://proval.itglue.com/DOC-5078775-12013482) script.
- Import the [CWM - Automate - Dataview - MSP Automation Metrics](https://proval.itglue.com/DOC-5078775-12013496) dataview.
- Debug the [CWM - Automate - Script - MSP Automation Metrics - plugin_proval_h_msp_metrics](https://proval.itglue.com/DOC-5078775-12013482) script against any client and verify the presence of data in the dataview.
- Schedule the script to run at the 1st of each month.

