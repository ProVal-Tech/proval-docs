---
id: 'e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c'
title: 'EPM - Windows Configuration - Monitor - Reboot Pending - Clear EDFs'
title_meta: 'EPM - Windows Configuration - Monitor - Reboot Pending - Clear EDFs'
keywords: ['edf', 'monitor', 'reboot', 'clear', 'windows', 'configuration']
description: 'This document provides an overview of a script designed to clear the EDFs used in the EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]. It explains the dependencies, process, and expected output of the script, ensuring that the monitor can be re-triggered effectively.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This script is designed to be used with the monitor [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](<../monitors/Reboot Pending Prompt.md>). The script's primary function is to clear the EDFs used in the monitor so it can be re-triggered at a later time.

## Sample Run

This script clears the EDFs used in the monitor [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](<../monitors/Reboot Pending Prompt.md>) and the script [EPM - Windows Configuration - Script - User Prompt - Reboot](https://proval.itglue.com/DOC-5078775-9076644).

![Sample Run Image](../../../static/img/Reset-Reboot-Pending-EDFs/image_1.png)

## Dependencies

The following items are dependent on this script:

- [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](<../monitors/Reboot Pending Prompt.md>)
- [EPM - Windows Configuration - Script - User Prompt - Reboot](https://proval.itglue.com/DOC-5078775-9076644)

## Process

This script simply sets the following EDFs to 0 so that the user prompting stops and can be re-triggered:

![Process Image](../../../static/img/Reset-Reboot-Pending-EDFs/image_2.png)

## Output

No logging is performed with this script. It simply zeros out the required EDFs for the dependencies.
