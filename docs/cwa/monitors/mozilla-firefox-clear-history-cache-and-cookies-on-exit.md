---
id: e390206c-f761-4e46-8fa2-b323da583965
slug: /e390206c-f761-4e46-8fa2-b323da583965
title: 'Mozilla Firefox - Clear History, Cache, and Cookies on Exit'
title_meta: 'Mozilla Firefox - Clear History, Cache, and Cookies on Exit'
keywords: ['firefox', 'browsers', 'mozilla-firefox', 'history', 'cookies', 'cache']
description: 'This remote monitor automatically configures Mozilla Firefox to clear browsing history, cache, and cookies on exit by setting the appropriate registry keys for each installed browser.'
tags: ['browsers']
draft: false
unlisted: false
---

## Summary

This remote monitor automatically configures Mozilla Firefox to clear browsing history, cache, and cookies on exit by setting the appropriate registry keys for each installed browser.

**Note:**

- The changes will only take effect once the browser is restarted if it's currently open.
- If the PowerShell version on the machines is older than version 5, the remote monitor may not produce the expected outcomes.

## Details

**Suggested "Limit to"**: `Windows Computers`
**Suggested Alert Style**: `Once`
**Suggested Alert Template**: `Default - Do Nothing`

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|-------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | State Based | 604800 (Weekly) | **REDACTED** |

## Target

- Managed Windows Workstations and Servers

## Ticketing

**Ticket Subject:** `Mozilla Firefox Clear History on Exit - Failed on %CLIENTNAME%\%COMPUTERNAME%`

**Ticket Body:**

```PlainText
Failed to enable the clear history, cache, and cookies settings for %CLIENTNAME%\%COMPUTERNAME%. The script was unable to set the following registry keys:

%RESULT%

Manual investigation is required.
```

## Implementation

### Step 1

Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

### Step 2

Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Group ID(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```sql
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - Mozilla Firefox – Clear History, Cache, and Cookies on Exit' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Mozilla Firefox Clear History on Exit - Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~Successfully enabled the clear history, cache, and cookies settings for Mozilla Firefox on %CLIENTNAME%\\%COMPUTERNAME%.!!!Mozilla Firefox Clear History on Exit - Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~Failed to enable the clear history, cache, and cookies settings for %CLIENTNAME%\\%COMPUTERNAME%. The script was unable to set the following registry keys:

%RESULT%

Manual investigation is required.' as `AlertMessage`,
'0' as `ContactID`,
'604800' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = \'SilentlyContinue\';$browser=\'Mozilla Firefox\';$path=\'HKLM:\\SOFTWARE\\Policies\\Mozilla\\Firefox\\SanitizeOnShutdown\';$keys=@(\'Cache\',\'History\',\'Cookies\');function Find-Application{param([String]$Name);$uninstallPaths=@(\'HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\',\'HKLM:\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\');if(Get-ChildItem -Path $uninstallPaths|Get-ItemProperty|Where-Object{$_.DisplayName -match $Name}){$Name}else{$false}};$failures=@();function Set-RegValue{param([String]$Browser,[String]$Path,[String]$Reg,[String]$Value);if((Get-ItemProperty -Path $Path -ErrorAction SilentlyContinue).$Reg -ne $Value){try{Set-ItemProperty -Path $Path -Name $Reg -Value $Value -Force -ErrorAction Stop}catch{$failed=[PSCustomObject]@{Browser=$Browser;Path=$Path;Key=$Reg;Value=$Value};return $failed}}};if(Find-Application -Name $browser){if(!(Test-Path -Path $Path)){New-Item -Path $Path -Force -Confirm:$false|Out-Null};foreach($key in $keys){$failures+=Set-RegValue -Browser $browser -Path $path -Reg $key -Value 1}};if($failures){return ($failures|Format-List|Out-String)}"' as `DataOut`,
'16' as `Comparor`,
'10|(^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)|11|(^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)%7CBrowser|10|Browser' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
(UUID()) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Mozilla Firefox – Clear History, Cache, and Cookies on Exit')
```

### Step 3

An example of a query with a group ID:

```sql
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - Mozilla Firefox – Clear History, Cache, and Cookies on Exit' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Mozilla Firefox Clear History on Exit - Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~Successfully enabled the clear history, cache, and cookies settings for Mozilla Firefox on %CLIENTNAME%\\%COMPUTERNAME%.!!!Mozilla Firefox Clear History on Exit - Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~Failed to enable the clear history, cache, and cookies settings for %CLIENTNAME%\\%COMPUTERNAME%. The script was unable to set the following registry keys:

%RESULT%

Manual investigation is required.' as `AlertMessage`,
'0' as `ContactID`,
'604800' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = \'SilentlyContinue\';$browser=\'Mozilla Firefox\';$path=\'HKLM:\\SOFTWARE\\Policies\\Mozilla\\Firefox\\SanitizeOnShutdown\';$keys=@(\'Cache\',\'History\',\'Cookies\');function Find-Application{param([String]$Name);$uninstallPaths=@(\'HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\',\'HKLM:\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\');if(Get-ChildItem -Path $uninstallPaths|Get-ItemProperty|Where-Object{$_.DisplayName -match $Name}){$Name}else{$false}};$failures=@();function Set-RegValue{param([String]$Browser,[String]$Path,[String]$Reg,[String]$Value);if((Get-ItemProperty -Path $Path -ErrorAction SilentlyContinue).$Reg -ne $Value){try{Set-ItemProperty -Path $Path -Name $Reg -Value $Value -Force -ErrorAction Stop}catch{$failed=[PSCustomObject]@{Browser=$Browser;Path=$Path;Key=$Reg;Value=$Value};return $failed}}};if(Find-Application -Name $browser){if(!(Test-Path -Path $Path)){New-Item -Path $Path -Force -Confirm:$false|Out-Null};foreach($key in $keys){$failures+=Set-RegValue -Browser $browser -Path $path -Reg $key -Value 1}};if($failures){return ($failures|Format-List|Out-String)}"' as `DataOut`,
'16' as `Comparor`,
'10|(^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)|11|(^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)%7CBrowser|10|Browser' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
(UUID()) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (2,3,855,856)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Mozilla Firefox – Clear History, Cache, and Cookies on Exit')
```

### Step 4

Now execute your query from a RAWSQL monitor set.

### Step 5

Locate your remote monitor by opening the group(s) remote monitors tab.
