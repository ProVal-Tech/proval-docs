---
id: 'cwa-remove-ltcache'
title: 'Remove LTCache on Probe'
title_meta: 'Remove LTCache on Probe'
keywords: ['ltcache', 'probe', 'credentials', 'location', 'settings', 'diskspace', 'folder', 'share', 'local', 'account']
description: 'This document explains a script that removes the current LTCache on the Probe for a specific location, creates necessary credentials if they do not exist, and sets up a new LTCache. It also includes details on dependencies, variables used in the script, and the overall process, ensuring efficient management of LTCache settings.'
tags: ['configuration', 'location', 'diskspace', 'security', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This script will remove the current LTCache on the Probe for the target's location, create credentials (if they don't exist) and create an LTCache on the Probe.  

It will then set the location settings to use the new LTCache settings.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\Setup-Probe-LTCache-Share\image_1.png)

## Dependencies

Location must have a probe enabled, otherwise script will exit with error.

## Variables

- `@TargetComputerID@` - computer script is running on
- `@Computerid@` - Probe computerid
- `@DiskSpaceCheck@` - Result in percent of free space available on Drive
- `@ProbeHostName@` - Computer Name of ProbeID
- `@LTChachePath@` = `@ProbeHostName@\LTCache`
- `@LTChachePassword@` - Randomly Generated password / stored in the passwords table

## Process

- Find Probe Agent
- Checks current computer drive free space - if less than 20% will exit script
- Creates folder and share
- Creates a local account username / password for the LTCache folder
  - Username = ltcache 
  - Password = Randomized / Stored in Passwords Table / Client Passwords

## Output

Script log


