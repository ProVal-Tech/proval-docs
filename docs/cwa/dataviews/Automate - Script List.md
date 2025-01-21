---
id: 'afe8b7a5-442c-415e-9a9a-32a10702c189'
title: 'Automate - Script List'
title_meta: 'Automate - Script List'
keywords: ['script', 'summary', 'dataview', 'logs', 'permissions', 'performance']
description: 'This document provides a detailed overview of a dataview that lists all scripts in the ConnectWise Automate environment, including their folder details, types, execution permissions, and performance metrics. It also summarizes script execution over a defined retention period.'
tags: ['performance', 'report', 'security', 'software']
draft: false
unlisted: false
---

## Summary

This dataview lists all scripts in the environment with details about their script folders, the types of scripts, any notes included, and which user classes may run and/or edit the script. Additionally, it **displays a summary of all scripts run over the set script log retention days.**

The script log retention days can be seen at the Automate location below:

![Script Log Retention Days](../../../static/img/Automate---Script-List/image_1.png)

## Columns

| Column                     | Description                                                                                                       |
|---------------------------|-------------------------------------------------------------------------------------------------------------------|
| ScriptID                  | Script ID (Hidden)                                                                                                 |
| Script Name               | The name of the script                                                                                            |
| Script Parent Folder      | Parent folder of the script (Hidden)                                                                             |
| Script Folder             | The full path to the folder containing the script                                                                 |
| Script Version            | Version of the script (Hidden)                                                                                    |
| Script GUID               | GUID of the script (Hidden)                                                                                      |
| Script Notes              | Script notes                                                                                                     |
| Script Client Only        | Whether it's a Client or a Computer script                                                                        |
| Execute Permissions       | Comma-separated list of user classes that can execute the script; `EveryOne` stands for all users with basic permission for scripts. |
| Edit Permissions          | Comma-separated list of user classes that can edit the script; `EveryOne` stands for all users with basic permission for scripts. |
| Total Runs                | Number of times the script ran                                                                                   |
| Failure                   | Number of times the script failed                                                                                 |
| Success                   | Number of times the script succeeded                                                                              |
| Effective Percent         | Effective percentage of success                                                                                    |
| Script Last Run           | The last run of the script                                                                                        |
| Days Since Last Run       | Number of days since the script was last executed                                                                |
| Ever Executed             | Has the script ever been executed (Yes/No)                                                                       |
| Script Performance         | Displays 'Poor' if the script's effectiveness is lower than 80% and has been executed at least once. This column is primarily used for conditional formatting and needs to be displayed for the formatting to work. |

## Sample Screenshot

![Sample Screenshot](../../../static/img/Automate---Script-List/image_2.png)



