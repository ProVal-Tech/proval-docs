---
id: '1e8cbc91-0ac5-4b80-b2bd-0b876528148e'
slug: /1e8cbc91-0ac5-4b80-b2bd-0b876528148e
title: 'Add Domain Group to Local Administrator'
title_meta: 'Add Domain Group to Local Administrator'
keywords: ['connectwise', 'ticket', 'creation', 'computer', 'groupid', 'alert', 'template', 'monitor']
description: 'This document provides a step-by-step guide for setting up a ticket creation system in ConnectWise Automate for computers. It covers the installation of necessary scripts, obtaining group IDs, and executing SQL queries to automate ticket creation when certain conditions are met.'
tags: ['database', 'setup']
draft: false
unlisted: false
---

## Step 1
Ensure the presence of the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script and the `△ Custom - Ticket Creation - Computer` alert template.

---

## Step 2
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

---

## Step 3
Copy the following query and replace '**YOUR COMMA SEPARATED LIST OF GROUPID(S)**' with the group ID(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Client Specific - Add Domain Group to Local Administrators' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Failed to Add Domain Group to Local Administrators~~~Successfully Added Domain Group HEIDOMAIN\\ITPcSupport to local administrators.!!!Failed to Add Domain Group to Local Administrators~~~Failed to add Domain Group HEIDOMAIN\\ITPcSupport to local administrators for %COMPUTERNAME%. 
Reason: %RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'604800' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command \"$Admin = Net localGroup Administrators; if ( !($Admin -match \'HEIDOMAIN.ITPcSupport\') ) {net localgroup administrators HEIDOMAIN\\ITPcSupport /Add /y} else {return \'The command completed successfully.\'}"' as `DataOut`,
'10' as `Comparor`,
'The command completed successfully.' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (**YOUR COMMA SEPARATED LIST OF GROUPID(S)**)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Client Specific - Add Domain Group to Local Administrators')
```

---

## Step 4
An example of a query with a group ID:

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Client Specific - Add Domain Group to Local Administrators' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Failed to Add Domain Group to Local Administrators~~~Successfully Added Domain Group HEIDOMAIN\\ITPcSupport to local administrators.!!!Failed to Add Domain Group to Local Administrators~~~Failed to add Domain Group HEIDOMAIN\\ITPcSupport to local administrators for %COMPUTERNAME%. 
Reason: %RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'604800' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command \"$Admin = Net localGroup Administrators; if ( !($Admin -match \'HEIDOMAIN.ITPcSupport\') ) {net localgroup administrators HEIDOMAIN\\ITPcSupport /Add /y} else {return \'The command completed successfully.\'}"' as `DataOut`,
'10' as `Comparor`,
'The command completed successfully.' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (2,3)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Client Specific - Add Domain Group to Local Administrators')
```

---

## Step 5
Now execute your query from a RAWSQL monitor set.

---

## Step 6
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the `△ Custom - Ticket Creation - Computer` alert template.
