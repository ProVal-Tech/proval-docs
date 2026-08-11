---
id: 3601f89e-5924-4e31-9188-b4b1d2c95473
slug: /3601f89e-5924-4e31-9188-b4b1d2c95473
title: 'salesforce dataloader deployment'
title_meta: 'salesforce dataloader deployment'
keywords: ['software', 'installation', 'uninstallation', 'salesforce', 'dataloader']
description: 'This script assists in performing the Salesforce Data loader installation and uninstallation.'
tags: ['software', 'installation', 'uninstallation']
draft: false
unlisted: false
---

## Description

This script assists in performing the Salesforce Data loader installation and uninstallation.
This is a client-specific product that depends upon the `dataloader_v$Version.zip` file upload.
Here, $Version is required to be parsed from the HTML link `https://developer.salesforce.com/tools/data-loader`.
The setup file or URL does not have the version details that can be used for the dynamic deployment.
The version required to be manually updated for a new upgrade for the software upgrade.

[Software Configuration](https://github.com/ProVal-Tech/immybot/blob/main/software/salesforce-dataloader-deploy.toml)