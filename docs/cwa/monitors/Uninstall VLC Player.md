---
id: 'fbb859fd-ac3c-4cab-9460-6d5260edf65e'
title: 'Uninstall VLC Player via ConnectWise Automate'
title_meta: 'Uninstall VLC Player via ConnectWise Automate'
keywords: ['uninstall', 'vlc', 'connectwise', 'monitor', 'ticket']
description: 'This document provides a step-by-step guide on how to uninstall VLC Player using ConnectWise Automate. It includes instructions for setting up the necessary scripts and alert templates, obtaining group IDs, and executing the SQL query to create a remote monitor that handles ticket creation for the uninstallation process.'
tags: ['connectwise', 'software', 'uninstallation']
draft: false
unlisted: false
---
## Step 1
Ensure the presence of [CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>) script and `△ Custom - Ticket Creation - Computer` alert template.

## Step 2
Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

## Step 3
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Groupid(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Dev - Uninstall VLC Player' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'VLC Removal Failed - %COMPUTERNAME%~~~Successfully removed VLC Player!!!VLC Removal Failed - %COMPUTERNAME%~~~Failed to remove VLC Player for %COMPUTERNAME%. Please review.' as `AlertMessage`,
'0' as `ContactID`,
'604800' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command "$US = (Get-ChildItem -Path HKLM://SOFTWARE//Microsoft//Windows//CurrentVersion//Uninstall, HKLM://SOFTWARE//Wow6432Node//Microsoft//Windows//CurrentVersion//Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -Match /'VLC Media Player/' }).UninstallString; if($US) { foreach ($U in $US) {cmd.exe /c $U /S /V /qn }; $US = (Get-ChildItem -Path HKLM://SOFTWARE//Microsoft//Windows//CurrentVersion//Uninstall, HKLM://SOFTWARE//Wow6432Node//Microsoft//Windows//CurrentVersion//Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -Match /'VLC Media Player/' }).UninstallString; if($US) { return /'Failed to remove VLC./' } else {return /'Successfully removed VLC./'}} else {return /'VLC player is not installed./'}"' as `DataOut`,
'9' as `Comparor`,
'Failed to remove VLC' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
CONCAT(
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Dev - Uninstall VLC Player')
```

## Step 4
An example of a query with a groupid:

```
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Dev - Uninstall VLC Player' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'VLC Removal Failed - %COMPUTERNAME%~~~Successfully removed VLC Player!!!VLC Removal Failed - %COMPUTERNAME%~~~Failed to remove VLC Player for %COMPUTERNAME%. Please review.' as `AlertMessage`,
'0' as `ContactID`,
'604800' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command "$US = (Get-ChildItem -Path HKLM://SOFTWARE//Microsoft//Windows//CurrentVersion//Uninstall, HKLM://SOFTWARE//Wow6432Node//Microsoft//Windows//CurrentVersion//Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -Match /'VLC Media Player/' }).UninstallString; if($US) { foreach ($U in $US) {cmd.exe /c $U /S /V /qn }; $US = (Get-ChildItem -Path HKLM://SOFTWARE//Microsoft//Windows//CurrentVersion//Uninstall, HKLM://SOFTWARE//Wow6432Node//Microsoft//Windows//CurrentVersion//Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -Match /'VLC Media Player/' }).UninstallString; if($US) { return /'Failed to remove VLC./' } else {return /'Successfully removed VLC./'}} else {return /'VLC player is not installed./'}"' as `DataOut`,
'9' as `Comparor`,
'Failed to remove VLC' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
CONCAT(
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (2,856)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Dev - Uninstall VLC Player')
```

## Step 5
Now execute your query from a RAWSQL monitor set.

## Step 6
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the `△ Custom - Ticket Creation - Computer` alert template.












