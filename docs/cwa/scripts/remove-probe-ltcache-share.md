---
id: '31680e20-afa7-4b6b-9510-13a10193f6a1'
slug: /31680e20-afa7-4b6b-9510-13a10193f6a1
title: 'Remove Probe LTCache Share'
title_meta: 'Remove Probe LTCache Share'
keywords: ['ltcache', 'probe', 'cleanup', 'database', 'automation']
description: 'This document outlines a script designed to remove the current LTCache on the Probe for a specified target location, providing a streamlined process that saves time and enhances efficiency in managing cache data.'
tags: ['cleanup', 'database', 'performance', 'windows']
draft: false
unlisted: false
---

## Summary

This script will remove the current LTCache on the Probe for the target's location.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/31680e20-afa7-4b6b-9510-13a10193f6a1/image_1.png)

## Dependencies

- Requires a probe to be set up.

## Variables

- `@TargetComputerID@` = %computerid% (The computer you ran the script on)
- `@ComputerID@` = %ProbeID% (This targets the location probe)
- `@RemoveLTCachePSOut@` (The output from the PowerShell script)

## Process

1. Sets the target computer to the computer the script ran on.
2. Sets the probe target based on the computer's location.
3. Runs the cleanup on the share.
4. Updates the database to reflect the removal of the cache.

## Output

- Script log

