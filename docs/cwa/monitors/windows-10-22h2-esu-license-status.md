---
id: '75abc7b8-1ff2-42d4-8028-dd0a3adaf899'
slug: /75abc7b8-1ff2-42d4-8028-dd0a3adaf899
title: 'Windows 10 22H2 ESU License Status'
title_meta: 'Windows 10 22H2 ESU License Status'
keywords: ['esu', 'license', 'extended', 'windows-10', '22h2']
description: 'Executes the auditing script once per week against Windows 10 22H2 machines.'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Summary

The internal monitor executes the auditing script [ESU License Activation Detection](/docs/765670f5-5120-4066-89d8-2cda873e8212) once per week against Windows 10 22H2 machines.

## Dependencies

- [Script - ESU License Activation Detection](/docs/765670f5-5120-4066-89d8-2cda873e8212)
- [Solution - Windows 10 ESU Licensing and Auditing](/docs/7fe6a52b-79fd-487b-8009-523996e74d11)

## Target

- Global

## Alert Template

- `△ Custom - Execute Script - ESU License Activation Detection`
