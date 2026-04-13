---
id: 'a79ce245-02ad-425d-81cb-d2fbfdc88820'
slug: /a79ce245-02ad-425d-81cb-d2fbfdc88820
title: 'cPVAL SecureBoot Check'
title_meta: 'cPVAL SecureBoot Check'
keywords: ['compliance','secureboot','customfield']
description: 'This document describes a custom field that tracks the secureboot status on machines, detailing its dependencies and specific field information relevant to machine management.'
tags: ['auditing','certificates','secureboot']
draft: false
unlisted: false
last_update:
  date: 2026-04-13
---

## Summary

This document is used to describe a custom field that will be used to gather the secureboot status on the machine.

## Dependencies

| Content | Type | Function |
| ----------------------------------------------------- | ----------------------------------------------------------- | -------------------------------------------------------- |
| [secureboot-2026-compliance-check](/docs/6e3a2154-42ba-471c-8cd5-379e95b3732f) | `Automation` | This script evaluates whether a Windows device is prepared for the upcoming Microsoft Secure Boot certificate transition scheduled for 2026. |
| [remediationsecureboot-2026-compliance](/docs/28fa1216-33bf-481d-941b-c1e6e1978e44) | `Automation` | This script automates the remediation of UEFI Secure Boot certificates required for Windows 2026 compliance. It ensures the system has the latest 2023 UEFI certificates (KEK and db) and configures the system for automatic Microsoft-managed UEFI certificate updates. |

## Details

| Field Name | Type of Field (Machine or Organization) | Description |
| ---------- | --------------------------------------- | ----------- |
| cPVAL SecureBoot Check | Machine | Used for secureboot status |

## Changelog

### 2026-04-13

- Initial version of the document
