---
id: 'e1ac886a-807a-4c85-9f6a-a1cecbc15910'
slug: /e1ac886a-807a-4c85-9f6a-a1cecbc15910
title: 'CloudRadial Installation'
title_meta: 'CloudRadial Installation'
keywords: ['cloudradial', 'cloud-radial', 'cloudradial-agent']
description: 'Select operating system to enable Cloud Radial Agent deployment for.'
tags: ['application', 'installation']
draft: false
unlisted: false
last_update:
  date: 2026-04-17
---

## Summary

Select operating system to enable Cloud Radial Agent deployment for. This custom field manages the auto-execution of the task. However, the [Install CloudRadial Agent [Windows, Mac]](/docs/76612d42-c62d-4d43-b7fd-227e350b420c) task can still be run manually, independent of this field.

## Dependencies

- [Solution - CloudRadial Agent Deployment](/docs/9e861bf3-2a05-46ef-9f7f-a46f33b675c5)

## Custom Field Setup Location

**Custom Fields Path:** `SETTINGS` ➞ `Custom Fields`

## Details

| Name | Level | Type | Options | Default Value | Editable | Description |
| ---- | ----- | ---- | ------- | ------------- | -------- | ----------- |
| CloudRadial Installation | COMPANY | Dropdown | <ul><li>None</li><li>All</li><li>Windows Workstation and Server</li><li>Windows Workstation and Macintosh</li><li>Windows Workstation</li><li>Windows Server</li><li>Macintosh</li></ul> | | Yes | Select operating system to enable Cloud Radial Agent deployment for. |

## Completed Custom Field

![Image1](../../../static/img/docs/e1ac886a-807a-4c85-9f6a-a1cecbc15910/image1.webp)

## Changelog

### 2026-04-17

- Renamed the `Windows` option to `Windows Workstation and Server` because CW RMM uses wildcard matching in group conditions for dropdown custom fields. This prevents `Windows Workstation` from unintentionally including all Windows devices in the group.

### 2025-10-08

- Initial version of the document
