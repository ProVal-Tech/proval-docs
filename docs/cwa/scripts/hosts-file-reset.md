---
id: 'd4f874ae-e2d5-4a6c-b0c3-14972813012d'
slug: /d4f874ae-e2d5-4a6c-b0c3-14972813012d
title: 'Hosts File - Reset'
title_meta: 'Hosts File - Reset'
keywords: ['rename', 'host', 'file', 'dns', 'flush', 'default']
description: 'This document provides a detailed overview of a script designed to rename the current host file by appending OLD to its name and replacing it with a stock host file that contains no custom entries. The process includes flushing the DNS cache and updating relevant data fields.'
tags: ['dns', 'recovery', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script simply renames the current host file to include OLD in the name and replaces it with a stock host file that contains no custom entries.

## Sample Run

![Sample Run](../../../static/img/docs/d4f874ae-e2d5-4a6c-b0c3-14972813012d/image_1.webp)

## Dependencies

This script depends on the following items:
- [Update EDF with Existing Host File Entries](/docs/19d3cc45-e5bd-4705-b82d-c0657b2e6195)
- Host File Contents (Extra Data Field)

## Process

1. Rename the existing host file to include OLD in the name.
2. Build a new host file with the default host file information.
3. Perform `ipconfig /flushdns`.
4. Update the Host File Contents EDF with the new information.

## Output

This script outputs information to the following areas:
- Script Log
- Host File Contents EDF
  - ![Host File Contents](../../../static/img/docs/d4f874ae-e2d5-4a6c-b0c3-14972813012d/image_2.webp)