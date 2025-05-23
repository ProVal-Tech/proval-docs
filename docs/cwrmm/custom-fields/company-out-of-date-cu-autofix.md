---
id: '00c4b9c6-ded8-4cde-ba74-47437724d206'
slug: /00c4b9c6-ded8-4cde-ba74-47437724d206
title: 'Company - Out_of_Date_CU_Autofix'
title_meta: 'Company - Out_of_Date_CU_Autofix'
keywords: ['customfield', 'autofix', 'cumulativeupdate', 'management', 'connectwise']
description: 'This document provides a detailed overview of a drop-down Custom Field designed to manage the Autofix section for the ConnectWise RMM solution. It explains the functionality of enabling the latest Cumulative Update installation on machines that have not received an update in the last 75 days, including options for server management.'
tags: ['connectwise', 'update']
draft: false
unlisted: false
---

## Summary

A drop-down Custom Field to manage the Autofix section for the [CW RMM - Solution - Latest Cumulative Update Audit](/docs/8f2741e6-ef04-4a1e-804d-f481469e8beb) solution. Select "Enable" from the drop-down to allow installation of the latest available Cumulative Update on the machines where a CU has not been installed in the last 75 days. Selecting "Servers as well" will enable Autofix for the servers too.

## Details

| Field Name                  | Level   | Type     | Options                                   | Default Value | Description                                                                                                                                                         | Editable |
|-----------------------------|---------|----------|-------------------------------------------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| Out_of_Date_CU_Autofix     | COMPANY | Dropdown | `Enable`, `Disable`, `Servers as well`   | Disable       | Select "Enable" from the drop-down to allow installation of the latest available Cumulative Update on the machines where a CU has not been installed in the last 75 days. Selecting "Servers as well" will enable Autofix for the servers too. | Yes      |

## Options

| Option            | Description                                                                                                                                                       |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Enable            | To enable the Autofix for the Company. Enabling the Autofix will enable the Autofix for the Workstations only. It can be overridden from the Site and Endpoint level. |
| Disable           | To disable the Autofix for the Company. It can be overridden from the Site and Endpoint level.                                                                    |
| Servers as well   | To enable the Autofix for Servers too. Selecting this option will enable the Autofix (auto installation of the latest Cumulative Update) for Servers as well. It can be overridden from the Site and Endpoint level. |

## Screenshots

![Screenshot 1](../../../static/img/docs/00c4b9c6-ded8-4cde-ba74-47437724d206/image_1.webp)

![Screenshot 2](../../../static/img/docs/00c4b9c6-ded8-4cde-ba74-47437724d206/image_2.webp)