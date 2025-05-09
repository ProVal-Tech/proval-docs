---
id: '8bc47dfb-e936-4d6d-a7fb-2046f8f2e5b1'
slug: /8bc47dfb-e936-4d6d-a7fb-2046f8f2e5b1
title: 'plugin_proval_wmipatchesinstalled'
title_meta: 'plugin_proval_wmipatchesinstalled'
keywords: ['patch', 'information', 'computer', 'wmi', 'installation', 'status']
description: 'This document outlines the process of storing individual patch information for each computer, including their installation status retrieved from WMI, independent of Automate patching. It provides a detailed table of the plugin used and its columns for better understanding.'
tags: ['wmi']
draft: false
unlisted: false
---

## Purpose

This document stores individual patch information per computer and their installation status from WMI (outside of Automate patching).

## Dependencies

[Audit WMI Patch History](/docs/113349eb-9de0-4b42-b773-cf873f87f2f0)

## Table

#### plugin_proval_wifi_profiles

| Column      | Type     | Explanation                                           |
|-------------|----------|------------------------------------------------------|
| ComputerID  | INT      | The ID of the audited computer.                      |
| KB          | VARCHAR  | The KB ID of the audited patch.                      |
| Title       | VARCHAR  | The title of the audited patch.                      |
| Result      | VARCHAR  | The current installation status of the audited patch.|
| Date        | DATETIME | The date and time that the audited patch entered the Result state. |
