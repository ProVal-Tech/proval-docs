---
id: '9e5da9e3-cac1-42e0-8081-3b4504102cad'
slug: /9e5da9e3-cac1-42e0-8081-3b4504102cad
title: 'Enable Bloatware Removal'
title_meta: 'Enable Bloatware Removal'
keywords:  ['bloatware', 'pua', 'remove-pua', 'remove-bloatware', 'uninstallation', 'application-management']
description: 'This custom field removes specified bloatware from the system.'
tags:  ['windows', 'uninstallation', 'application']
draft: False
unlisted: false
last_update:
  date: 2026-03-30
---

## Summary

This custom field is used to remove specified bloatware applications from the system. The applications to be removed must be explicitly listed in the `Bloatware to Remove` custom field. By default, this field is set to None. Select the appropriate operating system from the dropdown menu to ensure the bloatware removal is applied correctly for that OS.

## Dependencies

- [Solution - Remove Bloatware](/docs/0b1f4077-1cf3-43ea-9c9d-93e2db94e24f)



## Details

| Name                 | Level                | Type         | Options       | Default?         | Required | Editable | Description                              |
|----------------------|----------------------|---------------------|-------|----------------|----------|----------|------------------------------------------|
| Enable Bloatware Removal | Company | Dropdown |  <ul><li>None</li><li>Both</li><li>Windows Servers</li><li>Windows Workstations</li></ul>  | blank or Default Value | True | Yes  | Enable this custom field to remove unwanted applications (bloatware) from the system. Select the appropriate operating system from the dropdown menu to ensure the bloatware removal is applied correctly for that OS. |

## Completed Custom Field

![Image1](../../../static/img/docs/9e5da9e3-cac1-42e0-8081-3b4504102cad/image1.webp)

## Changelog

### 2026-03-30

- Initial version of the document

