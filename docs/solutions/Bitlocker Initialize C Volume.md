---
id: 'd0046b61-191d-4974-89f5-4afb3f0e4824'
slug: /d0046b61-191d-4974-89f5-4afb3f0e4824
title: 'Bitlocker Initialize C Volume'
title_meta: 'Bitlocker Initialize C Volume'
keywords: ['bitlocker', 'encryption', 'tpm', 'reboot', 'monitoring']
description: 'This document outlines a solution for enabling BitLocker on endpoints, including options for encryption methods and TPM control. It includes associated content such as scripts, custom fields, and monitors to ensure effective deployment and management of BitLocker encryption.'
tags: ['encryption', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution enables BitLocker on the endpoints. It features control over the encryption method as well as options for TPM and reboot.

## Associated Content

| Content                                                                                   | Type         | Function                                                                                                                                                                                                                          |
|-------------------------------------------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - BitLocker Initialize C Volume](<../cwrmm/tasks/CW RMM Script - BitLocker Initialize C Volume.md>) | Script       | This task enables BitLocker on the system volume. The encryption methods that will be used to protect the target volume are:<ul><li>AES-256</li><li>XTS-AES-256</li></ul>These two options come with custom field dependencies. Refer to the document for the custom field dependencies check: [CW RMM Custom Field - BitLocker Initialize C Volume](<../cwrmm/custom-fields/BitLocker Initialize C Volume.md>) |
| [Custom Field - BitLocker Initialize C Volume](<../cwrmm/custom-fields/BitLocker Initialize C Volume.md>) | Custom Field | This document contains the custom field details linked to the BitLocker Initialize Volume solution.                                                                                                                                    |
| [Monitor - BitLocker Initialize Failure Detection](<../cwrmm/monitors/BitLocker Initialize Failure Detection.md>) | Monitor      | This monitor creates a ticket if the BitLocker initialization fails to enable on the system volume.                                                                                                                    |
| [Machine Group - BitLocker Initialize](<../cwrmm/groups/BitLocker Initialize.md>) | Dynamic Group| This group contains only Windows 10 and Windows 11 agents. The group name is "Windows 10/11".                                                                                                                             |

## Implementation

- Create the [Custom Field - BitLocker Initialize C Volume](<../cwrmm/custom-fields/BitLocker Initialize C Volume.md>)
- Create the [Machine Group - BitLocker Initialize](<../cwrmm/groups/BitLocker Initialize.md>)
- Create the [Script - BitLocker Initialize C Volume](<../cwrmm/tasks/CW RMM Script - BitLocker Initialize C Volume.md>) and follow the deployment instructions
- Create the [Monitor - BitLocker Initialize Failure Detection](<../cwrmm/monitors/BitLocker Initialize Failure Detection.md>) and follow the deployment instructions.



