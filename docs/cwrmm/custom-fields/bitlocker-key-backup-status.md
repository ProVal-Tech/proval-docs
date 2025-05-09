---
id: '362c3958-f97e-4f40-bd1d-89cbfed9b17f'
slug: /362c3958-f97e-4f40-bd1d-89cbfed9b17f
title: 'BitLocker Key Backup Status'
title_meta: 'BitLocker Key Backup Status'
keywords: ['bitlocker', 'backup', 'active-directory', 'azure', 'custom', 'field']
description: 'This document provides a detailed guide on creating a custom field for displaying the results of the BitLocker Recovery Key Backup Audit task in ConnectWise RMM. It includes step-by-step instructions and visual aids for setting up the custom field to track the status of BitLocker key backups in Active Directory or Azure Active Directory.'
tags: ['connectwise']
draft: false
unlisted: false
---

## Summary

This custom field is used to display the results of the [CW RMM - Task - BitLocker Recovery Key Backup Audit](/docs/b469ea90-0c1b-421b-89e2-be5c91501035) task that pushes BitLocker keys from CW RMM to Active Directory or Azure Active Directory.

## Create the Custom Field

![Image 1](../../../static/img/docs/362c3958-f97e-4f40-bd1d-89cbfed9b17f/image_1.webp)  
![Image 2](../../../static/img/docs/362c3958-f97e-4f40-bd1d-89cbfed9b17f/image_2.webp)  

**Name:** BitLocker Key Backup Status  
**Type:** Text Box  
**Default Value:** NULL / LEAVE EMPTY  
**Level:** Endpoint  
**Description:** Will display the most recent result after pushing the BitLocker recovery keys into AD/AzureAD.  
**Editable:** Yes  