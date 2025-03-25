---
id: '6be9039d-e093-4431-8efc-5ec2cc68e64a'
slug: /6be9039d-e093-4431-8efc-5ec2cc68e64a
title: 'Lockdown Browsers Password Manager and Autofill'
title_meta: 'Lockdown Browsers Password Manager and Autofill'
keywords: ['security', 'browsers', 'autofill', 'monitor', 'lockdown']
description: 'The Lockdown Browsers Password Manager and Autofill solution enhances web browser security by disabling features that could expose sensitive user information, specifically targeting credit card and address autofill functionalities in Chromium-based browsers.'
tags: ['browsers', 'security']
draft: false
unlisted: false
---

## Purpose

The **Lockdown Browsers Password Manager and Autofill** solution is designed to enhance the security of web browsers by disabling certain features that could potentially expose sensitive user information.

**Credit Card Autofill Lockdown:**  
The [Lockdown Chromium Browsers Credit Card Autofill](<../cwa/monitors/Lockdown Chromium Browsers Credit Card Autofill.md>) remote monitor modifies the computer's registry settings to disable the Autofilling feature for credit cards in Chromium-based browsers. The corresponding dataview, [Chromium Browsers Credit Card Autofill Lockdown - Status](<../cwa/dataviews/Chromium Browsers Credit Card Autofill Lockdown - Status.md>), displays whether the Autofilling feature has been successfully deactivated for each installed Chromium browser.  
**Note:** This functionality is exclusive to Chromium-based browsers, as the ability to manipulate these settings via registry keys is not available for Firefox browsers.

**Address Autofill Lockdown:**  
The [Lockdown Chromium Browsers Address Autofill](<../cwa/monitors/Lockdown Chromium Browsers Address Autofill.md>) remote monitor modifies the computer's registry settings to disable the Autofilling feature for addresses in Chromium-based browsers. The corresponding dataview, [Chromium Browsers Address Autofill Lockdown - Status](<../cwa/dataviews/Chromium Browsers Address Autofill Lockdown - Status.md>), displays whether the Autofilling feature has been successfully deactivated for each installed Chromium browser.  
**Note:** This functionality is exclusive to Chromium-based browsers, as the ability to manipulate these settings via registry keys is not available for Firefox browsers.

**Password Manager Lockdown:**  
The [Lockdown Browsers Password Manager](<../cwa/monitors/Lockdown Browsers Password Manager.md>) remote monitor attempts to disable the Password Manager in specific web browsers. It’s important to note that for Chromium-based browsers, disabling the Password Manager won’t stop the Autofill feature if it’s enabled and there are saved passwords. However, new passwords won’t be saved, and the browser won’t prompt to store passwords. For Firefox, disabling the Password Manager will also disable Autofill. The corresponding **dataview**, [Browsers Password Lockdown - Status](<../cwa/dataviews/Browsers Password Lockdown - Status.md>), displays whether the Password Manager has been successfully deactivated for each installed browser.

This solution provides a comprehensive approach to managing and monitoring the security settings of web browsers, thereby helping to protect sensitive user information.

## Associated Content

### Remote Monitors

| *Content* | *Type* | *Function* |
|-----------|--------|------------|
| [Lockdown Browsers Password Manager](<../cwa/monitors/Lockdown Browsers Password Manager.md>) | Remote Monitor | Disables the Password Manager for the installed browsers. |
| [Lockdown Chromium Browsers Credit Card Autofill](<../cwa/monitors/Lockdown Chromium Browsers Credit Card Autofill.md>) | Remote Monitor | Disables the Autofilling feature for credit cards in the installed Chromium browsers. |
| [Lockdown Chromium Browsers Address Autofill](<../cwa/monitors/Lockdown Chromium Browsers Address Autofill.md>) | Remote Monitor | Disables the Autofilling feature for addresses in the installed Chromium browsers. |

### Dataviews

| *Content* | *Type* | *Function* |
|-----------|--------|------------|
| [Browsers Password Lockdown - Status](<../cwa/dataviews/Browsers Password Lockdown - Status.md>) | Dataview | Exhibits the outcome returned by the remote monitor [Lockdown Browsers Password Manager](<../cwa/monitors/Lockdown Browsers Password Manager.md>). |
| [Chromium Browsers Credit Card Autofill Lockdown - Status](<../cwa/dataviews/Chromium Browsers Credit Card Autofill Lockdown - Status.md>) | Dataview | Exhibits the outcome returned by the remote monitor [Lockdown Chromium Browsers Credit Card Autofill](<../cwa/monitors/Lockdown Chromium Browsers Credit Card Autofill.md>). |
| [Chromium Browsers Address Autofill Lockdown - Status](<../cwa/dataviews/Chromium Browsers Address Autofill Lockdown - Status.md>) | Dataview | Exhibits the outcome returned by the remote monitor [Lockdown Chromium Browsers Address Autofill](<../cwa/monitors/Lockdown Chromium Browsers Address Autofill.md>). |

