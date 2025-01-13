---
id: 'rmm-bitlocker-key-backup-status'
title: 'BitLocker Key Backup Status Custom Field'
title_meta: 'BitLocker Key Backup Status Custom Field'
keywords: ['bitlocker', 'backup', 'active-directory', 'azure', 'custom', 'field']
description: 'This document provides a detailed guide on creating a custom field for displaying the results of the BitLocker Recovery Key Backup Audit task in ConnectWise RMM. It includes step-by-step instructions and visual aids for setting up the custom field to track the status of BitLocker key backups in Active Directory or Azure Active Directory.'
tags: ['custom', 'field', 'status', 'audit', 'connectwise', 'rmm']
draft: false
unlisted: false
---
## Summary

This custom field is used to display the results of the [CW RMM - Task - BitLocker Recovery Key Backup Audit](https://proval.itglue.com/DOC-5078775-12881400) task that pushes BitLocker keys from CW RMM to Active Directory or Azure Active Directory.

# Create the Custom Field

![Image 1](..\..\..\static\img\BitLocker-Key-Backup-Status\image_1.png)  
![Image 2](..\..\..\static\img\BitLocker-Key-Backup-Status\image_2.png)  

**Name:** BitLocker Key Backup Status  
**Type:** Text Box  
**Default Value:** NULL / LEAVE EMPTY  
**Level:** Endpoint  
**Description:** Will display the most recent result after pushing the BitLocker recovery keys into AD/AzureAD.  
**Editable:** Yes  


