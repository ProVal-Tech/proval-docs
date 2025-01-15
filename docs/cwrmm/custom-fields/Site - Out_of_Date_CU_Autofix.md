---
id: '7eb4d98b-4199-4f59-a28f-bfdf50f3e36a'
title: 'Out of Date Cumulative Update Autofix Settings'
title_meta: 'Out of Date Cumulative Update Autofix Settings for ConnectWise RMM'
keywords: ['cumulative', 'update', 'autofix', 'site', 'servers']
description: 'This document provides an overview of the Out of Date Cumulative Update Autofix settings available for sites in ConnectWise RMM. It details the options available, including Disable, Disable for Servers, Enable for Servers, and Enable, along with their implications and default behaviors.'
tags: ['custom-field', 'management', 'connectwise', 'site', 'override']
draft: false
unlisted: false
---
## Summary

Select the Out of Date Cumulative Update Autofix setting for the site. Available options are `Disable`, `Disable for Servers`, `Enable for Servers`, and `Enable`. This Custom field provides an option to manage the Autofix for the site or to override the option set in the company level Custom Field [CW RMM - Custom Field - Company - Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748259).

## Details

| Field Name                  | Level | Type     | Options                                                                                             | Default Value | Description                                                                                                                                                        | Editable |
|-----------------------------|-------|----------|-----------------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| Out_of_Date_CU_Autofix     | SITE  | Dropdown | `Disable`, `Disable for Servers`, `Enable for Servers`, `Enable`                                 |               | Select the Out of Date Cumulative Update Autofix setting for the site. Available options are Disable, Disable for Servers, Enable for Servers, and Enable. This Custom field provides an option to manage the Autofix for the site. | Yes      |

## Options

| Option                     | Description                                                                                                                                                                                                                     |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Disable                    | To disable the Autofix for the site. It can be used to overwrite the option set at the Company level custom field [CW RMM - Custom Field - Company - Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748259). It can be overridden from the Endpoint level. |
| Disable for Servers        | To disable the Autofix for the servers of this site. It can be used to overwrite if the `Servers as Well` option is set at the Company level custom field [CW RMM - Custom Field - Company - Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748259). It can be overridden from the Endpoint level. |
| Enable for Servers         | To enable the Autofix for the servers of this site. It can be used to enable the Autofix for servers of the individual site; if it's disabled for the Company. It can be overridden from the Endpoint level.                     |
| Enable                     | To enable the Autofix for the site. It can be used to enable the Autofix for the individual site; if it's disabled for the Company. To override the `Disable` option selected in the Company level Custom field [CW RMM - Custom Field - Company - Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748259). It can be overridden from the Endpoint level. |

## ScreenShot

![Screenshot 1](../../../static/img/Site---Out_of_Date_CU_Autofix/image_1.png)
![Screenshot 2](../../../static/img/Site---Out_of_Date_CU_Autofix/image_2.png)






