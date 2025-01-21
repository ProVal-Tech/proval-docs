---
id: '7356bbb4-4d5f-4c3c-839e-68054255c0d8'
title: 'Datto RMM Implementation of the ProVal Agnostic Remove-PUA'
title_meta: 'Datto RMM Implementation of the ProVal Agnostic Remove-PUA'
keywords: ['datto', 'rmm', 'pua', 'bloatware', 'implementation']
description: 'This document provides an overview of the Datto RMM implementation of the ProVal Agnostic Remove-PUA script, detailing its dependencies, implementation steps, and configuration variables for effective bloatware removal.'
tags: ['windows']
draft: false
unlisted: false
---

# Overview

Datto RMM Implementation of the ProVal Agnostic Remove-PUA.ps1

# Dependencies

[Remove-PUA.ps1](https://proval.itglue.com/5078775/docs/9434539)

# Implementation

Import PUA Removal Tool.cpt into the environment.

# Datto Variables

| Variable Name      | Type     | Default | Description                                                                                                                                                              |
|--------------------|----------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `ListBloatware`    | `Boolean`| `True`  | `Non-destructive. Lists applicable bloatware detected on the endpoint, but does not remove. Cannot be set simultaneously with any other parameter.`                     |
| `RemoveAll`        | `Boolean`| `False` | `Remove all detected bloatware from the endpoint. USE WITH CAUTION.`                                                                                                   |
| `Remove`           | `String` |         | `Remove the provided package(s) from the endpoint. Cannot be set simultaneously with RemoveAll.`                                                                        |
| `DParameter`       | `String` |         | `Removes all detected bloatware in the specified categories. Requires the RemoveAll variable to be set to True. Valid Categories: 'MsftBloatApps', 'ThirdPartyBloatApps', 'WindowsStoreApps', 'XboxFeaturesApps', 'NonAppxApps'` |
| `EParameter`       | `String` |         | `Exclude the provided package(s) from RemoveAll processing. Requires the RemoveAll variable to be set to True.`                                                        |

# Output

stdOut & stdError
