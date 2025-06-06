---
id: '48737f29-accd-41ac-a35d-047d7e266e6f'
slug: /48737f29-accd-41ac-a35d-047d7e266e6f
title: 'Local Machine Certificate Audit'
title_meta: 'Local Machine Certificate Audit'
keywords: ['monitor', 'windows', 'certificates', 'audit', 'servers']
description: 'This document outlines the implementation of an internal monitor designed to detect servers where the Windows Certificates (My) Local Machine Audit script has not been executed in the past week. It specifies the dependencies and target groups for effective monitoring.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The purpose of the internal monitor is to detect the concerned servers where the [Windows - Certificates (My) - Local Machine - Audit](/docs/7d13a122-8d62-4c50-b19f-922e6bb37a13) script has not executed in the past 7 days.

## Dependencies

[EPM - Network - Script - Certificate - Windows - Certificates (My) - Local Machine - Audit](/docs/7d13a122-8d62-4c50-b19f-922e6bb37a13)

## Target

The internal monitor should be explicitly limited to the following groups:

- Service Plans.Windows Servers.Server Roles.Windows Messaging Servers
- Service Plans.Windows Servers.Server Roles.Windows Remote Access Servers
- Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers
- Service Plans.Windows Servers.Server Roles.Windows Database Servers
- Service Plans.Windows Servers.Server Roles.MSP Specific Servers

![Image](../../../static/img/docs/48737f29-accd-41ac-a35d-047d7e266e6f/image_1.webp)

## Alert Template

**Name:** △ Custom - Local Machine Certificate Audit