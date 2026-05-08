---
id: '898da82d-b3db-4402-b15d-d62a72dab942'
slug: /898da82d-b3db-4402-b15d-d62a72dab942
title: 'Windows License Issue Detected'
title_meta: 'Windows License Issue Detected'
keywords: ['licensing', 'windows']
description: 'This compound condition detects the Windows server agent where the license status is `Unlicensed` or `NonGenuineGrace`.'
tags: ['licensing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-08
---

## Summary

This compound condition detects the Windows server agent where the license status is `Unlicensed` or `NonGenuineGrace`.

## Details

- **Name:** `Windows License Issue Detected`
- **Description:** `This compound condition detects the Windows agent where the license status is 'Unlicensed' or 'NonGenuineGrace'.`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

- [Solution - Windows License Status](/docs/e05c7729-ebb0-4818-a3a9-b8f736c46c23)
- [Custom Field - cpval Windows License Check](/docs/6d9eacd6-a4e1-474c-bdee-02b753001ac3)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/cpval-windows-license-issue-detected-server.toml)

## Changelog

### 2026-05-08

- Initial version of the document