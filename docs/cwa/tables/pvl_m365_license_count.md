---
id: '8fe2a7a7-4456-4221-80e5-3fb4f2fdb615'
slug: /8fe2a7a7-4456-4221-80e5-3fb4f2fdb615
title: 'pvl_m365_license_count'
title_meta: 'pvl_m365_license_count'
keywords: ['office365','License','Count']
description: 'The custom table stores the data fetched by the Office 365 License Count script. '
tags:  ['office365','update','windows','software']
draft: False
unlisted: false
---

## Purpose
The custom table stores the data fetched by the [Office 365 License Count](/docs/e79c314d-8d1c-4ca0-a0b3-2a495a232d2b) script. 

## Dependencies

- [Solution - Office 365 License Count](/docs/8fe2a7a7-4456-4221-80e5-3fb4f2fdb615) 
- [Script - Office 365 License Count](/docs/e79c314d-8d1c-4ca0-a0b3-2a495a232d2b)

## Tables

### pvl_m365_license_count

| Column             | Type     | Explanation              |
| ------------------ | -------- | ------------------------ |
| Clientid           | int      | ClientId from Automate   |
| License            | varchar  | Name of the license      |
| Total              | int      | Total number of licenses |
| Assigned           | int      | Used licenses            |
| Available          | int      | Available licenses       |
| AppliesTo          | varchar  | License applied to       |
| DataCollectionTime | datetime | Data Collection Time     |
