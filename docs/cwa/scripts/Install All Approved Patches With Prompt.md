---
id: 'f2a3feba-fc4b-4693-ba31-6b50f66bac15'
title: 'Install All Approved Patches With Prompt'
title_meta: 'Install All Approved Patches With Prompt'
keywords: ['patches', 'installation', 'reboot', 'scheduling', 'notification']
description: 'This document outlines a script that manages the installation of approved patches on a machine, including user interaction for reboot scheduling and notifications for pending actions. It handles scenarios where the user is logged in or not, provides prompts for reboot timing, and ensures that users are informed of available patches and any installation failures.'
tags: ['installation', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This script is designed to handle the installation of all pending approved patches on the machine. If the user is not logged in, it will proceed to reboot the machine. However, if the user is logged in, it will provide a popup message with options to select a specific time for rebooting, ranging from within the next 48 hours. 

If the user chooses a time beyond the 48-hour window, the prompt will repeat up to three times, encouraging the user to select a time within the next 48 hours. If no time is selected after four attempts, the script will schedule the restart after 48 hours. 

Additionally, the script will display the number of available patches before installing them and inform the user of any patches that failed to install via a popup message. Furthermore, if the script schedules a restart after 48 hours due to user inactivity or failure to select a time, it will send another popup message before forcibly restarting the computer. 

While the script can be executed from Automate, it is recommended to utilize it from the [Tray Menu](https://docs.connectwise.com/ConnectWise_Automate_Documentation/060/020/010#:~:text=setting%20this%20value.-,Tray%20Menus,-The%C2%A0Tray%20Menus) within an agent template for a better user experience.

**Note:**  
- The logo displayed in the sample prompts is for exemplary purposes only. The prompter will fetch and display the logo from the concerned Automate environment.
- The machine will be restarted immediately if the user selects the `Reboot Now` button for a `Post Patch Reboot Confirmation` prompt.

## Sample Run

![Sample Run](../../../static/img/Install-All-Approved-Patches-With-Prompt/image_1.png)

## Dependencies

[CWM - Automate - Script - Prompter](<./Prompter.md>)

## Prompts

#### Pre-Patch Installation Prompt

**CASE 1:** If the approved production patches are available on the computer to install  
![Case 1](../../../static/img/Install-All-Approved-Patches-With-Prompt/image_2.png)

**CASE 2:** If there are no patches available to install. The script will exit if there are no approved production patches missing on the computer.  
![Case 2](../../../static/img/Install-All-Approved-Patches-With-Prompt/image_3.png)

#### Post Patch Reboot Confirmation

**First Prompt:**  
![First Prompt](../../../static/img/Install-All-Approved-Patches-With-Prompt/image_4.png)

**Second Prompt:** This prompt will only be sent if the user fails to select a convenient time in the first prompt between the next 48 hours to restart the computer.  
![Second Prompt](../../../static/img/Install-All-Approved-Patches-With-Prompt/image_5.png)

**Final Prompt:** The script will be scheduled to restart the computer after 48 hours if the user fails to select a convenient time between the next 48 hours to restart their computer.  
![Final Prompt](../../../static/img/Install-All-Approved-Patches-With-Prompt/image_6.png)

#### Pre Reboot Prompt

This prompt will be sent solely if an automatic restart is scheduled after 48 hours.  
![Pre Reboot Prompt](../../../static/img/Install-All-Approved-Patches-With-Prompt/image_7.png)

## Post Reboot Prompt

**CASE 1:** If the patch job was successful and there are no approved production patches left to install.  
![Post Reboot Case 1](../../../static/img/Install-All-Approved-Patches-With-Prompt/image_8.png)

**CASE 2:** If Automate fails to install any patch(es).  
![Post Reboot Case 2](../../../static/img/Install-All-Approved-Patches-With-Prompt/image_9.png)

#### Windows Reboot Schedule Notification

A pop-up message will appear at the bottom right corner of the screen to remind the end user of the scheduled reboot.  
![Windows Reboot Schedule Notification](../../../static/img/Install-All-Approved-Patches-With-Prompt/image_10.png)

## Output

- Script Log
- Prompt on End Machine



