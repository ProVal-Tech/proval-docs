---
id: 'cwa-update-client-edf'
title: 'Update Client EDF from Webroot Plugin'
title_meta: 'Update Client EDF from Webroot Plugin'
keywords: ['client', 'edf', 'webroot', 'plugin', 'autodeploy']
description: 'This document outlines a client script that updates the client EDFs value based on the Webroot plugin settings, specifically when AutoDeploy is enabled. It details the necessary tables, client EDFs, and provides a sample run for better understanding.'
tags: ['client', 'webroot', 'plugin', 'update', 'configuration']
draft: false
unlisted: false
---
## Summary

This client script will update the client EDFs value from the Webroot plugin only when AutoDeploy is enabled in the plugin table `plugin_webroot3_clients` or `plugin_webroot_sa_cls_basic` based on the Webroot version.

## Sample Run

![Sample Run](5078775/docs/14501467/images/21743783)

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

