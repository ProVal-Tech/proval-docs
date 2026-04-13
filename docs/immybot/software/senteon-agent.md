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

### 2026-04-13

Bug Reported: The issues occur as the script failed to install the senteon agent. As the script tried to download the latest version but somehow the File hash gets changed.

Resolution:  Added the dynamic version within the software configuration. Now the script uses the dynamic version while checking if the software is present or not.

Updated the Dynamic version within the ImmyBot repo.

### 2025-04-11

- Initial version of the document
