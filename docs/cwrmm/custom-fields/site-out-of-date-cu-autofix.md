---
id: '7eb4d98b-4199-4f59-a28f-bfdf50f3e36a'
slug: /7eb4d98b-4199-4f59-a28f-bfdf50f3e36a
title: 'Site - Out_of_Date_CU_Autofix'
title_meta: 'Site - Out_of_Date_CU_Autofix'
keywords: ['cumulative', 'update', 'autofix', 'site', 'servers']
description: 'This document provides an overview of the Out of Date Cumulative Update Autofix settings available for sites in ConnectWise RMM. It details the options available, including Disable, Disable for Servers, Enable for Servers, and Enable, along with their implications and default behaviors.'
tags: ['connectwise']
draft: false
unlisted: false
---

## Summary

Select the Out of Date Cumulative Update Autofix setting for the site. Available options are `Disable`, `Disable for Servers`, `Enable for Servers`, and `Enable`. This custom field provides an option to manage the Autofix for the site or to override the option set in the company-level custom field [CW RMM - Custom Field - Company - Out_of_Date_CU_Autofix](/docs/00c4b9c6-ded8-4cde-ba74-47437724d206).

## Details

| Field Name                  | Level | Type     | Options                                                                                             | Default Value | Description                                                                                                                                                        | Editable |
|-----------------------------|-------|----------|-----------------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| Out_of_Date_CU_Autofix     | SITE  | Dropdown | `Disable`, `Disable for Servers`, `Enable for Servers`, `Enable`                                 |               | Select the Out of Date Cumulative Update Autofix setting for the site. Available options are Disable, Disable for Servers, Enable for Servers, and Enable. This custom field provides an option to manage the Autofix for the site. | Yes      |

## Options

| Option                     | Description                                                                                                                                                                                                                     |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Disable                    | To disable the Autofix for the site. It can be used to overwrite the option set at the company-level custom field [CW RMM - Custom Field - Company - Out_of_Date_CU_Autofix](/docs/00c4b9c6-ded8-4cde-ba74-47437724d206). It can be overridden from the endpoint level. |
| Disable for Servers        | To disable the Autofix for the servers of this site. It can be used to overwrite if the `Servers as Well` option is set at the company-level custom field [CW RMM - Custom Field - Company - Out_of_Date_CU_Autofix](/docs/00c4b9c6-ded8-4cde-ba74-47437724d206). It can be overridden from the endpoint level. |
| Enable for Servers         | To enable the Autofix for the servers of this site. It can be used to enable the Autofix for servers of the individual site if it's disabled for the company. It can be overridden from the endpoint level.                     |
| Enable                     | To enable the Autofix for the site. It can be used to enable the Autofix for the individual site if it's disabled for the company. It overrides the `Disable` option selected in the company-level custom field [CW RMM - Custom Field - Company - Out_of_Date_CU_Autofix](/docs/00c4b9c6-ded8-4cde-ba74-47437724d206). It can be overridden from the endpoint level. |

## Screenshots

![Screenshot 1](../../../static/img/docs/7eb4d98b-4199-4f59-a28f-bfdf50f3e36a/image_1.webp)
![Screenshot 2](../../../static/img/docs/7eb4d98b-4199-4f59-a28f-bfdf50f3e36a/image_2.webp)