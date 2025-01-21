---
id: '0f88cca8-1b15-44ba-92dc-ec6e2c72377b'
title: 'Lockdown Browsers Autofill'
title_meta: 'Lockdown Browsers Autofill - Disable Autofilling in Chromium-based Browsers'
keywords: ['chromium', 'browsers', 'autofill', 'registry', 'monitor']
description: 'This document explains how to disable the Autofilling feature for addresses in Chromium-based browsers such as Google Chrome, Microsoft Edge, and Brave by modifying the computer registry settings. It includes details on affected settings, dependencies, and implementation steps.'
tags: ['brave', 'chrome', 'edge', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

The remote monitor attempts to disable the Autofilling feature for addresses in Chromium-based browsers such as Google Chrome, Microsoft Edge, and Brave. This solution entails modifying the computer's registry settings.

**Affected Setting for Google Chrome:**  
![Google Chrome Setting](../../../static/img/Lockdown-Chromium-Browsers-Address-Autofill/image_1.png)

**Affected Settings for Microsoft Edge:**  
![Microsoft Edge Setting](../../../static/img/Lockdown-Chromium-Browsers-Address-Autofill/image_2.png)

**Affected Setting for Brave:**  
![Brave Setting](../../../static/img/Lockdown-Chromium-Browsers-Address-Autofill/image_3.png)

**Note:**
- The changes will take effect only after the browser is restarted if it is currently open.
- If the PowerShell version on the machines is older than version 5, the remote monitor may not produce the expected outcomes.

## Details

**Suggested "Limit to":** Lockdown Browsers Password Manager  
**Suggested Alert Style:** Continuous  
**Suggested Alert Template:** Default - Do Nothing  

Using any alert templates is not recommended unless the partner specifically desires an alert for failures. The remote monitor records both its successes and failures in the [Chromium Browsers Address Lockdown - Status](<../dataviews/Chromium Browsers Address Autofill Lockdown - Status.md>) dataview.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | State Based| 604800 (Weekly) | Screenshot attached below. |

![Screenshot](../../../static/img/Lockdown-Chromium-Browsers-Address-Autofill/image_4.png)

## Dependencies

**Search:** `Lockdown Browsers Address Autofill`  
**Search:** `Lockdown Browsers Autofill`  
**Group:** `△ Lockdown Browsers Autofill`  
**Dataview:** [EPM - Dataview - Chromium Browsers Address Lockdown - Status](<../dataviews/Chromium Browsers Address Autofill Lockdown - Status.md>)

## Target

**Group:** △ Lockdown Browsers Autofill  
![Target Group](../../../static/img/Lockdown-Chromium-Browsers-Address-Autofill/image_5.png)

## Implementation

[Implement - Group Monitors - △ Lockdown Browsers Autofill](https://proval.itglue.com/DOC-5078775-15025130)
