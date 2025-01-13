---
id: 'cwa-deploy-huntress-mac'
title: 'Deploy Huntress - MAC'
title_meta: 'Deploy Huntress - MAC'
keywords: ['huntress', 'mac', 'agent', 'group', 'filter']
description: 'This document outlines the creation of a dynamic group in ConnectWise RMM that filters MAC machines where the Huntress agent is not installed. It includes dependencies, criteria for group membership, and instructions for saving the group.'
tags: ['dynamic', 'filter', 'software', 'connectwise', 'mac']
draft: false
unlisted: false
---
## Summary

The purpose of this group is to filter the MAC machines where the Huntress agent is not installed.

## Dependencies

- [CW RMM - Custom Fields - Huntress Acct_Key](https://proval.itglue.com/DOC-5078775-15293648)
- [CW RMM - Custom Fields - Huntress Org_Key](https://proval.itglue.com/DOC-5078775-15293647)
- [CW RMM - Custom Fields - Huntress Tag](https://proval.itglue.com/DOC-5078775-15293470)
- [CW RMM - Custom Fields - Exclude Huntress](https://proval.itglue.com/DOC-5078775-15294130)
- [CW RMM - Custom Fields - Exclude Huntress Deployment](https://proval.itglue.com/DOC-5078775-15294129)
- [CW RMM - Task - Huntress Agent (INSTALL)](https://proval.itglue.com/DOC-5078775-13684933)

## Summary

![Image](../../../static/img/Deploy-Huntress---Mac/image_1.png)

**Group Type:** Dynamic  
**Group Name:** Deploy Huntress - MAC  
**Description:** The purpose of this group is to filter the MAC machines where the Huntress agent is not installed.

## Criteria

![Image](../../../static/img/Deploy-Huntress---Mac/image_2.png)

- Installed Software does not contain any of the `Huntress Agent`
- Huntress Acct_Key should not be blank
- Huntress Org_Key should not be blank
- The Huntress Tag should not be blank
- Exclude Huntress should be false
- Exclude Huntress Deployment should be false
- OS Product Contains of `MAC`
- Available Should be True.

## Group

Once the above criteria are met, click the Save button to save the group.

![Image](../../../static/img/Deploy-Huntress---Mac/image_3.png)

![Image](../../../static/img/Deploy-Huntress---Mac/image_4.png)



