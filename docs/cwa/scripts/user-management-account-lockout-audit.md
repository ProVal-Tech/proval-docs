---
id: 'c7996686-560d-47e2-acbf-99ae88c3102e'
slug: /c7996686-560d-47e2-acbf-99ae88c3102e
title: 'User Management - Account Lockout Audit'
title_meta: 'User Management - Account Lockout Audit'
keywords: ['audit', 'locked', 'account', 'security', 'event', 'log', 'detection', 'management']
description: 'This document provides details on a script that audits locked accounts, captures relevant data from security event logs, and stores this information for future reference. It includes sample runs, dependencies, variable documentation, and process descriptions.'
tags: ['database', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This script audits locked accounts and stores the information in a table.

## Sample Run

![Sample Run](../../../static/img/docs/c7996686-560d-47e2-acbf-99ae88c3102e/image_1.webp)

## Dependencies

- [Account LockOut Audit](/docs/40cf6430-7ec1-496c-8e6e-b92a499120e6)
- [AD Account Lockout Detection](/docs/52fca59d-2cc0-46b2-ae1e-13d46bd36615)
- [plugin_proval_account_lock](/docs/11fad349-3b51-4bfd-8f45-d07db1827543)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name       | Description                          |
|------------|--------------------------------------|
| LockAudit  | This contains the locked user detail |

#### Global Parameters

| Name         | Example                                             | Required | Description                                         |
|--------------|-----------------------------------------------------|----------|-----------------------------------------------------|
| Email        | [abc@xyz.com](mailto:abc@xyz.com); [efg@tty.com](mailto:efg@tty.com) | False    | Email address to send email on Lockout Detail      |
| Email_Option | 1 or 0                                            | False    | 0 - No Email by default; 1 - Send email to the provided address |

## Process

This script audits locked accounts and stores the information in a table based on the security event log 4740. It retains this information for future reference and displays it in the dataview.

## Output

The location and method by which this script returns data.

Examples:

- Script log
- plugin_proval_account_lock
- Dataview