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

This script is designed to be put in place with the monitor [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](<../monitors/Reboot Pending Prompt.md>). The script's entire function is to clear the EDFs used in the monitor so it can be re-triggered at another time.

## Sample Run

This script clears the EDFs used in the monitor [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](<../monitors/Reboot Pending Prompt.md>) and script [EPM - Windows Configuration - Script - User Prompt - Reboot](https://proval.itglue.com/DOC-5078775-9076644).

![Sample Run Image](../../../static/img/Reset-Reboot-Pending-EDFs/image_1.png)

## Dependencies

The following items are dependent on this script:

- [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](<../monitors/Reboot Pending Prompt.md>)
- [EPM - Windows Configuration - Script - User Prompt - Reboot](https://proval.itglue.com/DOC-5078775-9076644)

## Process

This script simply sets the following EDF's to 0 so the user prompting stops and can be re-triggered:

![Process Image](../../../static/img/Reset-Reboot-Pending-EDFs/image_2.png)

## Output

No Logging is done with this script. It simply just zero's out required EDFs for the Dependencies.












