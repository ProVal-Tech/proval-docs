---
id: 'cwa-storing-patch-information'
title: 'Storing Individual Patch Information per Computer'
title_meta: 'Storing Individual Patch Information per Computer'
keywords: ['patch', 'information', 'computer', 'wmi', 'installation', 'status']
description: 'This document outlines the process of storing individual patch information for each computer, including their installation status retrieved from WMI, independent of Automate patching. It provides a detailed table of the plugin used and its columns for better understanding.'
tags: ['wmi', 'patch', 'status', 'computer', 'audit']
draft: false
unlisted: false
---
## Purpose

Stores individual patch information per computer and their installation status from WMI (outside of Automate patching).

## Dependencies

[Audit WMI Patch History](https://proval.itglue.com/DOC-5078775-8143435)

## Table

#### plugin_proval_wifi_profiles

| Column      | Type     | Explanation                                           |
|-------------|----------|------------------------------------------------------|
| ComputerID  | INT      | The ID of the audited computer.                      |
| KB          | VARCHAR  | The KB ID of the audited patch.                      |
| Title       | VARCHAR  | The title of the audited patch.                      |
| Result      | VARCHAR  | The current installation status of the audited patch.|
| Date        | DATETIME | The date and time that the audited patch entered the Result state. |


