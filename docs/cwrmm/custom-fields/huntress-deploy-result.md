---
id: '822e9dc0-d455-4706-8482-175b85dbd491'
slug: /822e9dc0-d455-4706-8482-175b85dbd491
title: 'Huntress Deploy_Result'
title_meta: 'Huntress Deploy_Result'
keywords: ['huntress', 'install', 'task', 'custom', 'field', 'failure']
description: 'This document outlines the CW RMM task for installing the Huntress Agent, detailing the custom field used to track installation failures. It provides guidance on creating the custom field necessary for monitoring and ticket creation based on installation results.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

The [`CW RMM - Task - Huntress Agent (INSTALL)`](/docs/e1f40d15-13f1-465e-9870-653927ad0434) task utilizes this custom field to store the number of times the task failed to install Huntress on the machine. This can further be utilized to create tickets for Huntress failure as per partners' requirements.

## Create the Custom Field

![Image 1](../../../static/img/docs/822e9dc0-d455-4706-8482-175b85dbd491/image_1.webp)

![Image 2](../../../static/img/docs/822e9dc0-d455-4706-8482-175b85dbd491/image_2.webp)

**Name:** Huntress Deploy_Result  
**Type:** Text Box  
**Level:** Endpoint  
**Description:** Huntress Deployment Result from Task: Huntress Agent Install  
**Editable:** Yes  