---
id: 'b0fa9851-d256-45b6-ac64-38f6e6b0d30f'
slug: /b0fa9851-d256-45b6-ac64-38f6e6b0d30f
title: 'cPVAL FileVault Status'
title_meta: 'cPVAL FileVault Status'
keywords: ['security','mac','deployment']
description: 'This is used to show the File Vault status.'
tags: ['macos', 'custom-fields']
draft: false
unlisted: false
---

## Summary

This custom field is used to update the status of File Vault.

## Details

| Label                               | Field Name                       | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description                                                                                                                                                                                     | Tool Tip | Footer Text | Custom Field Tab Name |
| ----------------------------------- | -------------------------------- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ----------- | --------------------- |
| cPVAL FileVault Status | cpvalFilevaultStatus | `Organization`, `Location`, `Device`     | Text | Yes      | -             | Editable              | Read/Write            | Read/Write     | This is used to show the File Vault status. | FileVault status shown.       | FileVault status shown.          | `File Vault` , `FileVault`     |

## Dependencies

- [FileVault Status](/docs/da444ba9-ae51-48f8-8913-35f206579b04)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/xpval-filevault-status.toml)

## Sample screenshot

### Step 1

Navigate to the `Administration` menu, then proceed to `Devices` and select `Devices Custom Fileds` and Locate the `Add Custom Filed` button on the right-hand side of the screen and click on it. After clicking the `Add Custom Filed` button, select the `Field` button that appears.

![Custom filed start](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/cf1.webp)

### Step 2

After clicking the `Filed` button, The following Pop-up screen will appear.

![FieldButton](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/cf2-1.webp)

From the drop down select the `Text` custom field type

![Text](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/cf2.webp)

After selecting the custom filed type, click continue and The following Pop-up screen will appear.

![custom filed](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/cf3.webp)

After that fill the custom filed name and click Next

![Custom Filed](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/cf3-1.webp)

After fill the custom filed name, click next and The following Pop-up screen will appear.

![Inheritance](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/cf4.webp)

Fill in the following information in the `Inheritance` section and click the `Next` button.

![Inheritance](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/cf5.webp)

After fill the Inheritance, click next and The following Pop-up screen will appear.

![Permission](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/cf6.webp)

Fill in the following information in the `permissions` section and click the `Next` button.

![Permission](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/cf7.webp)

After fill the Inheritance, click next and The following Pop-up screen will appear.

![Details](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/cf8.webp)

Fill in the following information in the `Details` section and click the `Next` button.

- **Description:** `This is used to show the File Vault status.`  
- **Tooltip Text:** `FileVault status shown.`  
- **Footer Text:** `FileVault status shown.`

![Details](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/cf9.webp)

Once created it will look like this:

![CSField](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/cf-last-look.webp)