---
id: 'cwa-lockdown-browsers-autofill-status'
title: 'Lockdown Browsers Address Autofill Status'
title_meta: 'Lockdown Browsers Address Autofill Status'
keywords: ['lockdown', 'browsers', 'autofill', 'status', 'chromium']
description: 'This document provides an overview of the Addresses Autofill Lockdown Status for computers monitored by the Lockdown Chromium Browsers Address Autofill remote monitor. It details whether the autofill feature has been successfully disabled in installed Chromium browsers and identifies any browsers where the disabling process has failed.'
tags: ['configuration', 'security', 'monitoring', 'windows']
draft: false
unlisted: false
---
## Summary

The dataview exhibits the `Addresses Autofill Lockdown Status` for the computer obtained from the [Lockdown Chromium Browsers Address Autofill](https://proval.itglue.com/DOC-5078775-15470041) remote monitor. It indicates whether the remote monitor has effectively deactivated the Autofilling feature for addresses for the installed Chromium browsers. If not, it provides the name of the specific browsers where the disabling process failed.

## Dependencies

**Search:** `Lockdown Browsers Address Autofill`  
**Search:** `Lockdown Browsers Autofill`  
**Group:** `△ Lockdown Browsers Autofill`  
**Remote Monitor:** [EPM - Remote Monitor - Lockdown Chromium Browsers Address Autofill](https://proval.itglue.com/DOC-5078775-15470041)  

## Columns

| Column                                         | Description                                                                                      |
|-----------------------------------------------|--------------------------------------------------------------------------------------------------|
| Clientid                                      | Clientid (Hidden)                                                                               |
| Locationid                                    | Locationid (Hidden)                                                                             |
| Computerid                                    | Computerid (Hidden)                                                                             |
| Client                                        | Client Name                                                                                    |
| Location                                      | Location Name                                                                                   |
| Computer                                      | Computer Name                                                                                   |
| Operating System                              | Operating System                                                                                 |
| Last Contact                                  | Last Contact with RMM                                                                           |
| Last Logged In User                           | Last Logged In User                                                                              |
| Credit Cards and Addresses Autofill Lockdown Status | Indicates whether the remote monitor has effectively deactivated the Autofilling feature for addresses for the installed Chromium browsers. If not, it provides the name of the specific browsers where the disabling process failed. |