## Implementation

1. Import the following dataviews using the Prosync plugin:  
   - [Browsers Password Lockdown - Status](<../cwa/dataviews/Browsers Password Lockdown - Status.md>)
   - [Chromium Browsers Credit Card Autofill Lockdown - Status](<../cwa/dataviews/Chromium Browsers Credit Card Autofill Lockdown - Status.md>)
   - [Chromium Browsers Address Autofill Lockdown - Status](<../cwa/dataviews/Chromium Browsers Address Autofill Lockdown - Status.md>)

2. Import/Implement the EDFs, Searches, Groups, and Remote monitors by following the implementation steps:  
   - [Implement - Group Monitors - △ Lockdown Browsers Autofill](https://proval.itglue.com/DOC-5078775-15025130)  
   The remote monitors will be created in the `△ Lockdown Browsers Autofill` group and will be limited to the `Lockdown Browsers Autofill` search as outlined in the implementation documents.

3. Properly set the EDFs as desired: (**Do NOT enable any EDFs unless specifically stated by the consultant**)  
   - Flag the `Lockdown Browsers Password Manager` client-level EDF for the relevant client to activate the [Lockdown Browsers Password Manager](<../cwa/monitors/Lockdown Browsers Password Manager.md>) remote monitor on that client’s computers.
   - Flag the `Lockdown Browsers Credit Card Autofill` client-level EDF for the relevant client to activate the [Lockdown Chromium Browsers Credit Card Autofill](<../cwa/monitors/Lockdown Chromium Browsers Credit Card Autofill.md>) remote monitor on that client’s computers.
   - Flag the `Lockdown Browsers Address Autofill` client-level EDF for the relevant client to activate the [Lockdown Chromium Browsers Address Autofill](<../cwa/monitors/Lockdown Chromium Browsers Address Autofill.md>) remote monitor on that client’s computers.

## EDFs (Password Manager)

| Name | Level | Type | Section | Description |
|------|-------|------|---------|-------------|
| Lockdown Browsers Password Manager | Client | Check Box | Security | Flagging this EDF will activate the [Lockdown Browsers Password Manager](<../cwa/monitors/Lockdown Browsers Password Manager.md>) remote monitor for the Windows computers belonging to the client. |
| Exclude Browser Lockdown | Location | Check Box | Exclusions | Marking this EDF will result in the exclusion of the computers at the specified location from the [Lockdown Browsers Password Manager](<../cwa/monitors/Lockdown Browsers Password Manager.md>) remote monitor. |
| Exclude Browser Lockdown | Computer | Check Box | Exclusions | Flagging this EDF will result in the individual computer being excluded from the [Lockdown Browsers Password Manager](<../cwa/monitors/Lockdown Browsers Password Manager.md>) remote monitor. |

## EDFs (Credit Card Autofill)

| Name | Level | Type | Section | Description |
|------|-------|------|---------|-------------|
| Lockdown Browsers Credit Card Autofill | Client | Check Box | Security | Flagging this EDF will activate the [Lockdown Chromium Browsers Credit Card Autofill](<../cwa/monitors/Lockdown Chromium Browsers Credit Card Autofill.md>) remote monitor for the Windows computers belonging to the client. |
| Exclude Browser Credit Card Lockdown | Location | Check Box | Exclusions | Marking this EDF will result in the exclusion of the computers at the specified location from the [Lockdown Chromium Browsers Credit Card Autofill](<../cwa/monitors/Lockdown Chromium Browsers Credit Card Autofill.md>) remote monitor. |
| Exclude Browser Credit Card Lockdown | Computer | Check Box | Exclusions | Flagging this EDF will result in the individual computer being excluded from the [Lockdown Chromium Browsers Credit Card Autofill](<../cwa/monitors/Lockdown Chromium Browsers Credit Card Autofill.md>) remote monitor. |

## EDFs (Address Autofill)

| Name | Level | Type | Section | Description |
|------|-------|------|---------|-------------|
| Lockdown Browsers Address Autofill | Client | Check Box | Security | Flagging this EDF will activate the [Lockdown Chromium Browsers Address Autofill](<../cwa/monitors/Lockdown Chromium Browsers Address Autofill.md>) remote monitor for the Windows computers belonging to the client. |
| Exclude Browser Address Autofill Lockdown | Location | Check Box | Exclusions | Marking this EDF will result in the exclusion of the computers at the specified location from the [Lockdown Chromium Browsers Address Autofill](<../cwa/monitors/Lockdown Chromium Browsers Address Autofill.md>) remote monitor. |
| Exclude Browser Address Autofill Lockdown | Computer | Check Box | Exclusions | Flagging this EDF will result in the individual computer being excluded from the [Lockdown Chromium Browsers Address Autofill](<../cwa/monitors/Lockdown Chromium Browsers Address Autofill.md>) remote monitor. |


