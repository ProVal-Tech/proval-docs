---
id: '7ea5c70f-f33b-4cf5-88ca-80e66fa68535'
slug: /7ea5c70f-f33b-4cf5-88ca-80e66fa68535
title: 'Webroot Solution - Copy Plugin Data to EDFs'
title_meta: 'Webroot Solution - Copy Plugin Data to EDFs'
keywords: ['client', 'edf', 'webroot', 'plugin', 'autodeploy']
description: 'This document outlines a client script that updates the client EDFs value based on the Webroot plugin settings, specifically when AutoDeploy is enabled. It details the necessary tables, client EDFs, and provides a sample run for better understanding.'
tags: ['update', 'webroot']
draft: false
unlisted: false
---

## Summary

This client script updates the client EDFs value from the Webroot plugin only when AutoDeploy is enabled in the plugin tables `plugin_webroot3_clients` or `plugin_webroot_sa_cls_basic`, depending on the Webroot version.

## Sample Run

![Sample Run](../../../static/img/docs/7ea5c70f-f33b-4cf5-88ca-80e66fa68535/image_1.webp)

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