---
id: ps-get-groupmembers
title: 'Get-GroupMembers'
title_meta: 'Get-GroupMembers Command'
keywords: ['groups', 'members', 'local', 'ad', 'azuread']
description: 'Documentation for the Get-GroupMembers command to return all groups and their members for a local system, Active Directory, or Azure Active Directory.'
tags: ['active-directory', 'configuration', 'security']
draft: false
unlisted: false
---
## Description
One Script that can return all groups and their members for a local system, or active directory, or Azure Active Directory.

## Requirements
Azure Active Directory connection requires an Azure Active Directory Access Token assigned in Microsoft Graph

## Usage
1. If you are querying Azure Active Directory and do not provide an AadAccessToken, return an error.  Otherwise, install the AzureAD module and connect to Azure Active directory.
2. Switch the query commands based on the -Platform provided to get the groups and their members added to the return object.
3. If Querying Azure Active Directory close the connection.
4. Return any found items.



```powershell
.\Get-GroupMembers.ps1
```
The same as Get-GroupMembers.ps1 -Platform Local
Returns a system object of all local computer groups and all members of those groups.

```powershell
.\Get-GroupMembers.ps1 -Platform AD
```
Returns a system object of all Active Directory groups and all members of those groups.

```powershell
.\Get-GroupMembers.ps1 -Platform AzureAD -AadAccessToken '78943hgjfdku89zbhjksuyfb897df9hjke#@$gdfjio'
```
Returns a system object of all Azure Active Direcory groups and all members of those groups.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Platform`        |       | False     | Local     | String    | Determines the target group type (local, AD, or AzureAD)                                           |
| `AadAccessToken`  |       | False     |           | String    | The Azure Active Directory Access Token from Microsoft Graph, which is required if querying Azure AD                                          |

## Output

[System.Object]
Formatted as 
Group     /      Members