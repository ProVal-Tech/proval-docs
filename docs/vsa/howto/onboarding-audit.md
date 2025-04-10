---
id: 9c83a72d-2971-411f-84a9-d0211ffc6a4c
slug: /9c83a72d-2971-411f-84a9-d0211ffc6a4c
title: 'Onboarding: Audit'
title_meta: 'Onboarding: Audit'
keywords: ['kaseya', 'audit', 'vsa', 'api', 'excel', 'reporting']
description: 'This document provides an overview of the Kaseya Onboarding Audit script, which performs an extensive audit of Kaseya VSA configurations and outputs the results to an Excel spreadsheet. It details the requirements, process, parameters, and output locations for the audit results, ensuring users can effectively utilize the script for auditing purposes.'
tags: ['kaseya', 'report', 'security', 'software']
draft: false
unlisted: false
---

## Prep Work

Create an API User in the client environment using this document: [Create an API User](/docs/3d6fedad-5cd1-47d6-b136-8c9fb3a092ba)

## Pulling Audit Data

1. Pulling Audit data is very simple.
2. Download VSAToolbox and move it into an easily accessible folder.
3. Open a powershell console as Administrator, and navigate to the folder you downloaded the above script to.
4. Run the following commands:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy Bypass

   # DWPAT is DW Token
   # PAT is REST Token
   .\vsatoolbox.exe audit --baseurl https://server.address --username apiuser --dwpat 00000000-0000-0000-0000-000000000000 --pat 00000000-0000-0000-0000-000000000000
   ```
   Example
   ```powershell
   & .\vsatoolbox.exe audit --baseurl https://na1vsa14.kaseya.net --username apiuser --dwpat ba7d839f-905f-401f-9f14-04fcd92ff423 --pat 24822194-e12b-4d2e-bee2-209052da7622
   ```
5.  Once complete, the audit and associated spreadsheet will be located in the folder that the VSAtoolBox.exe resides
Extrapolating Audit Data
Move through each sheet in the workbook, filling in the data requested. These sheets have comments on certain cells, indicated by a Red Arrow, that indicate best practice and how to gather the data.

Some data will be gathered manually in VSA and others in the Audit data.

There is no one-size-fits-all for this so I suggest you review previous onboarding audits to help you organize.