---
id: '417bc415-aa42-401f-b748-0f2715e4a239'
slug: /417bc415-aa42-401f-b748-0f2715e4a239
title: 'MySQL - Permission - Set agentdeploymentreadinesscheck Table Permissions'
title_meta: 'MySQL - Permission - Set agentdeploymentreadinesscheck Table Permissions'
keywords: ['permissions', 'database', 'users', 'hosted', 'on-prem', 'automation']
description: 'This document describes a script that gathers all users in the database and grants the necessary permissions for the agentdeploymentreadinesscheck table for both Hosted and On-Prem Clients. The script is designed to save time by automating the permission assignment process and should be scheduled to run every 12-24 hours.'
tags: ['database', 'security', 'update']
draft: false
unlisted: false
---

## Summary

This script will gather all users in the database and grant all required permissions for the `agentdeploymentreadinesscheck` table for both Hosted and On-Prem Clients.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/417bc415-aa42-401f-b748-0f2715e4a239/image_1.webp)

The script is converted to a client script and should be scheduled to run every 12-24 hours.

## Variables

| Name              | Description                                                                                             |
|-------------------|---------------------------------------------------------------------------------------------------------|
| UpdateStatements   | This variable will store the SQL result, which will be further used as an update statement to grant permission to the agentdeploymentreadinesscheck table. |

