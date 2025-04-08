---
id: '7356bbb4-4d5f-4c3c-839e-68054255c0d8'
slug: /7356bbb4-4d5f-4c3c-839e-68054255c0d8
title: 'EPM - Software Management - Component - PUA Removal Tool'
title_meta: 'EPM - Software Management - Component - PUA Removal Tool'
keywords: ['datto', 'rmm', 'pua', 'bloatware', 'implementation']
description: 'This document provides an overview of the Datto RMM implementation of the ProVal Agnostic Remove-PUA script, detailing its dependencies, implementation steps, and configuration variables for effective bloatware removal.'
tags: ['windows', 'uninstallation']
draft: false
unlisted: false
---

# Overview

Datto RMM Implementation of the ProVal Agnostic [Remove-PUA](</docs/powershell/Remove-PUA.md>)

# Dependencies

[Remove-PUA](</docs/powershell/Remove-PUA.md>)

# Implementation

Import PUA Removal Tool.cpt into the environment.

# Datto Variables

| Variable Name      | Type     | Default | Description                                                                                                                                                              |
|--------------------|----------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `ListBloatware`    | `Boolean`| `True`  | `Non-destructive. Lists applicable bloatware detected on the endpoint, but does not remove. Cannot be set simultaneously with any other parameter.`                     |
| `RemoveAll`        | `Boolean`| `False` | `Remove all detected bloatware listed in the PUA List from the endpoint. PUA List: https://content.provaltech.com/attachments/potentially-unwanted-applications.json. USE WITH CAUTION.`                                                                                                   |
| `Remove`           | `String` |         | `Remove the provided package(s) from the endpoint. Cannot be set simultaneously with RemoveAll.`                                                                        |
| `DParameter`       | `String` |         | `Removes all detected bloatware in the specified categories. Requires the RemoveAll variable to be set to True. Valid Categories: 'MsftBloatApps', 'ThirdPartyBloatApps'` |
| `EParameter`       | `String` |         | `Exclude the provided package(s) from RemoveAll processing. Requires the RemoveAll variable to be set to True.`                                                        |

# Output

stdOut & stdError

