---
id: '261f8eb9-2d30-4f4b-816f-17e3de38e867'
slug: /261f8eb9-2d30-4f4b-816f-17e3de38e867
title: 'CS_User_Secret'
title_meta: 'CS_User_Secret'
keywords: ['connectsecure', 'cybercns', 'user-secret', 'agent-registration', 'company']
description: 'ConnectSecure User Secret used to register the agent. The default value acts as the portal-wide value.'
tags: ['deployment', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The User Secret the agent uses to register with ConnectSecure. Like [CS_Tenant_ID](/docs/5ce06a0b-16c7-4f91-9241-5bbba68c2ecd), enter it once as the field's default value under **SETTINGS** ➞ **Custom Fields**, so it applies to every company that doesn't have its own value.

## Dependencies

- [Solution: Deploy ConnectSecure Agent [Windows]](/docs/6772bca3-be64-4114-8fc7-10cbee463bcb)
- [Task: Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| CS_User_Secret | ConnectSecure User Secret used to register the agent. The default value acts as the portal-wide value. | `Company` | `Text Box` | Enter the User Secret from the ConnectSecure portal. Set it as the default value to apply it to every client. |  | `Yes` |

:::warning

The secret is stored as plain text, so anyone who can view custom fields can read it. Limit access to custom fields accordingly. The task also passes it to the installer on the command line while the agent installs.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/261f8eb9-2d30-4f4b-816f-17e3de38e867/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
