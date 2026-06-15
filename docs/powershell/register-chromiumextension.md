---
id: '481992c0-adcd-4275-bd5c-aa59fd4a7b17'
slug: /481992c0-adcd-4275-bd5c-aa59fd4a7b17
title: 'Register-ChromiumExtension'
title_meta: 'Register-ChromiumExtension'
keywords: ['register', 'extension', 'chromium', 'browser']
description: 'Documentation for the Register-ChromiumExtension command to add and mandate extensions in Chromium-based browsers.'
tags: ['chrome', 'web-browser', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-15
---

## Description

Adds one or more extensions to popular Chromium-based browsers.

## Requirements

The Extension URL ID must be obtained from [Chrome Web Store](https://chromewebstore.google.com).

## Usage

1. Verifies and adds an MDM policy if one doesn't exist.
2. Determines if the app is currently being blocked and removes it if present.
3. Adds the extension to the target browser(s) force list.

```powershell
.\Register-ChromiumExtension.ps1 -ExtensionID 'kgjfgplpablkjnlkjmjdecgdpfankdle', 'cjpalhdlnbpafiamejdnhcphjbkeiagm'
```

This command will add uBlock Origin and Zoom Meetings to the registered extensions in the force list for all popular Chromium-based browsers.

```powershell
.\Register-ChromiumExtension.ps1 -Target 'Chrome' -ExtensionID 'kgjfgplpablkjnlkjmjdecgdpfankdle', 'cjpalhdlnbpafiamejdnhcphjbkeiagm'
```

This command will add uBlock Origin and Zoom Meetings to the registered extensions in the force list for just the Chrome browser.

## Parameters

| Parameter         | ValidateSet | Required  | Default   | Type      | Description                               |
| ----------------- | ----------- | --------- | --------- | --------- | ----------------------------------------- |
| `ExtensionID`     |             | True      |           | String[]  | Holds the URL ID values for the desired extensions to install. |
| `Target`          | `Chromium`, `Chrome`, `Edge`, `Brave`, `Vivaldi`, `Opera` | False | Defaults to applying settings to all available targets | String[] | Designates the target browser to add the extension to. |

## Output

The output will be logged in the following files:

- .\Register-ChromiumExtension-log.txt
- .\Register-ChromiumExtension-error.txt

## Changelog

### 2026-06-15

- Added Opera-specific logic to support extension registration and enable extension deployment for Opera browsers.

### 2026-04-02

- Resolved an issue that prevented multiple extensions from being installed simultaneously
- Applied script formatting improvements for consistency and readability

### 2025-04-10

- Initial version of the document
