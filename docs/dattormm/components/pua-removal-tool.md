---
id: '7356bbb4-4d5f-4c3c-839e-68054255c0d8'
slug: /7356bbb4-4d5f-4c3c-839e-68054255c0d8
title: 'PUA Removal Tool'
title_meta: 'PUA Removal Tool'
keywords: ['datto', 'rmm', 'pua', 'bloatware', 'implementation']
description: 'This document provides an overview of the Datto RMM implementation of the ProVal Agnostic Remove-PUA script, detailing its dependencies, implementation steps, and configuration variables for effective bloatware removal.'
tags: ['windows', 'uninstallation']
draft: false
unlisted: false
---

## Overview

Datto RMM Implementation of the ProVal Agnostic [Remove-PUA](/docs/fda5f79b-3e83-4561-af2b-2533f41c7443). It manages the removal of predefined bloatware packages or lists installed bloatware based on a centrally maintained list. It offers three primary operations: bulk removal, selective removal, and bloatware listing. The remove parameter allows bypassing the PUA List to remove any installed AppxPackage.

**PUA List:** [PUA List](https://content.provaltech.com/attachments/potentially-unwanted-applications.json)

<span style={{color:'red'}}>**EXERCISE EXTREME CAUTION - Removing system components may cause system instability.**</span>

## Dependencies

[Remove-PUA](/docs/fda5f79b-3e83-4561-af2b-2533f41c7443)

## Implementation

Import PUA Removal Tool.cpt into the environment.

## Datto Variables

| Variable Name   | Type      | Default | Description                                                                                                                                                                              |
| --------------- | --------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ListBloatware` | `Boolean` | `True`  | `Non-destructive. Lists applicable bloatware detected on the endpoint, but does not remove. Cannot be set simultaneously with any other parameter.`                                      |
| `RemoveAll`     | `Boolean` | `False` | `Remove all detected bloatware listed in the PUA List from the endpoint. PUA List: https://content.provaltech.com/attachments/potentially-unwanted-applications.json. USE WITH CAUTION.` |
| `Remove`        | `String`  |         | `Remove the provided package(s) from the endpoint. Cannot be set simultaneously with RemoveAll.`                                                                                         |
| `DParameter`    | `String`  |         | `Removes all detected bloatware in the specified categories. Requires the RemoveAll variable to be set to True. Valid Categories: 'MsftBloatApps', 'ThirdPartyBloatApps'`                |
| `EParameter`    | `String`  |         | `Exclude the provided package(s) from RemoveAll processing. Requires the RemoveAll variable to be set to True.`                                                                          |

## Output

stdOut & stdError
