---
id: 'f6f9a30f-1310-4f65-8daa-3609e9f8510f'
slug: /f6f9a30f-1310-4f65-8daa-3609e9f8510f
title: 'Windows - Shadow Copy - Statistics'
title_meta: 'Windows - Shadow Copy - Statistics'
keywords: ['shadow', 'copy', 'audit', 'statistics', 'windows']
description: 'This document provides a comprehensive solution for auditing Shadow Copy statistics and size information on Windows machines. It details the implementation steps, associated content, and troubleshooting FAQs to ensure effective monitoring and data management.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

This solution is designed to audit the complete Shadow Copy statistics and size information on all machines set to audit. The data is populated into a dataview and can be reviewed manually. There is currently no alerting for this solution, but it can easily be added if requested.

![Image 1](../../static/img/Windows---Shadow-Copy---Statistics/image_1.png)
![Image 2](../../static/img/Windows---Shadow-Copy---Statistics/image_2.png)

## Associated Content

| Content                                                                                                                    | Type      | Function                                                                                                                                                                                                                                                                         |
|----------------------------------------------------------------------------------------------------------------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Shadow Copy - Audit Complete Statistics [DV]](/docs/9d69d33c-688e-4c02-adfe-cef7c8ecd766)                  | Script    | This script records data related to Shadow Copy for individual systems into a [Custom Table - plugin_proval_shadowcopystats](/docs/59bbf54a-55af-42fa-9e77-cd0b105122de).                                                                                               |
| [Dataview - Windows - Shadow Copy State [Script]](/docs/69110f54-d14f-4691-a68f-56bbc88b5fb3)                        | Dataview  | This dataview displays an endpoint's Windows Shadow Copy information where the [Script - Shadow Copy - Audit Complete Statistics [DV]](/docs/9d69d33c-688e-4c02-adfe-cef7c8ecd766) ran to gather the data.                                                          |
| [Monitor - Execute Script - Shadow Copy - Audit Complete Statistics](/docs/ef826863-c354-4a97-9ba8-8ad2a3c65e40)     | Monitor   | This monitor detects machines where the last Shadow Copy detected is older than the number of days set in the System Property Proval_ShadowCopyMaxAgeInDays.                                                                                                               |
| [Custom Table - plugin_proval_shadowcopystats](/docs/59bbf54a-55af-42fa-9e77-cd0b105122de)                            | Table     | It stores information about Windows shadow copies gathered by [Script - Shadow Copy - Audit Complete Statistics [DV]](/docs/9d69d33c-688e-4c02-adfe-cef7c8ecd766).                                                                                                     |
| △ Custom - Execute Script - Shadow Copy - Audit                                                                             | Alert Template | This alert template is created to run with the [Monitor - Execute Script - Shadow Copy - Audit Complete Statistics](/docs/ef826863-c354-4a97-9ba8-8ad2a3c65e40) and schedule [Script - Shadow Copy - Audit Complete Statistics [DV]](/docs/9d69d33c-688e-4c02-adfe-cef7c8ecd766) on the detected agents. |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Shadow Copy - Audit Complete Statistics [DV]](/docs/9d69d33c-688e-4c02-adfe-cef7c8ecd766)
   - [Dataview - Windows - Shadow Copy State [Script]](/docs/69110f54-d14f-4691-a68f-56bbc88b5fb3)
   - [Monitor - Execute Script - Shadow Copy - Audit Complete Statistics](/docs/ef826863-c354-4a97-9ba8-8ad2a3c65e40)

2. Reload the system cache:
   ![Image](../../static/img/Windows---Shadow-Copy---Statistics/image_3.png)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Monitor - Execute Script - Shadow Copy - Audit Complete Statistics](/docs/ef826863-c354-4a97-9ba8-8ad2a3c65e40)
       - Set up with "△ Custom - Execute Script - Shadow Copy - Audit" Alert Template
       - Right-click and Run Now to start the monitor

   **Note:** If the partner has a threat locker or any blocking application, please get the below file hash whitelisted for the solution to work properly without blocking.

   __MD5 FileHash__: `E69A5AD2CDCF7B20C7205D4A7BEC08C4`

## FAQ

**Q:** What should I do if information for an endpoint is not present in the dataview?  
**A:** Run the "[Script - Shadow Copy - Audit Complete Statistics [DV]](/docs/9d69d33c-688e-4c02-adfe-cef7c8ecd766)" against the Windows machine and re-check the dataview after the successful completion of the script.


