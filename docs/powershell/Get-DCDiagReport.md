---
id: ps-get-dcdiagreport
title: 'Get-DCDiagReport'
title_meta: 'Get-DCDiagReport Command'
keywords: ['dcdiag', 'domain', 'controller', 'report']
description: 'Documentation for the Get-DCDiagReport command to run advanced diagnostics on a domain controller and generate various report formats.'
tags: ['active-directory', 'report', 'windows']
draft: false
unlisted: false
---

## Description
This is an advanced version of DCDiag. It offers all the options available with the dcdiag application, along with some minor enhancements and changes. DCDiag can output a TXT log file, export to XLS or XML, or return an object. This script can export to CSV, XML, HTML, JSON, and TXT, as well as return an object if desired.

## Requirements
Must be run on a domain controller.

```powershell
.\Get-DCDiagReport.ps1 [ [-n \<NamingContext> -Skip \<TestName>,\<TestName>,...] | [-test \<TestName>,\<TestName>,...] | [-c -Skip \<TestName>,\<TestName>,...] ] [-a] [-i] [-e] [q] [s] [-Fix] [-BaseName \<LogFileName> [-ReportPath \<System.IO.Directory>] [-CSV -XML -HTML -JSON ]]
```

## Parameters
| Parameter              | Alias | Required                            | Default                 | Type                | Description                                                                                    |
| ---------------------- | ----- | ----------------------------------- | ----------------------- | ------------------- | ---------------------------------------------------------------------------------------------- |
| `NamingContext`        | `n`   | False                               |                         | String              | Specify target domains in NetBIOS, Domain Name System (DNS), or distinguished name format.     |
| `AllSiteServers`       | `a`   | False                               |                         | Switch              | Target all servers in the current site.                                                        |
| `AllEnterpriseServers` | `e`   | False                               |                         | Switch              | Target all servers in the enterprise.                                                          |
| `Ignore`               | `i`   | False                               |                         | Switch              | Ignore all superfluous error messages.                                                         |
| `Quiet`                | `q`   | False                               |                         | Switch              | Suppress all non-error console output.                                                         |
| `Comprehensive`        | `c`   | False                               |                         | Switch              | Runs all tests except DCPromo and RegisterInDNS, including non-default tests.                  |
| `Fix`                  |       | False                               |                         | Switch              | Fix the Service Principal Names (SPNs) on the Machine Account object of the domain controller. |
| `BaseName`             |       | True for export parameter set names | (hostname)-dcdiag       | String              | Sets the Basename of any created report file.                                                  |
| `ReportPath`           |       | False                               | Script parent directory | System.IO.Directory | Sets the path to export the report to. Defaults to the current script working directory.       |
| `CSV`                  |       | False                               |                         | Switch              | Designates a report file type of .CSV.                                                         |
| `XML`                  |       | False                               |                         | Switch              | Designates a report file type of .XML.                                                         |
| `HTML`                 |       | False                               |                         | Switch              | Designates a report file type of .HTML.                                                        |
| `JSON`                 |       | False                               |                         | Switch              | Designates a report file type of .JSON.                                                        |
| `Test`                 |       | Semi                                |                         | String[]            | Run specific tests.                                                                            |
| `Skip`                 |       | Semi                                |                         | String[]            | Run all tests except specific tests.                                                           |

## Output
```
.\Get-DCDiagReport-log.txt
.\Get-DCDiagReport-error.txt
\<Specified Log File Path and fileName>
```
