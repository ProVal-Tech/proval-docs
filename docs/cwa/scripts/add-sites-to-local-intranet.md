---
id: 'df72be26-16b1-452a-b4e7-67e1bf48a86b'
slug: /df72be26-16b1-452a-b4e7-67e1bf48a86b
title: 'Add Sites to Local Intranet'
title_meta: 'Add Sites to Local Intranet'
keywords: ['intranet', 'windows', 'configuration', 'sites', 'local']
description: 'This document provides a detailed overview of a script that adds specified sites to the local intranet zone on Windows computers. It includes sample runs, user parameters, and output details to help users understand how to utilize the script effectively.'
tags: ['networking', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

The script functions by adding the site(s) specified in the `Sites` parameter to the local intranet zone on the Windows computer.

![Image](../../../static/img/docs/df72be26-16b1-452a-b4e7-67e1bf48a86b/image_1.webp)

## Sample Run

**Input:**  
![Image](../../../static/img/docs/df72be26-16b1-452a-b4e7-67e1bf48a86b/image_2.webp)

**Result:**  
![Image](../../../static/img/docs/df72be26-16b1-452a-b4e7-67e1bf48a86b/image_3.webp)

**Input:**  
![Image](../../../static/img/docs/df72be26-16b1-452a-b4e7-67e1bf48a86b/image_4.webp)

**Result:**  
![Image](../../../static/img/docs/df72be26-16b1-452a-b4e7-67e1bf48a86b/image_5.webp)

**Input:**  
![Image](../../../static/img/docs/df72be26-16b1-452a-b4e7-67e1bf48a86b/image_6.webp)

**Result:**  
![Image](../../../static/img/docs/df72be26-16b1-452a-b4e7-67e1bf48a86b/image_7.webp)

**Input:**  
![Image](../../../static/img/docs/df72be26-16b1-452a-b4e7-67e1bf48a86b/image_8.webp)

**Result:**  
![Image](../../../static/img/docs/df72be26-16b1-452a-b4e7-67e1bf48a86b/image_9.webp)

## Variables

| Name              | Description                                      |
|-------------------|--------------------------------------------------|
| ProjectName       | Add-LocalIntranetSites                           |
| WorkingDirectory   | C:/ProgramData/_Automation/Script/Add-LocalIntranetSites |
| ScriptPath        | C:/ProgramData/_Automation/Script/Add-LocalIntranetSites/Add-LocalIntranetSites.ps1 |

#### User Parameters

| Name      | Example                                    | Required | Description                                                                                      |
|-----------|--------------------------------------------|----------|--------------------------------------------------------------------------------------------------|
| Sites     | AutomateAutomate,Ram,Development      | True     | Name of the site(s) to add to the local intranet zone. Multiple sites should be separated by a comma without any spaces between them. |
| Protocol  | https                                      | False    | Protocol to include along with the site. The default is HTTP. If this parameter is left blank, the script will automatically add HTTP along with the site. |

## Output

- Script Log