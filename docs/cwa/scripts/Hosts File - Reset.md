---
id: 'd4f874ae-e2d5-4a6c-b0c3-14972813012d'
title: 'Rename Host File Script'
title_meta: 'Rename Host File Script - Restore Default Host File Entries'
keywords: ['rename', 'host', 'file', 'dns', 'flush', 'default']
description: 'This document provides a detailed overview of a script designed to rename the current host file by appending OLD to its name and replacing it with a stock host file that contains no custom entries. The process includes flushing the DNS cache and updating relevant data fields.'
tags: ['dns', 'recovery', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This script simply renames the current host file to have OLD in the name and replaces it with a stock host file with no custom entries in it.

## Sample Run

![Sample Run](../../../static/img/Hosts-File---Reset/image_1.png)

## Dependencies

This script is dependent on the following items:
- [Update EDF with Existing Host File Entries](<./Hosts File - Audit.md>)
- Host File Contents (Extra Data Field)

## Process

1. Rename existing host file to have OLD in the name
2. Build a new host file with the default host file information inside.
3. Perform a `ipconfig /flushdns`
4. Update the Host File Contents EDF with the new info.

## Output

This script outputs information to the following areas:
- Script Log
- Host File Contents EDF
  - ![Host File Contents](../../../static/img/Hosts-File---Reset/image_2.png)













