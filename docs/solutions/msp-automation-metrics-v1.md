---
id: '518eca1b-77be-4a26-bdb5-01d4440cad34'
slug: /518eca1b-77be-4a26-bdb5-01d4440cad34
title: 'MSP Automation Metrics - v1'
title_meta: 'MSP Automation Metrics - v1'
keywords: ['msp', 'metrics', 'automation', 'data', 'client']
description: 'This document provides a solution for MSPs to gather and store important data related to the client environment through automation metrics. It outlines the associated content, including scripts, custom tables, and dataviews, and provides implementation steps for effective usage.'
tags: []
draft: false
unlisted: false
---

## Purpose

This solution is intended to provide important MSP data relating to the client environment.

## Associated Content

| Content                                                                                                           | Type         | Function                                                                                                          |
|-------------------------------------------------------------------------------------------------------------------|--------------|-------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - MSP Automation Metrics - plugin_proval_h_msp_metrics](/docs/408bb0fc-cfe0-4ea3-8e77-af13c41e054e) | Script       | Fetches and stores standardized automation metrics to a custom table.                                            |
| [CWM - Automate - Custom Table - plugin_proval_h_msp_metrics](/docs/aed83a49-ef72-45bd-bcef-369484754612)   | Custom Table | Stores the `MSP Automation Metrics` for further use.                                                             |
| [CWM - Automate - Dataview - MSP Automation Metrics](/docs/3532cdd7-5d1f-4ac4-91c5-38993e1245f8)             | Dataview     | Displays the standardized automation metrics gathered by the [CWM - Automate - Script - MSP Automation Metrics - plugin_proval_h_msp_metrics](/docs/408bb0fc-cfe0-4ea3-8e77-af13c41e054e) script. |

## Implementation

- Import the [CWM - Automate - Script - MSP Automation Metrics - plugin_proval_h_msp_metrics](/docs/408bb0fc-cfe0-4ea3-8e77-af13c41e054e) script.
- Import the [CWM - Automate - Dataview - MSP Automation Metrics](/docs/3532cdd7-5d1f-4ac4-91c5-38993e1245f8) dataview.
- Debug the [CWM - Automate - Script - MSP Automation Metrics - plugin_proval_h_msp_metrics](/docs/408bb0fc-cfe0-4ea3-8e77-af13c41e054e) script against any client and verify the presence of data in the dataview.
- Schedule the script to run on the 1st of each month.