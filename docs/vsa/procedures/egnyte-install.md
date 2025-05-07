---
id: '04d18467-ad93-4ed2-8da9-52796031d41c'
slug: /04d18467-ad93-4ed2-8da9-52796031d41c
title: 'Egnyte - Install'
title_meta: 'Egnyte - Install'
keywords: ['egnyte', 'installation', 'software', 'office', 'reboot']
description: 'This document outlines the agent procedure for updating and installing the Egnyte software, including the steps taken to kill all Office applications prior to installation and prompting for a reboot afterward. The example agent procedure log provides detailed insights into the actions and results of the installation process.'
tags: ['cleanup', 'installation', 'reboot', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The agent procedure updates and installs the Egnyte software. It kills all Office applications prior to installation and prompts for a reboot afterward.

## Example Agent Procedure Log

| Time                    | Action                      | Result                                                                                              | User          |
|-------------------------|-----------------------------|-----------------------------------------------------------------------------------------------------|---------------|
| 7:09:06 PM 2-May-23    | Egnyte - Install            | Success THEN                                                                                         | derek.joniak  |
| 7:08:10 PM 2-May-23    | Egnyte - Install-0003      | Cleanup performed                                                                                    | derek.joniak  |
| 7:08:10 PM 2-May-23    | Delete Folder               | Success THEN                                                                                         | derek.joniak  |
| 7:08:10 PM 2-May-23    | Delete Folder-0019         | Success! %ProgramData%/_automation/AgentProcedure/EgnyteInstall folder has been removed.           | derek.joniak  |
| 7:08:08 PM 2-May-23    | Delete Folder-0013         | Directory %ProgramData%/_automation/AgentProcedure/EgnyteInstall is not empty, but recursive delete is enabled - removing... | derek.joniak  |
| 7:08:07 PM 2-May-23    | Delete Folder-0009         | %ProgramData%/_automation/AgentProcedure/EgnyteInstall folder exists.                              | derek.joniak  |
| 7:08:06 PM 2-May-23    | Delete Folder-0004         | Directory contains a /. This should be a Windows folder.                                           | derek.joniak  |
| 7:03:06 PM 2-May-23    | Egnyte - Install-0003      | Egnyte installed, waiting 5 minutes to prompt for reboot                                           | derek.joniak  |
| 7:02:47 PM 2-May-23    | Egnyte - Install-0003      | File Copied. Starting Installation.                                                                 | derek.joniak  |
| 7:02:10 PM 2-May-23    | Execute PowerShell Command   | Success THEN                                                                                         | derek.joniak  |
| 7:02:09 PM 2-May-23    | Execute PowerShell Command-0011 | PowerShell command completed!                                                                        | derek.joniak  |
| 7:02:07 PM 2-May-23    | Execute PowerShell Command-0011 | Executing PowerShell command to stop Office processes...                                            | derek.joniak  |
| 7:02:07 PM 2-May-23    | Execute PowerShell Command-0010 | Not sending output to variable.                                                                       | derek.joniak  |
| 7:02:07 PM 2-May-23    | Execute PowerShell Command-0008 | New command variable is set to stop Office processes.                                                | derek.joniak  |
| 7:02:07 PM 2-May-23    | Execute PowerShell Command-0008 | Custom commands detected to stop Office processes.                                                  | derek.joniak  |
| 7:01:59 PM 2-May-23    | Execute PowerShell Command-0002 | PowerShell is present.                                                                               | derek.joniak  |
| 7:01:56 PM 2-May-23    | Egnyte - Install-0003      | User selected Install Now.                                                                           | derek.joniak  |
| 7:01:48 PM 2-May-23    | Run Now - Egnyte - Install  | Admin derek.joniak scheduled procedure Run Now - Egnyte - Install to run at May 2, 2023, 8:01 PM  | derek.joniak  |

## Dependencies

The procedure requires the custom field to run: [Custom Field - Egnyte - Install](/docs/03f423c9-8538-42c0-9822-b7c92befb215)

## Output

Agent Logs
