---
id: 'c19dc248-c6a0-4f9c-88c5-b3058245d74a'
title: 'Deploy Huntress'
title_meta: 'Deploy Huntress'
keywords: ['huntress', 'windows', 'group', 'filter', 'agent']
description: 'This document outlines the steps to create a dynamic group in ConnectWise RMM for filtering Windows machines where the Huntress agent is not installed. It details the necessary dependencies, criteria for filtering, and the process to save the group configuration.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this group is to filter Windows machines where the Huntress agent is not installed.

## Dependencies

- [CW RMM - Custom Fields - Huntress Acct_Key](<../custom-fields/Huntress Acct_Key.md>)
- [CW RMM - Custom Fields - Huntress Org_Key](<../custom-fields/Huntress Org_Key.md>)
- [CW RMM - Custom Fields - Huntress Tag](<../custom-fields/Huntress Tag.md>)
- [CW RMM - Custom Fields - Exclude Huntress](<../custom-fields/Exclude Huntress.md>)
- [CW RMM - Custom Fields - Exclude Huntress Deployment](<../custom-fields/Exclude Huntress Deployment.md>)
- [CW RMM - Task - Huntress Agent (INSTALL)](<../tasks/Huntress Agent (INSTALL).md>)

## Group Details

![Image](../../../static/img/Deploy-Huntress/image_1.png)

**Group Type:** Dynamic  
**Group Name:** Deploy Huntress  
**Description:** The purpose of this group is to filter the Windows machines where the Huntress agent is not installed.

### Criteria

![Image](../../../static/img/Deploy-Huntress/image_2.png)

- Installed Software does not contain any of `Huntress Agent`
- Huntress Acct_Key should not be blank
- Huntress Org_Key should not be blank
- Huntress Tag should not be blank
- Exclude Huntress should be false
- Exclude Huntress Deployment should be false
- OS Product Contains `Windows`
- Available should be True.

## Saving the Group

Once you have added the above criteria, click the Save button to save the group.

![Image](../../../static/img/Deploy-Huntress/image_3.png)

![Image](../../../static/img/Deploy-Huntress/image_4.png)



