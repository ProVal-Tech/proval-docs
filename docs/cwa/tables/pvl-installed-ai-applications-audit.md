---
id: 'fcd315e9-e261-4553-a9c3-8440f748cdc6'
slug: /fcd315e9-e261-4553-a9c3-8440f748cdc6
title: 'pvl_installed_ai_applications_audit'
title_meta: 'pvl_installed_ai_applications_audit'
keywords: ['audit', 'ai', 'ai-tools', 'audit-ai-tools', 'installed-ai', 'installed-ai-tools', 'installed-ai-applications', 'ai-browser-extensions', 'browser-ai-features']
description: 'Stores the installed software audit results collected by the Audit Installed AI Tools script.'
tags: ['auditing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-28
---

## Purpose

Stores the installed software audit results collected by the [Audit Installed AI Tools](/docs/f4273886-5b8f-11f1-b684-92000234cfc2) script. Each row represents a specific Artificial Intelligence application, browser extension, npm package, or built-in browser AI feature detected on a managed Windows device, recording details such as the name, version, publisher, installation date, and the specific system source where it was discovered. This table directly powers the [Installed AI Tools Audit](/docs/1ca43737-1bb0-4adf-be79-a6b9c3eaec54) dataview, allowing the collected data to be seamlessly viewed and analyzed within the graphical user interface.

## Dependencies

- [Script: Audit Installed AI Tools](/docs/f4273886-5b8f-11f1-b684-92000234cfc2)
- [Solution: Installed AI Tools Audit](/docs/e1783dde-9fda-4c89-80b3-0f5ecc73382c)

## Tables

### pvl_installed_ai_applications_audit

| Property | Type | Description |
| --- | --- | --- |
| `ComputerID` | Int | The unique identifier of the computer. |
| `Name` | Varchar | The display name of the detected AI application, browser extension, npm package, or built-in browser AI feature. |
| `Version` | Varchar | The specific version number of the detected item. For built-in browser AI features, this is the browser version. |
| `Publisher` | Varchar | The software vendor, creator, or developer of the application. For browser extensions, this holds the Windows user, browser profile, and extension ID. For Claude Code and npm packages, it holds the Windows user, or `All users`. For built-in browser AI features, it holds the policy status. |
| `InstallDate` | DateTime | The date when the application was originally installed on the device. For browser extensions, this is the date the extension was added to the browser profile. Empty for Appx packages and built-in browser AI features. |
| `Source` | Varchar | The system location where the item was discovered during the scan: `SystemRegistry`, `UserRegistry`, `AppxPackage`, `NativeInstall`, `NpmPackage`, a browser extension (e.g., `Google Chrome Extension`), or a built-in browser AI feature (e.g., `Microsoft Edge Built-in`). |
| `DataCollectionTime` | DateTime | The exact timestamp of when the audit script ran and gathered this specific record. |

## Changelog

### 2026-10-28

- Documentation Change

### 2026-06-01

- Initial version of the document
