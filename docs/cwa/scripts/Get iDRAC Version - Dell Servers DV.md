---
id: '4545d115-22d7-451c-935b-fe8ca67f17e7'
slug: /4545d115-22d7-451c-935b-fe8ca67f17e7
title: 'Get iDRAC Version - Dell Servers DV'
title_meta: 'Get iDRAC Version - Dell Servers DV'
keywords: ['idrac', 'dell', 'version', 'fetch', 'server']
description: 'This document outlines a script that retrieves the iDRAC version from Dell servers, storing the output in a script state for further use in a dataview. The process includes checking the server type, executing a command to get the version, and formatting the output for easy access.'
tags: ['dell']
draft: false
unlisted: false
---

## Summary

The script will fetch the version of iDRAC from Dell servers. The script output will be stored in a script state, which is used by the dataview [iDRAC Version - Dell Servers](<../dataviews/iDRAC Version - Dell Servers.md>).

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Get-iDRAC-Version---Dell-Servers-DV/image_1.png)

## Variables

`@iDRAC@`: Stores the formatted iDRAC Version from `%shellresult%` and is further used to store the value in the script state "iDRAC_Version".

### Script States

| Name          | Example       | Description                                         |
|---------------|---------------|-----------------------------------------------------|
| iDRAC_Version | 2.61.60.60    | Version of iDRAC of the concerned Dell Server.     |

## Process

- Works for Dell Servers only.
- Checks if the computer is a Dell Server.
- Runs the `racadm getversion -f idrac` command to fetch the iDRAC Version.
- Sets a variable `@iDRAC@` using the SQL Query `SELECT TRIM(SUBSTRING_INDEX('%shellresult%','=',-1)) AS iDRAC Version` to extract the numerical value from the shell result.
- Assigns that value to the script state `iDRAC_Version`.
- The output of the script can be checked from the "iDRAC Version - Dell Servers" Dataview.

## Output

- Script log
- Script state
- Dataview


