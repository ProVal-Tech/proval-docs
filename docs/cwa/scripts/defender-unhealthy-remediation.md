---
id: 'f334945d-902e-4a73-8e13-121fbf259122'
slug: /f334945d-902e-4a73-8e13-121fbf259122
title: 'Defender Unhealthy Remediation'
title_meta: 'Defender Unhealthy Remediation'
keywords: ['Defender','Remediation','Unhealthy',Antivrus]
description: 'This script enables the Defender, if failed then it attempts to reset the Defender using the Huntress script.'
tags: ['security', 'windows']
draft: False
unlisted: false
---

## Summary
This script enables the Defender, if failed then it attempts to reset the Defender using the Huntress script referred to in the article below.
`https://support.huntress.io/hc/en-us/articles/4402989131283-Enable-Microsoft-Defender-via-PowerShell`
`https://support.huntress.io/hc/en-us/articles/4411542446611-Reset-Microsoft-Defender-to-Default#posh`


## File Hash
 **File Path** : `C:\ProgramData\_Automation\Script\DefenderRemediation\DefenderRemediation.ps1`  
**File Hash (Sha256)** : `2ED6DF2CF2DD172D64E3948E60A5F29188960C1C3E3525B595DC5428B96055C8`  
**File Hash (MD5)** : `78126A1587B2231FB4626FF921055B32`


**File Path** : `C:\ProgramData\_Automation\Script\DefenderRemediation\DefenderReset.ps1`  
**File Hash (Sha256)** : `DE51929847C64352506B6D7A8A99C85ACFE0FF5F6820D9710019D1619A6DD4C2`  
**File Hash (MD5)** : `6FE32C355345DBEBD73E2689EDA12BE2`

## Sample Run
![Sample Run](../../../static/img/docs/f334945d-902e-4a73-8e13-121fbf259122/image1.webp) 

## Global Parameters

| Name          | Example | Required    | Description     |
|---------------|---------|---------|---------------------|
| Enable_Ticketing | 0 or 1 | False|	If it is set to 1, a ticket will be created to record all notes about the Defender's enabling and remediation. |
| Autofix_DefenderReset| 0 or 1 | False | If it is set to 1, then only the Huntress Defender resetting will happen and no tickets will be generated. |

## Output

- Script log
- Local file on the computer at path "C:\ProgramData\_Automation\Script\DefenderRemediation".