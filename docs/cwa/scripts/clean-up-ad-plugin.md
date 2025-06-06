---
id: 'fc26cfc8-33ff-405d-ba3a-bfad02637607'
slug: /fc26cfc8-33ff-405d-ba3a-bfad02637607
title: 'Clean Up AD Plugin'
title_meta: 'Clean Up AD Plugin'
keywords: ['active-directory', 'cleanup', 'database', 'synchronization']
description: 'This document describes the process of cleaning up the Active Directory Plugin in ConnectWise Automate by removing unnecessary rows from specific tables and ensuring that the plugin is up to date. It outlines the requirements and dependencies for successful implementation.'
tags: ['active-directory', 'cleanup', 'database', 'setup']
draft: false
unlisted: false
---

## Summary

This document outlines the cleanup process for the Active Directory Plugin in ConnectWise Automate. It involves removing all rows from the following tables:

- `plugin_ad_computers`
- `plugin_ad_memberofxrefs`
- `plugin_ad_userproxyaddresses`
- `plugin_ad_users`

Additionally, it removes all rows with `ObjectType` 1 or 2 from `plugin_ad_entries`.

## Requirements

- The AD plugin needs to be up to date.

## Dependencies

- The "Run Full Active Directory Sync" script from Automate's Active Directory plugin.

## Implementation

1. Import the 'Clean Up AD Plugin' script.
2. Schedule the client script to run.