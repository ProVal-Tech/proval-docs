---
id: '00d66215-fe07-4bae-b6cb-d96a73486694'
title: 'Huntress Organization Key Custom Field'
title_meta: 'Huntress Organization Key Custom Field'
keywords: ['huntress', 'custom', 'field', 'key', 'organization']
description: 'This document provides a detailed guide on creating a custom field for the Huntress Organization Key in ConnectWise RMM. It includes instructions on how to set up the field, its properties, and its importance in associating Huntress Agents with their respective organizations.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This custom field is to be filled with the Huntress Organization Key. It is utilized by the [CW RMM - Task - Huntress Agent (INSTALL)](<../tasks/Huntress Agent (INSTALL).md>) task, which essentially corresponds to the Client Name.

## Create the Custom Field

![Image 1](../../../static/img/Huntress-Org_Key/image_1.png)

![Image 2](../../../static/img/Huntress-Org_Key/image_2.png)

**Name:** Huntress Org_Key  
**Type:** Text Box  
**Level:** Company  
**Description:** The Huntress Organization Key is used to associate a Huntress Agent with a grouping called Huntress Organizations. The Organization Key is typically a short, user-defined identifier that is required for agent installation.  
**Editable:** Yes  
