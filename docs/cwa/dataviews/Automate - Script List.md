---
id: 'cwa-script-summary'
title: 'Script Summary DataView'
title_meta: 'Script Summary DataView for ConnectWise Automate'
keywords: ['script', 'summary', 'dataview', 'logs', 'permissions', 'performance']
description: 'This document provides a detailed overview of a dataview that lists all scripts in the ConnectWise Automate environment, including their folder details, types, execution permissions, and performance metrics. It also summarizes script execution over a defined retention period.'
tags: ['configuration', 'performance', 'report', 'software', 'security']
draft: false
unlisted: false
---
## Summary

This dataview will list all scripts in the environment with details about their script folders, the type of scripts, any notes included, and which user classes may run and/or edit the script. Additionally, **displays a summary of all scripts run over the set script log retention days.**

The Script log retention days can be seen at the automate location below:

![Script Log Retention Days](5078775/docs/8197426/images/16674043)

## Columns

| Column                     | Description                                                                                                       |
|---------------------------|-------------------------------------------------------------------------------------------------------------------|
| ScriptID                  | Scriptid (Hidden)                                                                                                 |
| Script Name               | The name of the script                                                                                            |
| Script Parent Folder      | Parent folder of the script (Hidden)                                                                             |
| Script Folder             | The full path to the folder containing the script                                                                 |
| Script Version            | Version of the script (Hidden)                                                                                    |
| Script GUID               | GUID of the script (Hidden)                                                                                      |
| Script Notes              | Script Notes                                                                                                     |
| Script Client Only        | Whether it's a Client or a Computer script                                                                        |
| Execute Permissions        | Comma Separated List of User Classes that can execute the script, `EveryOne` stands for all users with the basic permission of scripts. |
| EditPermissions           | Comma Separated List of User Classes that can execute the script, `EveryOne` stands for all users with the basic permission of scripts. |
| Total Runs                | Number of times it ran                                                                                            |
| Failure                   | Number of times it Failed                                                                                         |
| Success                   | Number of times it Succeed                                                                                        |
| Effective Percent         | Effective percent of Success                                                                                      |
| Script Last Run           | This shows the last run of the script                                                                             |
| Days Since Last Run      | Number of Days since script executed the last time ever                                                          |
| Ever Executed             | Does the script ever executed (Yes/No)                                                                           |
| Script Performance         | Displays 'Poor' if the script's effectiveness is lower than 80% and has been executed at least once. This column is primarily used for conditional formatting and needs to be displayed for the formatting to work. |

## Sample Screenshot

![Sample Screenshot](5078775/docs/8197426/images/18281992)

