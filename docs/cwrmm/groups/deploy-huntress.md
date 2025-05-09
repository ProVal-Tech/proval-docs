---
id: 'c19dc248-c6a0-4f9c-88c5-b3058245d74a'
slug: /c19dc248-c6a0-4f9c-88c5-b3058245d74a
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

- [CW RMM - Custom Fields - Huntress Acct_Key](/docs/b8ce44cf-a4a7-4b17-a292-43615b2b192a)
- [CW RMM - Custom Fields - Huntress Org_Key](/docs/00d66215-fe07-4bae-b6cb-d96a73486694)
- [CW RMM - Custom Fields - Huntress Tag](/docs/30690dec-ecd0-448f-8429-24a5d2854953)
- [CW RMM - Custom Fields - Exclude Huntress](/docs/a65dbf66-6cfe-4136-aba1-0b75b3068485)
- [CW RMM - Custom Fields - Exclude Huntress Deployment](/docs/caedfebd-73ec-43cb-a978-02283622f430)
- [CW RMM - Task - Huntress Agent (INSTALL)](/docs/e1f40d15-13f1-465e-9870-653927ad0434)

## Group Details

![Image](../../../static/img/docs/523b8882-2c51-4f70-ad7d-cb2b4baf7bbf/image_1.webp)

**Group Type:** Dynamic  
**Group Name:** Deploy Huntress  
**Description:** The purpose of this group is to filter the Windows machines where the Huntress agent is not installed.

### Criteria

![Image](../../../static/img/docs/523b8882-2c51-4f70-ad7d-cb2b4baf7bbf/image_2.webp)

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

![Image](../../../static/img/docs/523b8882-2c51-4f70-ad7d-cb2b4baf7bbf/image_3.webp)

![Image](../../../static/img/docs/523b8882-2c51-4f70-ad7d-cb2b4baf7bbf/image_4.webp)