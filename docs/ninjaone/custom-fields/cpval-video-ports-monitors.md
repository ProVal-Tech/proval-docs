---
id: '73c09cca-0fe3-4683-a21d-1f397f0ec2c6'
slug: /73c09cca-0fe3-4683-a21d-1f397f0ec2c6
title: 'cPVAL Video Ports Monitors'
title_meta: 'cPVAL Video Ports Monitors'
keywords: ['video', 'monitors']
description: 'This custom field is used show available video output ports on the system (HDMI, DisplayPort, VGA, DVI, etc.). Detect which ports are actively used by connected monitors.'
tags: ['auditing', 'custom-fields']
draft: false
unlisted: false
---

## Summary

Displays detailed information gathered by the script [Video Ports and Monitor Usage Detection](/docs/1778ced7-a9b2-461c-a20c-c72c2242e94f). It displays data about the system’s video controllers, shows which monitors are currently connected, type of video ports they are using and commonly available ports based on GPU capabilities.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
|cPVAL Video Ports Monitors | cpvalvideoportsmonitors | Device | multi-line | False | | `Editable` | `Read/Write` | `Read/Write` | Displays data about the system’s video controllers, shows which monitors are currently connected, type of video ports they are using and commonly available ports based on GPU capabilities. | Video Ports | Video Ports |

## Dependencies

- [Video Port and Monitor Usage Detection](/docs/1778ced7-a9b2-461c-a20c-c72c2242e94f)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-video-ports-monitors.toml)

## Sample Screenshot

![SampleRun1](../../../static/img/docs/1778ced7-a9b2-461c-a20c-c72c2242e94f/ninja2.webp)