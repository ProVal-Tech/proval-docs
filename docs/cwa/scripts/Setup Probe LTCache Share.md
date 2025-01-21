---
id: '06ceeffc-d91b-4936-9889-101e02b683ca'
title: 'Setup Probe LTCache Share'
title_meta: 'Setup Probe LTCache Share'
keywords: ['ltcache', 'probe', 'credentials', 'location', 'settings', 'diskspace', 'folder', 'share', 'local', 'account']
description: 'This document explains a script that removes the current LTCache on the Probe for a specific location, creates necessary credentials if they do not exist, and sets up a new LTCache. It also includes details on dependencies, variables used in the script, and the overall process, ensuring efficient management of LTCache settings.'
tags: ['diskspace', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script will remove the current LTCache on the Probe for the target location, create credentials (if they don't exist), and establish a new LTCache on the Probe.

It will then set the location settings to use the new LTCache settings.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Setup-Probe-LTCache-Share/image_1.png)

## Dependencies

The location must have a probe enabled; otherwise, the script will exit with an error.

## Variables

- `@TargetComputerID@` - Computer on which the script is running
- `@Computerid@` - Probe computer ID
- `@DiskSpaceCheck@` - Result in percentage of free space available on the drive
- `@ProbeHostName@` - Computer name of Probe ID
- `@LTCachePath@` - `@ProbeHostName@/LTCache`
- `@LTCachePassword@` - Randomly generated password stored in the passwords table

## Process

- Find Probe Agent
- Check the current computer drive's free space; if less than 20%, the script will exit
- Create folder and share
- Create a local account username/password for the LTCache folder
  - Username: ltcache
  - Password: Randomized / Stored in Passwords Table / Client Passwords

## Output

Script log



