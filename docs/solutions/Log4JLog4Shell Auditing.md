---
id: 'cwa-log4shell-vulnerabilities'
title: 'Log4Shell Vulnerabilities in Automate Agents'
title_meta: 'Log4Shell Vulnerabilities in Automate Agents'
keywords: ['log4shell', 'vulnerabilities', 'automate', 'agents', 'security']
description: 'This document provides an overview of potential Log4Shell vulnerabilities and the associated risks to Automate agents. It includes links to various resources such as custom tables, dataviews, and scripts that facilitate the identification and remediation of these vulnerabilities.'
tags: ['security', 'vulnerability', 'automate', 'script', 'dataview', 'custom', 'endpoint', 'protection']
draft: false
unlisted: false
---
## Purpose

To present information about possible Log4Shell vulnerabilities and attacks on Automate agents.

## Associated Content

| Content                                                                                                           | Type         | Function                                                                                                           |
|-------------------------------------------------------------------------------------------------------------------|--------------|--------------------------------------------------------------------------------------------------------------------|
| [SEC - Endpoint Protection - Custom Table - plugin_proval_log4jsoftwarelist](https://proval.itglue.com/DOC-5078775-8856668) | Custom Table | Stores scraped data from [this repo](https://raw.githubusercontent.com/NCSC-NL/log4shell/main/software/README.md). |
| [SEC - Endpoint Protection - Dataview - Log4J - Log4Shell - Possible Vulnerabilities](https://proval.itglue.com/DOC-5078775-8856667) | Dataview    | Displays possible discovered software that is vulnerable.                                                         |
| [SEC - Endpoint Protection - Script - Import Log4Shell Table](https://proval.itglue.com/DOC-5078775-8855626) | Script       | Wraps the Import-Log4JTable agnostic script.                                                                     |
| [SEC - Endpoint Protection - Agnostic - Import-Log4JTable](https://proval.itglue.com/DOC-5078775-8854610) | Agnostic     | Scrapes data from [this repo](https://raw.githubusercontent.com/NCSC-NL/log4shell/main/software/README.md) and stores it in a custom table. |
| [SEC - Endpoint Protection - Script - Log4J (Log4Shell) File Scan](https://proval.itglue.com/DOC-5078775-8881631) | Script       | This script is used to scan for possible vulnerabilities in a target system, saving information to EDFs for reporting. |
| [SEC - Endpoint Protection - Dataview - Log4J - Log4Shell - Detections](https://proval.itglue.com/DOC-5078775-8886309) | Dataview    | Displays information about the EDFs filled by [SEC - Endpoint Protection - Script - Log4J (Log4Shell) File Scan](https://proval.itglue.com/DOC-5078775-8881631). These EDFs indicate vulnerability information about the Log4J/Log4Shell exploit. |
| [CWM - Automate - Script - Log4J Remediation Residue Removal](https://proval.itglue.com/DOC-5078775-16162268) | Script       | Removes the residuals left by the [Log4J (Log4Shell) File Scan](https://proval.itglue.com/DOC-5078775-8881631) script including the `Everything` service. |

