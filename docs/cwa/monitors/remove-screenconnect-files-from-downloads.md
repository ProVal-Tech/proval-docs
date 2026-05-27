---  
id: '0663b3cf-149f-4346-ba54-ed309ef8fdf5'
slug: /0663b3cf-149f-4346-ba54-ed309ef8fdf5
title: 'Remove ScreenConnect Files from Downloads'
title_meta: 'Remove ScreenConnect Files from Downloads'
keywords: ['screenconnect']
description: 'This monitor detects the machines where Client EDF "Remove SC Files from Downloads" is selected.'
tags: []
draft: false
unlisted: false
last_update:
  date: 2026-05-27
---
## Summary

This monitor detects the machines where Client EDF "Remove SC Files from Downloads" is selected and will run the [script](/docs/182eb9a9-f8d2-4d49-97f0-4a94c09e1402) to remove the ScreenConnect.client setup files from the downloads folder.

## Dependencies

- [Script - Clean ScreenConnect Files from Downloads](/docs/182eb9a9-f8d2-4d49-97f0-4a94c09e1402)

## Target

- Windows machines

## Alert Template

- `△ Custom - Execute Script - Clean Screenconnect Files from Downloads`

## Ticketing

## Changelog

### 2026-05-27

- Initial version of the document
