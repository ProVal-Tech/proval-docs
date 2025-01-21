---
id: 'b0101ab1-481a-437c-aec0-26e616a66270'
title: 'MAC Screen Lock Timer'
title_meta: 'MAC Screen Lock Timer'
keywords: ['mac', 'screensaver', 'display', 'timer', 'settings']
description: 'This document details an agent procedure for modifying the default Mac screensaver timing and the display turn-off timing. It includes example logs, variable descriptions, and the process for implementing the changes via shell commands.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

This agent procedure is used to modify the default Mac screensaver timing as well as the time for the display to turn off.

## Example Agent Procedure Log

| Time                     | Procedure                                      | Status                                        | User                          |
|--------------------------|------------------------------------------------|-----------------------------------------------|-------------------------------|
| 11:05:46 am 2-Feb-23     | MAC Screen Lock Timer                          | Success THEN                                 | provaltech.com/derek.joniak   |
| 11:05:46 am 2-Feb-23     | MAC Screen Lock Timer                          | Display sleep modified to 10 minutes.        | provaltech.com/derek.joniak   |
| 11:05:46 am 2-Feb-23     | Execute Shell command - Get Results to Variable| Success THEN                                 | provaltech.com/derek.joniak   |
| 11:05:46 am 2-Feb-23     | Execute Shell command - Get Results to Variable-0007| Executing command in standard shell as system: pmset -a displaysleep 10 >"/Library/Kaseya/provaltech/commandresults-1279138153.txt" 2>&1 | provaltech.com/derek.joniak   |
| 11:05:42 am 2-Feb-23     | MAC Screen Lock Timer                          | Screensaver modified to 300 seconds.         | provaltech.com/derek.joniak   |
| 11:05:42 am 2-Feb-23     | Execute Shell command - Get Results to Variable| Success THEN                                 | provaltech.com/derek.joniak   |
| 11:05:42 am 2-Feb-23     | Execute Shell command - Get Results to Variable-0007| Executing command in standard shell as system: defaults write /Library/Preferences/com.apple.screensaver.plist idleTime -int 300 >"/Library/Kaseya/provaltech/commandresults-767522558.txt" 2>&1 | provaltech.com/derek.joniak   |
| 11:05:31 am 2-Feb-23     | Run Now - MAC Screen Lock Timer                | Admin provaltech.com/derek.joniak scheduled procedure Run Now - MAC Screen Lock Timer to run at Feb 2 2023 12:05 PM | provaltech.com/derek.joniak   |

## Variables

| Name        | Description                                                                                   |
|-------------|-----------------------------------------------------------------------------------------------|
| screensaver | Modifies the time until the screensaver activates (Value is in seconds)                      |
| display     | Modifies the time until the display turns off (Value is in minutes)                          |

## Process

The agent procedure modifies two settings on the Mac machine via `executeShellCommandToVariable`.

- Modifies the default .plist file for the screensaver:  
  - `defaults write /Library/Preferences/com.apple.screensaver.plist idleTime -int #screensaver#`
  
- Modifies the pmset setting for the display:  
  - `pmset -a displaysleep #display#`

**Note**: While the pmset command actively updates the GUI to reflect the setting (number 2 in the image), modifying the .plist does not update the GUI (number 1 in the image). The setting takes effect actively but does not have its GUI updated to reflect the change. The pmset command cannot change the screensaver, so the .plist file is modified to achieve this.

![Image](../../../static/img/MAC-Screen-Lock-Timer/image_1.png)
