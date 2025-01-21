---
id: '7ea5c70f-f33b-4cf5-88ca-80e66fa68535'
title: 'Update Client EDF from Webroot Plugin'
title_meta: 'Update Client EDF from Webroot Plugin'
keywords: ['client', 'edf', 'webroot', 'plugin', 'autodeploy']
description: 'This document outlines a client script that updates the client EDFs value based on the Webroot plugin settings, specifically when AutoDeploy is enabled. It details the necessary tables, client EDFs, and provides a sample run for better understanding.'
tags: ['update', 'webroot']
draft: false
unlisted: false
---

## Summary

This client script updates the client EDFs value from the Webroot plugin only when AutoDeploy is enabled in the plugin tables `plugin_webroot3_clients` or `plugin_webroot_sa_cls_basic`, depending on the Webroot version.

## Sample Run

![Sample Run](../../../static/img/Webroot-Solution---Copy-Plugin-Data-to-EDFs/image_1.png)

## Dependencies

**Tables:**
- `plugin_webroot3_clients`
- `plugin_webroot_sa_cls_basic`

**Client EDFs:**
- Enable Webroot Deployment
- Webroot Site Keycode
- WorkstationWebrootGroupCode
- ServerWebrootGroupCode

## Output

- EDF
