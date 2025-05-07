---
id: 'b7a10884-783a-43e3-b867-a7805932b015'
slug: /b7a10884-783a-43e3-b867-a7805932b015
title: 'Enhanced Disk Space Monitoring Process Emails'
title_meta: 'Enhanced Disk Space Monitoring Process Emails'
keywords: ['disk', 'monitoring', 'email', 'notifications', 'alert']
description: 'This document provides a client-specific version of the Enhanced Disk Space Monitoring Process script, which includes a feature for sending email notifications. It explains how to set the email address for alerts, either through a global variable or a system property, ensuring that users can receive timely updates on disk space status.'
tags: ['disk', 'email']
draft: false
unlisted: false
---

## Summary

This is a client-specific copy of [EPM - Disk - Script - Enhanced Disk Space Monitoring Process](/docs/8efd9cc2-b054-4dda-a690-bbe1d4bd16b3) script with an additional feature to send email notifications. It fetches the email address from the default system property `_sysTicketDefaultEmail` if the script's global variable `EmailAddress` is not set.

**The email address should be stored in one place, either in the script's global variable or in the system property.**

## Dependencies

[EPM - Disk - Solution - Enhanced Drive Space Monitoring](/docs/0757e19d-56e4-4491-83b3-6012fde3b753)

#### Global Parameters

| Name          | Example                                                                                         | Required   | Description                                                                                                                                                                                                                      |
|---------------|-------------------------------------------------------------------------------------------------|------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| EmailAddress  | [support@provaltech.com](mailto:support@provaltech.com); [Support@provaltech.com](mailto:Support@provaltech.com); [Alerts@provaltech.com](mailto:Alerts@provaltech.com) | Partially  | Email address to send alerts on failures. Multiple email addresses can be stored by separating them with a semicolon. If this global variable is not set, then the script will fall back to the system property `_sysTicketDefaultEmail`. |

#### System Properties

| Name                     | Example                                                                                         | Required   | Description                                                                                                                                                                                                                      |
|--------------------------|-------------------------------------------------------------------------------------------------|------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| _sysTicketDefaultEmail   | [support@provaltech.com](mailto:support@provaltech.com); [Support@provaltech.com](mailto:Support@provaltech.com); [Alerts@provaltech.com](mailto:Alerts@provaltech.com) | Partially  | Email address to send alerts on failures. Multiple email addresses can be stored by separating them with a semicolon. If the global variable `EmailAddress` is not set, then the script will fall back to this system property. |


