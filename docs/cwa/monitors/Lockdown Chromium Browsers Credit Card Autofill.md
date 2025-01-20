---
id: 'bdd9f759-2636-4a76-ae7e-8cae7a4e874b'
title: 'Lockdown Browsers Credit Card Autofill'
title_meta: 'Lockdown Browsers Credit Card Autofill'
keywords: ['lockdown', 'browsers', 'credit', 'card', 'autofill', 'chromium', 'chrome', 'edge', 'brave']
description: 'This document outlines the process for disabling the Autofilling feature for credit cards in Chromium-based browsers including Google Chrome, Microsoft Edge, and Brave by modifying registry settings. It includes details on affected settings, implementation suggestions, and dependencies for effective monitoring.'
tags: ['security', 'web-browser', 'windows']
draft: false
unlisted: false
---
## Summary

The remote monitor attempts to disable the Autofilling feature for credit cards in Chromium-based browsers such as Google Chrome, Microsoft Edge, and Brave. This solution entails modifying the computer's registry settings.

**Affected Setting for Google Chrome:**  
![Google Chrome Setting](../../../static/img/Lockdown-Chromium-Browsers-Credit-Card-Autofill/image_1.png)

**Affected Settings for Microsoft Edge:**  
![Microsoft Edge Settings](../../../static/img/Lockdown-Chromium-Browsers-Credit-Card-Autofill/image_2.png)

**Affected Setting for Brave:**  
![Brave Setting](../../../static/img/Lockdown-Chromium-Browsers-Credit-Card-Autofill/image_3.png)

**Note:**
- The changes will only happen once the browser is restarted if it's currently open.
- If the PowerShell version on the machines is older than version 5, the remote monitor may not produce the expected outcomes.

## Details

**Suggested "Limit to":** Lockdown Browsers Credit Card Autofill  
**Suggested Alert Style:** Continuous  
**Suggested Alert Template:** Default - Do Nothing  

Using any alert templates is not recommended unless the partner specifically desires an alert for failures. The remote monitor records both its successes and failures in the [Chromium Browsers Credit Card Lockdown - Status](<../dataviews/Chromium Browsers Credit Card Autofill Lockdown - Status.md>) dataview.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | State Based | 604800 (Weekly) | Screenshot attached below. |

![Screenshot](../../../static/img/Lockdown-Chromium-Browsers-Credit-Card-Autofill/image_4.png)

## Dependencies

**Search:** `Lockdown Browsers Credit Card Autofill`  
**Search:** `Lockdown Browsers Autofill`  
**Group:** `△ Lockdown Browsers Autofill`  
**Dataview:** [EPM - Dataview - Chromium Browsers Credit Card Lockdown - Status](<../dataviews/Chromium Browsers Credit Card Autofill Lockdown - Status.md>)

## Target

**Group:** △ Lockdown Browsers Password Manager  
![Target Group](../../../static/img/Lockdown-Chromium-Browsers-Credit-Card-Autofill/image_5.png)

## Implementation

[Implement - Group Monitors - △ Lockdown Browsers Autofill](https://proval.itglue.com/DOC-5078775-15025130)












