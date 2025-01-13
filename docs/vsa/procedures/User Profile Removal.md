---
id: 'ps-user-profile-removal'
title: 'User Profile Removal'
title_meta: 'User Profile Removal'
keywords: ['user', 'profile', 'removal', 'endpoint', 'script']
description: 'This document provides a detailed overview of a script that removes a user profile from an endpoint. It includes prompts for user confirmation and the username to remove, along with an example agent procedure log demonstrating the script in action.'
tags: ['configuration', 'windows', 'security', 'software', 'uninstallation']
draft: false
unlisted: false
---
## Summary

Removes a user profile from an endpoint.  
Prompts on run to allow user profile removal (y or n) and for the username to remove.  
Cannot remove the user profile of a currently logged in user. (See Agent Procedure Log below for an example of this.)

## Example Agent Procedure Log

| Time                  | Action                                         | Result                                                                                                                                                                                                                                            | User      |
|-----------------------|------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------|
| 8:41:43 am 1-Mar-23   | User Profile Removal                          | Success THEN                                                                                                                                                                                                                                     | dan.hicks |
| 8:41:43 am 1-Mar-23   | User Profile Removal-0004                    | ERROR: 2023-03-01 08:41:41 ERROR An error occurred when attempting to remove the user profile. Error: The process cannot access the file because it is being used by another process.                                                          | dan.hicks |
| 8:41:43 am 1-Mar-23   | User Profile Removal-0002                    | Log: 2023-03-01 08:41:33 INIT ----------------------------------------------- 2023-03-01 08:41:33 INIT Remove-UserProfile 2023-03-01 08:41:33 INIT System: DEV 2023-03-01 08:41:33 INIT User: DEV$ 2023-03-01 08:41:33 INIT OS Bitness: AMD64 2023-03-01 08:41:33 INIT PowerShell Bitness: 64 2023-03-01 08:41:33 INIT PowerShell Version: 5 2023-03-01 08:41:33 INIT ----------------------------------------------- 2023-03-01 08:41:33 LOG Checking if 'DEV//test1' is a local account. 2023-03-01 08:41:35 LOG Local account: True 2023-03-01 08:41:35 LOG Gathering profile data. 2023-03-01 08:41:35 LOG Removing local user account 'test1' 2023-03-01 08:41:35 LOG Removed local user account 'test1' 2023-03-01 08:41:35 LOG Beginning processing of profile 'C://Users//test1'. 2023-03-01 08:41:40 LOG Checking for profile CIM instance. 2023-03-01 08:41:41 LOG Removing profile CIM instance. 2023-03-01 08:41:41 ... | dan.hicks |
| 8:41:42 am 1-Mar-23   | User Profile Removal                          | Raw PS1 Data:                                                                                                                                                                                                                                     | dan.hicks |
| 8:41:42 am 1-Mar-23   | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                                                                                                                                                                     | dan.hicks |
| 8:41:42 am 1-Mar-23   | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server.                                                                                                             | dan.hicks |
| 8:41:28 am 1-Mar-23   | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "%ProgramData%//_automation//AgentProcedure//UserProfileRemoval//Remove-UserProfile.ps1 -Username test1" >"c://kworking//psoutputtmp.txt"                                          | dan.hicks |
| 8:41:28 am 1-Mar-23   | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                                                                                                                                                               | dan.hicks |
| 8:41:28 am 1-Mar-23   | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as %ProgramData%//_automation//AgentProcedure//UserProfileRemoval//Remove-UserProfile.ps1 -Username test1                                                                                                          | dan.hicks |
| 8:41:28 am 1-Mar-23   | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.                                                                                                                                                                                                          | dan.hicks |
| 8:41:22 am 1-Mar-23   | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                                                                                                                                                          | dan.hicks |
| 8:41:12 am 1-Mar-23   | Execute Powershell Command                     | Success THEN                                                                                                                                                                                                                                     | dan.hicks |
| 8:41:12 am 1-Mar-23   | Execute Powershell Command-0011                | Powershell command completed!                                                                                                                                                                                                                   | dan.hicks |
| 8:41:09 am 1-Mar-23   | Execute Powershell Command-0011                | Executing powershell "" -Command "New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name UserProfileRemoval" ""                                                                                                  | dan.hicks |
| 8:41:09 am 1-Mar-23   | Execute Powershell Command-0010                | Not sending output to variable.                                                                                                                                                                                                                 | dan.hicks |
| 8:41:09 am 1-Mar-23   | Execute Powershell Command-0008                | New command variable is: -Command "New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name UserProfileRemoval"                                                                                                     | dan.hicks |
| 8:41:09 am 1-Mar-23   | Execute Powershell Command-0008                | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name UserProfileRemoval                                                                                                            | dan.hicks |
| 8:41:03 am 1-Mar-23   | Execute Powershell Command-0002                | Powershell is present.                                                                                                                                                                                                                          | dan.hicks |
| 8:40:55 am 1-Mar-23   | Run Now - User Profile Removal                 | Admin dan.hicks scheduled procedure Run Now - User Profile Removal to run at Mar 1 2023 8:40AM                                                                                                                                               |           |

## Dependencies

[EPM - Accounts - Agnostic - Remove-UserProfile](https://proval.itglue.com/DOC-5078775-8475171)

## Output

AP Log



