---
id: '2e5f5f2b-7c81-4aec-a76a-623a465f959a'
slug: /2e5f5f2b-7c81-4aec-a76a-623a465f959a
title: 'Group Policy - Audit'
title_meta: 'Group Policy - Audit'
keywords: ['automate', 'active', 'directory', 'gpo', 'audit', 'script', 'implementation']
description: 'This document provides an overview of the implementation of the agnostic script Start-GPOAudit within ConnectWise Automate, detailing its dependencies, sample runs, and expected output including custom tables and script logs.'
tags: ['active-directory', 'gpo']
draft: false
unlisted: false
---

## Summary

This document outlines the implementation of the agnostic script [Start-GPOAudit](/docs/b070c950-2727-48b3-9226-84468960ee85) within ConnectWise Automate.

## File Hash

**File Path:** `C:/ProgramData/_Automation/script/Start-GPOAudit/Start-GPOAudit-AI.ps1`  
**File Hash (SHA256):** `6BB7EFC8FFB9187EDC7DED21BAE7DBD7E918DC10AA62FA1594B2D690F530C93B`  
**File Hash (MD5):** `5015E570B6E18BE4747A7387BD04C91E`

## Sample Run

**First Execution:** Execute the script against any online Windows computer with the `Set_Environment` parameter set to `1`. This will create the following necessary tables: 
- [plugin_proval_ad_gpo](/docs/c7cf649a-dd80-4e9d-8c80-eb95b813b7c9)
- [plugin_proval_ad_gp](/docs/0e873ec4-0fcc-4131-bf33-1f74f8b28c80)
- [plugin_proval_ad_gpolinks](/docs/85f52c7c-84bc-488f-a4de-d3122fec1f42)
- [plugin_proval_ad_gposf](/docs/8fa8c78e-04a4-4495-8cfe-44aef7b48035)

![Image](../../../static/img/Group-Policy---Audit/image_1.png)

**Regular Execution:**  
![Image](../../../static/img/Group-Policy---Audit/image_2.png)

## Dependencies

- [Start-GPOAudit](/docs/b070c950-2727-48b3-9226-84468960ee85)
- [OverFlowedVariable - SQL Insert - Execute](./OverFlowedVariable%20-%20SQL%20Insert%20-%20Execute.md)

## Output

- Custom Table
- Dataview
- Script Log
