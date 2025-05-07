---
id: 'fa9b4535-5711-4cde-ac58-cb9759dbd65a'
slug: /fa9b4535-5711-4cde-ac58-cb9759dbd65a
title: 'Get Windows Update Report DV'
title_meta: 'Get Windows Update Report DV'
keywords: ['monitor', 'windows', 'update', 'report', 'patching']
description: 'This document outlines the setup of a monitor set designed to execute the Windows Update Report script weekly across machines with the Managed Patching Policy, optimizing performance by limiting the execution to 200 machines at a time every 15 minutes.'
tags: ['patching', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this monitor set is to execute the [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f) script once per week against all the machines with the Managed Patching Policy. It will execute the script against 200 online machines at a time and will perform this action every 15 minutes. This approach aims to reduce the load on the script engine in larger environments.

**Alert Template:** ~Fetch Windows Update Report

## Dependencies

- [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f)
- [CWM - Automate - Solution - Windows Update Report](/docs/affc0b47-f0fe-43f9-95f6-0e0d1205b4d6)

## Target

Limited to the Windows machines with Managed Patch Policy via SQL query.


