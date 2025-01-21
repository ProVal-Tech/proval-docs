---
id: 'bef87782-0d9d-40f0-96c5-d30b589b57b4'
title: 'Detect Frequent Logon User (Set Computer Contact)'
title_meta: 'Detect Frequent Logon User (Set Computer Contact)'
keywords: ['loggedin', 'domain', 'users', 'automate', 'contact', 'windows', 'security']
description: 'This script gathers frequently logged-in domain users on workstations and associates the detected user as a contact in ConnectWise Automate. It analyzes the lsass.exe file to identify users, determines the most frequent user over a specified period, and updates the computer contact information accordingly.'
tags: ['active-directory', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script is designed to gather the frequently logged-in domain users on the workstations and set the associated contact to the computer in Automate.

It detects the users present at the **path C:/Windows/System32/lsass.exe**, which refers to a crucial system file in Microsoft Windows operating systems. Here’s what it does:

lsass.exe stands for Local Security Authority Subsystem Service.  
This file is a critical component of Microsoft Windows security policies, domain authentication, and Active Directory management on your computer.  
It is responsible for enforcing the security policy on the system, verifying users logging on to a Windows computer or server, handling password changes, and creating access tokens.

The user who was detected most in `@DaysToCheck@` is set as the Frequent user, and the script sets the corresponding contact to the computer associated in Automate.

## Sample Run

![Sample Run](../../../static/img/Detect-Frequent-Logon-User-(Set-Computer-Contact)/image_1.png)

## Variables

| Name             | Description                                                                                      |
|------------------|--------------------------------------------------------------------------------------------------|
| CurDate          | This stores the script run date in the format "yyyy-MM-dd HH:mm:ss".                          |
| LogonData        | This stores the frequently logged-on user's data. Example: "[LogonUserName=abc.xyz@test.com](mailto:LogonUserName%3Dabc.xyz@test.com)|LogonCount=3" |
| LogonUserName    | It stores the LogonUserName value from the LogonData after splitting it.                       |
| LogonCount       | It stores the LogonCount value from the LogonData after splitting it.                          |
| ContactIDCheck   | It stores the Contact ID of the detected LogonUserName to set that Contact ID as the associated contact of the computer. |

#### Global Parameters

| Name            | Example | Required | Description                                                                                   |
|-----------------|---------|----------|-----------------------------------------------------------------------------------------------|
| DaysToCheck     | 7       | True     | This determines how old event log data needs to be filtered to check the repetitive logged-on users list. By default, it is set to 7. |
| MoveAgentAllow  | 1 or 0  | False    | If it is set to 1, the agent can move to the locations allocated with the frequent logon user location ID from the contacts record. By default, it is set to 0, which doesn't allow the moving of the agents to the locations. |

## EDFs

| Name                      | Type     | Required | Not Editable (Manually) | Description                                                                                          |
|---------------------------|----------|----------|-------------------------|------------------------------------------------------------------------------------------------------|
| LogonUserCheckDate        | Computer | True     | True                    | This stores the script's last run date to collect the logon user details.                           |
| LogonUserInfo             | Computer | True     | True                    | This stores the LogonUserName and LogonCount details, separated by (---) for later reporting in the dataview. |

## Output

- Script log
- EDFs
- Dataview



