---
id: 'cwa-remove-ltcache'
title: 'Remove LTCache from Probe'
title_meta: 'Remove LTCache from Probe'
keywords: ['ltcache', 'probe', 'cleanup', 'database', 'automation']
description: 'This document outlines a script designed to remove the current LTCache on the Probe for a specified target location, providing a streamlined process that saves time and enhances efficiency in managing cache data.'
tags: ['cleanup', 'database', 'automation', 'performance', 'windows']
draft: false
unlisted: false
---
## Summary

This script will remove the current LTCache on the Probe for the target's location.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Remove-Probe-LTCache-Share/image_1.png)

## Dependencies

- Requires a probe to be setup

## Variables

- `@TargetComputerID@` = %computerid% (The computer you ran the script on)
- `@Computerid@` = %ProbeID% -> this targets the location probe 
- `@RemoveLTCachePSOut@` -> the output from the Powershell script

## Process

1. Sets the target computer to the computer the script ran on
2. Sets the probe target based on the computer's location
3. Runs the cleanup on the share
4. Updates the database to reflect the removal of the cache

## Output

- Script log




