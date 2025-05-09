---
id: '58ce658a-6821-4420-9685-5ed8c963c2b1'
slug: /58ce658a-6821-4420-9685-5ed8c963c2b1
title: 'Senteon_Tenant'
title_meta: 'Senteon_Tenant'
keywords: ['senteon', 'tenant', 'agent', 'registration', 'managed', 'variable']
description: 'This document details the managed variable used to store the Senteon ID/Name of the Tenant for agent registration. It provides guidance on obtaining the necessary information from the Senteon portal and explains the variable’s purpose in the agent installation process.'
tags: ['installation', 'setup', 'software']
draft: false
unlisted: false
---

## Summary

This managed variable is used to store the Senteon ID/Name of the Tenant that the partner wishes to register the agent/endpoint to.

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)  
The value for this must be provided by the partner. The partner can obtain the data from the Senteon portal: [https://app.senteon.co](https://app.senteon.co)

## Associated Content

[SWM - Software Management - Solution - Senteon Agent](/docs/5cc5165d-4314-499b-9357-299f3b04f402)

## Details

| Managed Variable Name | Managed Variable Type | Description                                                |
|-----------------------|-----------------------|------------------------------------------------------------|
| Senteon_Tenant        | Public                | Used by the agent procedure to specify the tenant during installation |
