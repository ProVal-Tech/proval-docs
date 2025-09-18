---
id: '7fa0ba87-97a3-4d8f-a5fe-d9faa697b533'
slug: /7fa0ba87-97a3-4d8f-a5fe-d9faa697b533
title: 'Install Dashlane - Chrome Extension'
title_meta: 'Install Dashlane - Chrome Extension'
keywords: ['extensions','browsers','chrome','deployment']
description: 'This script will add the Dashlane Credential Protection extension to Google Chrome.'
tags: ['extensions','browsers','chrome']
draft: false
unlisted: false
---

## Summary

This script will add the Dashlane Credential Protection extension to Google Chrome. 

**NOTE:** The "MassDeploymentKey" needs to be filled under Global and Parameters for installation, and documentation detailing where to find this key is included below.

## Dependencies

The configuration token found in step 5 of this process needs to be added as the MassDeploymentKey global variable in the script.

[Dashlane Documentation](https://support.dashlane.com/hc/en-us/articles/22882258054674-Mass-deploy-Omnix-Credential-Protection-using-Windows-and-Intune#step-policy)

## Global And Parameters

| Name              | Description                                                                                   |
|-------------------|-----------------------------------------------------------------------------------------------|
| ExtensionIDs      | The extension ID for the Dashlane credential extension.                 |
| MassDeploymentKey | Configuration Token to link the extension to a central tenant. This also enables silent deployment. |

## Output

- Script Logs