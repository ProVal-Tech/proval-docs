---
id: ps-get-gpresult
title: 'Get-GPResult'
title_meta: 'Get-GPResult Command'
keywords: ['gpresult', 'gpo', 'report', 'rsop']
description: 'Documentation for the Get-GPResult command to generate GPRESULT data in various forms.'
tags: ['report', 'windows']
draft: false
unlisted: false
---
## Description
Generates GPRESULT data in various forms.

## Requirements
PowerShell v5

## Usage
The script has various "report modes" that can be invoked at the same time. This is done by passing a `string[]` to the `-ReportType` parameter.

### General Process

#### User Section
1. If the `-ExcludeUser` switch is set, then the User Section is skipped.
2. The script will first attempt to find a non-local user account profile that has logged into the machine before.
    - If a non-local user account cannot be found, then the User Section will be skipped.
3. Uses the discovered user to execute `gpresult.exe /SCOPE USER /USER \<DiscoveredUsername>` to output the requested report type(s).

#### Computer Section
1. If the `-ExcludeComputer` switch is set, then the Computer Section is skipped.
2. Executes `gpresult.exe /SCOPE COMPUTER` to output the requested report type(s).

### XML Mode (`-ReportType "XML"`)
In XML mode, the following commands are run to export the reports:

`gpresult.exe /SCOPE USER /USER \<DiscoveredUsername> /X "$Path\gpresult_user.xml" /F`
`gpresult.exe /SCOPE COMPUTER /X "$Path\gpresult_computer.xml" /F`

### HTML Mode (`-ReportType "HTML"`)
In HTML mode, the following commands are run to export the reports:
`gpresult.exe /SCOPE USER /USER \<DiscoveredUsername> /H "$Path\gpresult_user.html" /F`
`gpresult.exe /SCOPE COMPUTER /H "$Path\gpresult_computer.html" /F`

### RSOP Mode (`-ReportType "RSOP"`)
In RSOP mode, the following commands are run to export the reports:
    
`gpresult.exe /SCOPE USER /USER \<DiscoveredUsername> /R`

`gpresult.exe /SCOPE COMPUTER /R`

Additionally, if the `-VerboseRSOP` switch is specified, then a `/V` is appended to the command.

If the `-SuperVerboseRSOP` switch is specified, then a `/Z` is appended to the command. This supersedes the `-VerboseRSOP` switch if both are specified.

Standard output of the commands are redirected to `$Path\gpresult_user.txt` and `$Path\gpresult_computer.txt`. 

### PSObject Mode (`-ReportType "PSObject"`)
In PSObject mode, a PSObject array of GPOs is output in lieu of a standard report. However, PSObject Mode is dependent on an XML report, so if it is not called alongside the XML Mode, then the XML Mode logic will be invoked. The properties of the PSObject is as follows:

    [string]Type = The type of GPO. (User or Computer)
    [string]Principal = The name of the principal to which the GPO is applied. (Username of the user or name of the computer.)
    [string]Domain = The domain of the GPO (if applicable)
    [string]SOM = The scope of management of the GPO.
    [string]Name = The name of the GPO.
    [bool]Enabled = Shows the enabled status of the GPO. (True/False)
    [bool]IsValid = Shows the validity of the GPO. (True/False)
    [bool]AccessDenied = Shows if access was denied to the principal for this GPO. (True/False)
    [string[]]SecurityFilter = List of applied security filters applicable to this GPO.

The PSObject array will be returned by the cmdlet.

### SQL Mode (`-ReportType "SQL"`)
In SQL mode, the same logic from PSObject mode applies, however instead of returning an array of PSObjects, an `INSERT` statement is returned with two placeholders for the receiving process to replace. The statement will be in the following format:

`INSERT INTO \<tablename> VALUES (\<idvalue>, '$($gpo.Type)', '$($gpo.Principal)', '$($gpo.Domain)', '$($gpo.SOM)', '$($gpo.Name)', $($gpo.Enabled), $($gpo.IsValid), '$($gpo.SecurityFilter -join ',')'), (\<idvalue>, ...), (\<idvalue>, ...)`

The placeholders are made as generic as possible to facilitate compatibility with various SQL engines. If both the `PSObject` and `SQL` report types are requested, then the `SQL` report will supersede the `PSObject` report.

The SQL will be output to the calling process as a string and to the file `$Path\gpresult.sql`.


Generates .xml and .txt GPRESULT reports for the computer and detected user. RSOP (.txt) report will be of the "super verbose" variety.

```powershell
.\Get-GPResult.ps1 -ReportType XML,RSOP -SuperVerboseRSOP
```

Generates .html and .xml GPRESULT reports for the computer to "C:\temp\gpresult_computer.*". User reports will not be generated.

```powershell
.\Get-GPResult -ReportType HTML,XML -Path "C:\temp" -ExcludeUser
```

Saves GPRESULT objects for the user to `$reportOutput`. Computer reports will not be generated.

```powershell
$reportOutput = .\Get-GPResult.ps1 -ReportType PSObject -ExcludeComputer
```

## Parameters
| Parameter             | Alias | Required  | Default      | Type          | Description                                                                                     |
| -----------------     | ----- | --------- | ---------    | ---------     | -----------------------------------------                                                       |
| `-ReportType`         |       | True      |              | String[]      | The type of reports to generate. Valid options are "XML", "HTML", "RSOP", "PSObject", and "SQL" |
| `-Path`               |       | False     |              | String        | The folder to save the reports to. Defaults to the location of the script.                      |
| `-ExcludeUser`        |       | False     | cd of script | Switch (Bool) | Pass this switch to exclude GPRESULT user reporting.                                            |
| `-ExcludeComputer`    |       | False     |              | Switch (Bool) | Pass this switch to exclude GPRESULT computer reporting.                                        |
| `-VerboseRSOP`        |       | False     |              | Switch (Bool) | Pass this switch to include "verbose" style logs when running in RSOP mode.                     |
| `-SuperVerboseRSOP`   |       | False     |              | Switch (Bool) | Pass this switch to include "super verbose" style logs when running in RSOP mode.               |

## Output

### All Modes
    ./Get-GPResult-log.txt
    ./Get-GPResult-error.txt

### XML Mode
    ./gpresult_computer.xml
    ./gpresult_user.xml

### HTML Mode
    ./gpresult_computer.html
    ./gpresult_user.html

### RSOP Mode
    ./gpresult_computer.txt
    ./gpresult_user.txt

### PSObject Mode
    ./gpresult_computer.xml
    ./gpresult_user.xml
    Cmdlet returns a PSObject representation of the two XML reports.

### SQL Mode
    ./gpresult_computer.xml
    ./gpresult_user.xml
    ./gpresult.sql
    Returns a simple INSERT statement string with `tablename` and `idvalue` placeholders that can be replaced.









