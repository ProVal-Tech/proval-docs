---
id: 73e4e89e-166a-4af1-aca4-030922a4192e
slug: /73e4e89e-166a-4af1-aca4-030922a4192e
title: 'Senteon Agent'
title_meta: 'Senteon Agent'
keywords: ['immybot', 'senteon']
description: 'An ImmyBot software installer for the Senteon Agent.'
tags: [application]
draft: false
unlisted: false
last_update:
  date: 2026-04-13
---

## Description

An ImmyBot software installer for the [Senteon](https://senteon.co/) Agent.

[Software Configuration](https://github.com/ProVal-Tech/immybot/blob/main/software/senteon-agent.toml)

## Changelog

### 2026-09-21

- **Bug Reported:** The Senteon Agent deployment was detecting version 2.6.3.3 from the changelog, while the installer URL had been updated to version 2.6.4.1.
- **Resolution:** Updated the Dynamic Version detection to retrieve the version directly from the Senteon Agent installer URL, allowing the deployment to detect the latest available version correctly.

### 2026-04-13

- **Bug Reported:** The script was failing to install Senteon Agent while attempting to download the latest version due to change in file hash.
- **Resolution:** Added Dynamic Version detection to the software configuration that removes the dependency of file hash. 


### 2025-04-11

- Initial version of the document
