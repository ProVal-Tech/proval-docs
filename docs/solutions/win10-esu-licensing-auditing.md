---
id: '7fe6a52b-79fd-487b-8009-523996e74d11'
slug: /7fe6a52b-79fd-487b-8009-523996e74d11
title: 'Windows 10 ESU Licensing & Auditing'
title_meta: 'Windows 10 ESU Licensing & Auditing'
keywords: ['ESU', 'License', 'Extended', 'Windows 10']
description: 'This solution built to explain the ESU licensing audit and license activation'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Purpose

This solution built to explain the ESU licensing audit and license activation.
The Windows 10 Extended Security Updates program provides critical security patches for up to three years beyond the official end of support date. It’s intended for systems that cannot be upgraded immediately due to hardware, software compatibility, or organizational constraints. 

Refer to the articles:  
- https://learn.microsoft.com/en-us/windows/whats-new/enable-extended-security-updates
- https://www.systemcenterdudes.com/deploy-windows-10-extended-security-update-key-with-intune-or-sccm

## Associated Content

#### Audit Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Script - ESU License Activation Detection](/docs/634db1b5-58a2-4571-8873-74040c203d56)      | Script | This script performs checks for ESU license activation detection and stores the information to the computer EDF `ESU Detection`, reflecting it in the DV |
| [Dataview - ESU Detection Status](/docs/57995fb1-5d65-4283-aa82-0c3f821652bc)      | Dataview | This dataview contains the Windows 10 ESU extended license status audited by the [ESU License Activation Detection](/docs/634db1b5-58a2-4571-8873-74040c203d56) script. |

#### Automation Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Script - Windows 10 Extended Security Update](/docs/765670f5-5120-4066-89d8-2cda873e8212)    | Script | The Windows 10 Extended Security Updates program provides critical security patches for up to three years beyond the official end of support date. It’s intended for systems that cannot be upgraded immediately due to hardware, software compatibility, or organizational constraints. Referred to the articles: https://learn.microsoft.com/en-us/windows/whats-new/enable-extended-security-updates, https://www.systemcenterdudes.com/deploy-windows-10-extended-security-update-key-with-intune-or-sccm/ |

## Implementation

This solution is built to perform the Windows 10 ESU licensing and auditing.

#### Auditing
- Import the [Script - ESU License Activation Detection](/docs/634db1b5-58a2-4571-8873-74040c203d56) 
- Import the [Dataview - ESU Detection Status](/docs/57995fb1-5d65-4283-aa82-0c3f821652bc)

Schedule the [Script - ESU License Activation Detection](/docs/634db1b5-58a2-4571-8873-74040c203d56) to the Windows 10 group in the partners environment weekly or bi-weekly. The script will store the output to the computer EDF `ESU Detection` and that will be reflected to the [Dataview - ESU Detection Status](/docs/57995fb1-5d65-4283-aa82-0c3f821652bc).

#### Licensing
- Import the [Script - Windows 10 Extended Security Update](/docs/765670f5-5120-4066-89d8-2cda873e8212)

Schedule the script on-demand as it requires to have the ESU license Key and ESU year for which the license is purchased.
