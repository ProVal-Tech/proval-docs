---
id: 'd0046b61-191d-4974-89f5-4afb3f0e4824'
title: 'BitLocker Enabling on Endpoints'
title_meta: 'BitLocker Enabling on Endpoints'
keywords: ['bitlocker', 'encryption', 'tpm', 'reboot', 'monitoring']
description: 'This document outlines a solution for enabling BitLocker on endpoints, including options for encryption methods and TPM control. It includes associated content such as scripts, custom fields, and monitors to ensure effective deployment and management of BitLocker encryption.'
tags: ['encryption', 'security', 'setup', 'windows']
draft: false
unlisted: false
---
## Purpose

This solution performs the BitLocker enabling on the endpoints. It has a feature to control the encryption method and Allow TPM and Reboot options.

## Associated Content

| Content                                                                                   | Type         | Function                                                                                                                                                                                                                          |
|-------------------------------------------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - BitLocker Initialize C Volume](https://proval.itglue.com/DOC-5078775-15829737) | Script       | This task enables the BitLocker on the system volume. The encryption methods that will be used to protect the target volume are:\<ul>\<li>Aes256\</li>\<li>XtsAes256\</li>\</ul>These two options come up with the custom field dependencies.Refer to the doc for the custom field dependencies check:[CW RMM Custom Field - BitLocker Initialize C Volume](https://proval.itglue.com/DOC-5078775-15829738) |
| [Custom Field - BitLocker Initialize C Volume](https://proval.itglue.com/DOC-5078775-15829738) | Custom Field | This doc contains the custom field details linked to the Bitlocker Initialize Volume solution.                                                                                                                                    |
| [Monitor - BitLocker Initialize Failure Detection](https://proval.itglue.com/DOC-5078775-15829735) | Monitor      | This monitor creates a ticket if the BitLocker Initialize fails to enable the Bitlocker on the system volume.                                                                                                                    |
| [Machine Group - BitLocker Initialize](https://proval.itglue.com/DOC-5078775-15833951) | Dynamic Group| This group contains the Windows 10 and Windows 11 agents only.The group name is "Windows 10/11".                                                                                                                             |

## Implementation

- Create the [Custom Field - BitLocker Initialize C Volume](https://proval.itglue.com/DOC-5078775-15829738)
- Create the [Machine Group - BitLocker Initialize](https://proval.itglue.com/DOC-5078775-15833951)
- Create the [Script - BitLocker Initialize C Volume](https://proval.itglue.com/DOC-5078775-15829737) and follow the deployment instructions
- Create the [Monitor - BitLocker Initialize Failure Detection](https://proval.itglue.com/DOC-5078775-15829735) and follow the deployment instructions.











