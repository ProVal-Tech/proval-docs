---
id: 'rmm-deploy-huntress'
title: 'Deploy Huntress Agent Group'
title_meta: 'Deploy Huntress Agent Group'
keywords: ['huntress', 'windows', 'group', 'filter', 'agent']
description: 'This document outlines the steps to create a dynamic group in ConnectWise RMM for filtering Windows machines where the Huntress agent is not installed. It details the necessary dependencies, criteria for filtering, and the process to save the group configuration.'
tags: ['dynamic', 'filter', 'windows', 'software', 'group']
draft: false
unlisted: false
---
## Summary

The purpose of this group is to filter Windows machines where Huntress agent is not installed.

## Dependencies

- [CW RMM - Custom Fields - Huntress Acct_Key](https://proval.itglue.com/DOC-5078775-15293648)
- [CW RMM - Custom Fields - Huntress Org_Key](https://proval.itglue.com/DOC-5078775-15293647)
- [CW RMM - Custom Fields - Huntress Tag](https://proval.itglue.com/DOC-5078775-15293470)
- [CW RMM - Custom Fields - Exclude Huntress](https://proval.itglue.com/DOC-5078775-15294130)
- [CW RMM - Custom Fields - Exclude Huntress Deployment](https://proval.itglue.com/DOC-5078775-15294129)
- [CW RMM - Task - Huntress Agent (INSTALL)](https://proval.itglue.com/DOC-5078775-13684933)

## Summary

![Image](..\..\..\static\img\Deploy-Huntress\image_1.png)

**Group Type:** Dynamic  
**Group Name:** Deploy Huntress  
**Description:** The purpose of this group is to filter the Windows machines where the Huntress agent is not installed.

### Criteria

![Image](..\..\..\static\img\Deploy-Huntress\image_2.png)

- Installed Software does not contain any of `Huntress Agent`
- Huntress Acct_Key should not be blank
- Huntress Org_Key should not be blank
- Huntress Tag should not be blank
- Exclude Huntress should be false
- Exclude Huntress Deployment should be false
- OS Product Contains of `Windows`
- Available Should be True.

## Group

Once adding the above criteria, click the Save button to save the group.

![Image](..\..\..\static\img\Deploy-Huntress\image_3.png)

![Image](..\..\..\static\img\Deploy-Huntress\image_4.png)


