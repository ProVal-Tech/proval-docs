---
id: ps-join-domain
title: 'Join-Domain'
title_meta: 'Join-Domain Command'
keywords: ['join', 'domain', 'online', 'offline']
description: 'Documentation for the Join-Domain command to join a computer to a domain using either online or offline methods.'
tags: ['active-directory', 'configuration', 'windows']
draft: false
unlisted: false
---
## Description
Joins a domain using online method or offline method.

## Usage
1. If DJoinFilePath was not provided, run the online domain join command.
2. If DJoinFilePath was provided, verify that the target is not a member of a domain already, if it is error and exit, if not run the offline domain join procedure.


1. Online Method.
```powershell
.\Join-Domain.ps1 -DomainName ProvalDev.local -Credential $Credential
```
        Note 1 : Create a credential object saved as $Credential, or any other variable name then run this script using that credential variable.

        This command will use the online join method to join a target computer to the provided domain.

        This command will not remove a currently joined computer from the domain it is currently joined to.

2. Offline Method
```powershell
.\Join-Domain.ps1 -DJoinFilePath c:\somewhere\somewhereelse\Dev-Win10-2-offlineJoin.txt
```
        Note 1 : You will need to run the New-DJoinFile.ps1 script on the domain controller first to obtain the necessary .txt file.
        STEP 1 - On the Domain Controller run
        PS C:\> New-DJoinFile.ps1 -TargetName Dev-Win10-2
        This script will create the offline join .txt file used to complete the offline join method.
        STEP 2 - Get the created file from the Domain controller and upload it to the target machine.
        STEP 3 - Run Join-Domain.ps1 on the target machine with the following triggers.
        PS C:\> Join-Domain.ps1 -DJoinFilePath c:\somewhere\somewhereelse\Dev-Win10-2-offlineJoin.txt
        This command will use the provided .txt file to offline join the computer to the requested Domain.




## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `DomainName`      |       | False     |           | String    |  Required for online join method, this variable designates the domain in which you would like to join.                                         |
| `DJoinFilePath`   |       | False     |           | System.IO.FileInfo    |  A validated system path, that must be a file with a .txt extension.     |
| `Credential`      |       | True      |           | PSCredential |  Required for online join method, this variable designates the domain credentials necessary to join the computer to the domain.                                         |


## Output
   
    Console - domain join results, or nothing on error.
    .\Join-Domain-log.txt
    .\Join-Domain-error.txt




