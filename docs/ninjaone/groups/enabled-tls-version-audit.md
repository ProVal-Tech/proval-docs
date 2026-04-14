---
id: 'c5ae7def-4145-4f7b-82eb-8f4bfda66c41'
slug: /c5ae7def-4145-4f7b-82eb-8f4bfda66c41
title: 'Enabled TLS Version Audit'
title_meta: 'Enabled TLS Version Audit'
keywords: ['tls', 'audit']
description: 'This group shows the agents where the "TLS Enabled List Audit" script is executed to collect the enabled TLS versions audit list.'
tags: ['tls', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-04-14
---

## Summary

This group shows the agents where the "TLS Enabled List Audit" script is executed to collect the enabled TLS versions audit list.

## Dependencies

[Script - TLS Enabled List Audit](/docs/a19fe079-7179-4bdd-9572-248e1a48fb53)
[cPVAL TLS Client Enabled](/docs/c7b4badf-49a8-40b7-a6a0-db908b1c0694)
[cPVAL TLS Server Enabled](/docs/0c4cb75a-bc62-4d44-9701-812237e94a36)
[cPVAL TLS Details](/docs/37aaa27b-1398-4c9d-a681-39a8c807b635)

## Group Creation

[Group Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/groups/enabled-tls-version-audit.toml)

### Group View

Please follow the steps below to add the necessary custom fields or additional columns to the view.

- Create the group and ensure it is saved successfully.
- Open the newly created group for editing.
- Navigate to the Table Settings option.
- Update the table layout to include the required custom fields or additional columns.
- Save the changes to apply the updated group view.

### URL TO THE GUIDE

- [How-to Guide URL](/docs/71f3f71d-d6d1-4563-8476-92bbe9df55fa)

Add the below custom fields or additional columns under the Group View:
 
- > OS Name
-  > cPVAL TLS Details
-  > cPVAL TLS Client Enabled
-  > cPVAL TLS Server Enabled

### Group Screenshot

This is how the group should looks like after adding the custom fields:

> Add group screenshot here

## Changelog
