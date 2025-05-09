---
id: 'a7785954-5a6d-4003-9d0e-c919e1a96b0c'
slug: /a7785954-5a6d-4003-9d0e-c919e1a96b0c
title: 'BitLocker Status and Recovery Key Audit'
title_meta: 'BitLocker Status and Recovery Key Audit'
keywords: ['bitlocker', 'encryption', 'custom', 'field', 'status', 'key']
description: 'This document outlines the creation of a custom field used to display the BitLocker encryption status of drives. It includes details on how to set up the field, its properties, and how it integrates with the BitLocker Status and Recovery Key Audit task, providing recovery keys when available.'
tags: ['encryption', 'recovery', 'windows']
draft: false
unlisted: false
---

## Summary

This custom field is used to display the BitLocker encryption status of drives based on the [BitLocker Status and Recovery Key Audit](/docs/9682b5a8-d821-43f6-9b77-59d43b6ef015) task. If a recovery key is available, the solution will also write the key to the custom field.

## Create the Custom Field

![Image 1](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_2.webp)

![Image 2](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_3.webp)

- **Name:** BitLocker Status and Key
- **Type:** Text Box
- **Default Value:** NULL / LEAVE EMPTY
- **Level:** Endpoint
- **Description:** This will show drives that are encrypted with BitLocker and will display the recovery key if available.
- **Editable:** Yes