---
id: 'rmm-huntress-agent-install'
title: 'CW RMM - Task - Huntress Agent (INSTALL)'
title_meta: 'CW RMM - Task - Huntress Agent (INSTALL)'
keywords: ['huntress', 'install', 'task', 'custom', 'field', 'failure']
description: 'This document outlines the CW RMM task for installing the Huntress Agent, detailing the custom field used to track installation failures. It provides guidance on creating the custom field necessary for monitoring and ticket creation based on installation results.'
tags: ['endpoint', 'ticket', 'configuration', 'software', 'security']
draft: false
unlisted: false
---
## Summary

The [`CW RMM - Task - Huntress Agent (INSTALL)`](https://proval.itglue.com/DOC-5078775-13684933) task utilizes this custom field to store the number of times the task failed to install Huntress on the machine. This can further be utilized to create tickets for Huntress failure as per partners' requirements.

# Create the Custom Field

![Image 1](..\..\..\static\img\Huntress-Deploy_Result\image_1.png)

![Image 2](..\..\..\static\img\Huntress-Deploy_Result\image_2.png)

**Name:** Huntress Deploy_Result  
**Type:** Text Box  
**Level:** Endpoint  
**Description:** Huntress Deployment Result from Task: Huntress Agent Install  
**Editable:** Yes  


