---
id: '99b8bcab-0b54-4591-a973-819474173872'
slug: /99b8bcab-0b54-4591-a973-819474173872
title: 'Remove Nebula Agent'
title_meta: 'Remove Nebula Agent'
keywords: ['security', 'nebula agent', 'malwarebytes']
description: 'Removes the Nebula/OneView agent from the endpoint using the ThreatDown Business Support Tool.'
tags: ['security','malwarebytes']
draft: false
unlisted: false
last_update:
  date: 2026-08-26
---

## Summary

Removes the Nebula/OneView agent from the endpoint using the ThreatDown Business Support Tool.

## Sample Run

![Sample Run Image](../../../static/img/docs/99b8bcab-0b54-4591-a973-819474173872/img.webp)

## User Parameters

| Name | Required | Example | Description   |
|---------|---------|---------|---------|
| `TamperProtectionPassword` | Yes | 'abcdefghijkl' | The Tamper Protection password configured in the Nebula or OneView policy. Use "NoTamperProtection" if Tamper Protection is disabled. If the password contains quotation marks, add another quotation mark after it.|
| `DeepClean` | No | `1`, `True`, `Yes` | Removes any and all registry items associated with the agent. Typically run after a reboot following the initial cleanup. |

## Output

- Script Log
- Script Error

## Changelog

### 2026-08-26

- Initial version of the document.
