---
id: '47db6b3a-66e5-4ede-bc9f-7dfd3015608c'
slug: /47db6b3a-66e5-4ede-bc9f-7dfd3015608c
title: 'Symantec Agent Install'
title_meta: 'Symantec Agent Install'
keywords: ['symantec', 'agent', 'windows', 'installation', 'software']
description: 'This document outlines the process for installing the Symantec Agent on a Windows machine using a script. It includes details on dependencies, the installation process, and the expected output, highlighting the time saved by automation.'
tags: ['installation', 'security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The script installs the Symantec Agent on the Windows machine.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/47db6b3a-66e5-4ede-bc9f-7dfd3015608c/image_1.png)

## Dependencies

- `Symantec_Agent_setup.exe` must exist in the `LtShare/Transfer/Software/` folder on the Automate server.

## Process

- Downloads the `setup.exe` file from the Automate server.
- Installs the Symantec Agent through this `setup.exe` file silently.

## Output

- Script log

