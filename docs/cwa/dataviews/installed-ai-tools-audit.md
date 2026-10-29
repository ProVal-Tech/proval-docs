---
id: '1ca43737-1bb0-4adf-be79-a6b9c3eaec54'
slug: /1ca43737-1bb0-4adf-be79-a6b9c3eaec54
title: 'Installed AI Tools Audit'
title_meta: 'Installed AI Tools Audit'
keywords: ['audit', 'ai', 'ai-tools', 'audit-ai-tools', 'installed-ai', 'installed-ai-tools', 'installed-ai-applications', 'ai-browser-extensions', 'browser-ai-features']
description: 'Displays the list of installed AI Tools, AI browser extensions, and built-in browser AI features on Windows workstations.'
tags: ['auditing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-28
---

## Summary

Displays the installed AI software audit results for Windows workstations, populated from the [pvl_installed_ai_applications_audit](/docs/fcd315e9-e261-4553-a9c3-8440f748cdc6) custom table by the [Audit Installed AI Tools](/docs/f4273886-5b8f-11f1-b684-92000234cfc2) script. Use this dataview to easily review and track exactly which Artificial Intelligence applications, frameworks, coding assistants, browser extensions, and built-in browser AI features are present across your device fleet, including version details and discovery locations.

## Dependencies

- [Script: Audit Installed AI Tools](/docs/f4273886-5b8f-11f1-b684-92000234cfc2)
- [Custom Table: pvl_installed_ai_applications_audit](/docs/fcd315e9-e261-4553-a9c3-8440f748cdc6)
- [Internal Monitor: Execute Script - Audit Installed AI Tools](/docs/b5f4d983-bd00-4f9f-9ec6-b385781f0164)
- [Solution: Installed AI Tools Audit](/docs/e1783dde-9fda-4c89-80b3-0f5ecc73382c)

## Columns

| Column | Description |
| --- | --- |
| `ClientID` | The unique identifier of the client. (Hidden) |
| `LocationID` | The unique identifier of the location. (Hidden) |
| `ComputerID` | The unique identifier of the computer. (Hidden) |
| `Client` | The name of the client for this computer. |
| `Location` | The name of the location for this computer. |
| `Computer` | The name of the computer where the audit was performed. |
| `OperatingSystem` | The OS installed on the endpoint. |
| `LastContact` | The last check-in date of the agent. |
| `LastLoggedInUser` | The last user logged into the device. |
| `FormFactor` | The physical form factor of the machine. |
| `AIApplicationName` | The display name of the detected AI application, browser extension, npm package, or built-in browser AI feature. |
| `AIApplicationVersion` | The specific version number of the detected item. For built-in browser AI features, this is the browser version. |
| `AIApplicationPublisher` | The software vendor, creator, or developer of the application. For browser extensions, this shows the Windows user, browser profile, and extension ID. For Claude Code and npm packages, it shows the Windows user, or `All users`. For built-in browser AI features, it shows the policy status, for example `Policy: Not configured`. |
| `AIApplicationInstallDate` | The date when the application was originally installed on the device. For browser extensions, this is the date the extension was added to the browser profile. Empty for Appx packages and built-in browser AI features. |
| `DataSource` | The system location where the item was discovered during the scan: `SystemRegistry`, `UserRegistry`, `AppxPackage`, `NativeInstall`, `NpmPackage`, a browser extension (e.g., `Google Chrome Extension`), or a built-in browser AI feature (e.g., `Microsoft Edge Built-in`). |
| `DataCollectionTime` | Timestamp of when the audit script last ran and populated this record. |

## Changelog

### 2026-10-28

- Documentation Change

### 2026-06-01

- Initial version of the document
