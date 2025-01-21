---
id: '71ac312f-e490-4126-bc2d-f9c07f5582cf'
title: 'Get - CW-ControlAPI - Online Status'
title_meta: 'Get - CW-ControlAPI - Online Status'
keywords: ['connectwise', 'control', 'status', 'script', 'automation']
description: 'The EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status script is designed to fetch the online status of all machines in the ConnectWise Control application, utilizing the ProVal Tech agnostic script Get-CWControlAgentSession.ps1. It queries the Control session using the Control Plugin in Automate and stores the information in a custom table for further monitoring and reporting.'
tags: ['connectwise', 'database', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

The EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status script is a ConnectWise Automate script designed to fetch the online status of all machines in the ConnectWise Control application. To achieve this, the script utilizes the ProVal Tech agnostic script Get-CWControlAgentSession.ps1, which is intended to run only in Automate environments. The script queries the Control session using the Control Plugin in Automate as its jump point.

The purpose of the EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status script is to return the online status of all machines in Control and insert those states into a custom table named `plugin_proval_control_session_status`. The information that the script collects is stored in the Automate database and is used by other scripts and monitors to determine the state of the machines in the ConnectWise environment.

## Requirements

1. ConnectWise Control must have the Automate extension installed and configured properly.
2. ConnectWise Automate must have the ConnectWise Control plugin installed and configured properly.

## Sample Run

**Intended Target:** Any Windows machine. It is suggested to schedule the script to run twice per day against the Automate server if possible; otherwise, it can be scheduled against any Windows machine.

![Sample Run](../../../static/img/Get---CW-ControlAPI---Online-Status/image_1.png)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name            | Description                                                                  |
|-----------------|------------------------------------------------------------------------------|
| TableName       | The name of the new table that will be created if it does not exist.       |
| Server          | The queried server from the ConnectWise Control plugins configuration table.|
| Token           | The queried API key from the ConnectWise Control plugins configuration table.|
| IncludeProperty  | The additional included item from the API call query set to Name.          |

## Output

- Script log
- Custom Table



