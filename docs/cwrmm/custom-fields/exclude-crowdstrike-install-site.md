---
id: '8d9498e0-4392-471e-93da-b546e0934b89'
slug: /8d9498e0-4392-471e-93da-b546e0934b89
title: 'ExcludeCrowdStrikeInstallSite'
title_meta: 'ExcludeCrowdStrikeInstallSite'
keywords: ['crowdstrike', 'crowdstrike-windows-sensor', 'deploy-crowdstrike', 'windows-sensor', 'exclusion']
description: 'Flag this custom field to exclude the site from CrowdStrike auto installation.'
tags: ['application', 'installation', 'security', 'antivirus']
draft: false
unlisted: false
---

## Summary

Flag this custom field to exclude the site from CrowdStrike auto installation. However, the [Install CrowdStrike Windows Sensor](/docs/7eb5860d-08e2-41cb-b22b-48505618f1ae) task can still be run manually, independent of this field.

## Dependencies

- [DeployCrowdStrikeWindowsSensor](/docs/ffe13fcc-700f-41ea-9fdf-20ea4d253326)
- [Solution: Deploy CrowdStrike Windows Sensor](/docs/dec6391a-c159-4b45-8c3a-9df4d88dd1c5)

## Custom Field Setup Location

**Custom Fields Path:** `SETTINGS` ➞ `Custom Fields`  

## Details

| Name | Level | Type | Default Value | Editable | Description |
| ---- | ----- | ---- | ------------- | -------- | ----------- |
| ExcludeCrowdStrikeInstallSite | SITE | Flag | | Yes | Flag this custom field to exclude the site from CrowdStrike auto installation |

## Completed Custom Field

![Image1](../../../static/img/docs/8d9498e0-4392-471e-93da-b546e0934b89/image1.webp)
