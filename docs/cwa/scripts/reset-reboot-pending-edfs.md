---
id: 'e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c'
slug: /e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c
title: 'Reset Reboot Pending EDFs'
title_meta: 'Reset Reboot Pending EDFs'
keywords: ['edf', 'monitor', 'reboot', 'clear', 'windows', 'configuration']
description: 'This document provides an overview of a script designed to clear the EDFs used in the EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]. It explains the dependencies, process, and expected output of the script, ensuring that the monitor can be re-triggered effectively.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This script is designed to be used with the monitor [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](/docs/8163996f-f8b6-4b7d-b5b1-6b965a9408d4). The script's primary function is to clear the EDFs used in the monitor so it can be re-triggered at a later time.

## Sample Run

This script clears the EDFs used in the monitor [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](/docs/8163996f-f8b6-4b7d-b5b1-6b965a9408d4) and the script [EPM - Windows Configuration - Script - User Prompt - Reboot](/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8).

![Sample Run Image](../../../static/img/docs/e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c/image_1.webp)

## Dependencies

The following items are dependent on this script:

- [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](/docs/8163996f-f8b6-4b7d-b5b1-6b965a9408d4)
- [EPM - Windows Configuration - Script - User Prompt - Reboot](/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8)

## Process

This script simply sets the following EDFs to 0 so that the user prompting stops and can be re-triggered:

![Process Image](../../../static/img/docs/e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c/image_2.webp)

## Output

No logging is performed with this script. It simply zeros out the required EDFs for the dependencies.