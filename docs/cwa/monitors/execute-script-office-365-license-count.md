---
id: '4b0f8e3f-0efe-49b5-a81b-a617d5940833'
slug: /4b0f8e3f-0efe-49b5-a81b-a617d5940833
title: 'Execute Script - Office 365 License Count'
title_meta: 'Execute Script - Office 365 License Count'
keywords: ['office365','License','Count']
description: 'This internal monitor ensures that the data in the Office 365 License Count dataview is updated'
tags:  ['office365','update','windows','software']
draft: False
unlisted: false
---

## Summary
This internal monitor ensures that the data in the Office 365 License Count dataview is updated. It executes the [Office 365 License Count](/docs/e79c314d-8d1c-4ca0-a0b3-2a495a232d2b) once per week against an online machine of the clients where the `M365 Client ID`, `M365 Tenant ID`, and `M365 Client Secret` are set. 

## Dependencies
- [Solution - Office 365 License Count](/docs/8fe2a7a7-4456-4221-80e5-3fb4f2fdb615) 
- [Script - Office 365 License Count](/docs/e79c314d-8d1c-4ca0-a0b3-2a495a232d2b)

## Target

Global

## Alert Template

`△ Custom - Execute Script - Office 365 License Count`