---
id: '19d3cc45-e5bd-4705-b82d-c0657b2e6195'
title: 'Hosts File - Audit'
title_meta: 'Hosts File - Audit'
keywords: ['custom', 'host', 'file', 'entries', 'script']
description: 'This document details a PowerShell script that retrieves custom entries from the host file, updating the Host File Data EDF accordingly. It can be run on individual agents or scheduled across multiple computers to ensure Automate data remains current.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

This script runs a PowerShell command to pull any custom entries that exist in the computer's host file. If there are custom entries, the Host File Data EDF gets updated with the information separated by commas. If there are no custom entries, it updates the EDF with 'No Custom Entries.'

## Sample Run

This script can be run on a single agent or scheduled on a batch of computers on a recurring basis to keep data in Automate up to date. There are no variables needed for this script.

![Sample Run](../../../static/img/Hosts-File---Audit/image_1.png)

## Process

1. Run a PowerShell command to return all custom results inside the Windows host file, separated by commas.
2. Update the Host File Contents EDF under Host File Info.

## Output

This script outputs information into the Host File Contents EDF and can be displayed in a Dataview for monitoring if desired.



