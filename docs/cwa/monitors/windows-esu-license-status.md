---
id: '75abc7b8-1ff2-42d4-8028-dd0a3adaf899'
slug: /75abc7b8-1ff2-42d4-8028-dd0a3adaf899
title: 'Windows ESU License Status'
title_meta: 'Windows ESU License Status'
keywords: ['esu', 'license', 'extended', 'windows-10', 'windows-2012', '22h2']
description: 'Executes the auditing script once per week against Windows 10 22H2 and Windows 2012/2012 R2 machines.'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Summary

The internal monitor executes the auditing script [ESU License Activation Detection](/docs/634db1b5-58a2-4571-8873-74040c203d56) once per week against Windows 10 22H2 and Windows 2012/2012 R2 machines.

## Dependencies

- [Script - ESU License Activation Detection](/docs/634db1b5-58a2-4571-8873-74040c203d56)
- [Solution - Windows ESU Licensing and Auditing](/docs/7fe6a52b-79fd-487b-8009-523996e74d11)

## Target

- Global

## Alert Template

- `△ Custom - Execute Script - ESU License Activation Detection`
