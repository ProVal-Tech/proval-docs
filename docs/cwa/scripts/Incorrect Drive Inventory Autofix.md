---
id: '59079938-6d59-48d6-aa45-b8c003456bc6'
title: 'Upgrade/Swap Agents Hard Drives or SSDs with Imaged Drives'
title_meta: 'Upgrade/Swap Agents Hard Drives or SSDs with Imaged Drives in ConnectWise Automate'
keywords: ['upgrade', 'swap', 'agents', 'hard-drives', 'ssds', 'imaged', 'inventory']
description: 'This document outlines a script designed to address the issue of incorrect drive inventory in ConnectWise Automate when upgrading or swapping agents’ hard drives or SSDs. The script is intended to be executed through a specific remote monitor template for optimal results.'
tags: ['setup', 'software', 'update']
draft: false
unlisted: false
---

## Summary

**Issue:** Upgrade/Swap Agents Hard Drives or SSDs with Imaged Drives, and the model number in ConnectWise Automate® still reflects the original hard drive or SSD.  
This script will perform the mitigation steps for the above issue and is called by the [CWM - Automate - Remote Monitor - Proval - Production - Incorrect Drive Inventory](<../monitors/Incorrect Drive Inventory.md>) remote monitor.

## Sample Run

This is an Autofix script and will provide better results when executed by the [CWM - Automate - Remote Monitor - Proval - Production - Incorrect Drive Inventory](<../monitors/Incorrect Drive Inventory.md>) remote monitor via the `△ Custom - Incorrect Drive Inventory` template.

## Dependencies

[CWM - Automate - Remote Monitor - Proval - Production - Incorrect Drive Inventory](<../monitors/Incorrect Drive Inventory.md>)

## Variables

| Name   | Description                                        |
|--------|----------------------------------------------------|
| Drives | Drive ID stored in the database for the computer   |

