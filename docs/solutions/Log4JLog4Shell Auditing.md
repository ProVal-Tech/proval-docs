---
id: 'a341f9a4-e07e-4417-84fb-06162d7fb52b'
title: 'Log4Shell Vulnerabilities in Automate Agents'
title_meta: 'Log4Shell Vulnerabilities in Automate Agents'
keywords: ['log4shell', 'vulnerabilities', 'automate', 'agents', 'security']
description: 'This document provides an overview of potential Log4Shell vulnerabilities and the associated risks to Automate agents. It includes links to various resources such as custom tables, dataviews, and scripts that facilitate the identification and remediation of these vulnerabilities.'
tags: ['security', 'vulnerability']
draft: false
unlisted: false
---

## Purpose

To present information about possible Log4Shell vulnerabilities and attacks on Automate agents.

## Associated Content

| Content                                                                                                           | Type         | Function                                                                                                           |
|-------------------------------------------------------------------------------------------------------------------|--------------|--------------------------------------------------------------------------------------------------------------------|
| [SEC - Endpoint Protection - Custom Table - plugin_proval_log4jsoftwarelist](<../cwa/tables/plugin_proval_log4jsoftwarelist.md>) | Custom Table | Stores scraped data from [this repo](https://raw.githubusercontent.com/NCSC-NL/log4shell/main/software/README.md). |
| [SEC - Endpoint Protection - Dataview - Log4J - Log4Shell - Possible Vulnerabilities](<../cwa/dataviews/Log4J - Log4Shell - Possible Vulnerabilities.md>) | Dataview    | Displays possible discovered software that is vulnerable.                                                         |
| [SEC - Endpoint Protection - Script - Import Log4Shell Table](<../cwa/scripts/Import Log4Shell Table.md>) | Script       | Wraps the Import-Log4JTable agnostic script.                                                                     |
| [SEC - Endpoint Protection - Agnostic - Import-Log4JTable](<../powershell/Import-Log4JTable.md>) | Agnostic     | Scrapes data from [this repo](https://raw.githubusercontent.com/NCSC-NL/log4shell/main/software/README.md) and stores it in a custom table. |
| [SEC - Endpoint Protection - Script - Log4J (Log4Shell) File Scan](<../cwa/scripts/Log4J (Log4Shell) File Scan.md>) | Script       | This script is used to scan for possible vulnerabilities in a target system, saving information to EDFs for reporting. |
| [SEC - Endpoint Protection - Dataview - Log4J - Log4Shell - Detections](<../cwa/dataviews/Log4J - Log4Shell - Detections.md>) | Dataview    | Displays information about the EDFs filled by [SEC - Endpoint Protection - Script - Log4J (Log4Shell) File Scan](<../cwa/scripts/Log4J (Log4Shell) File Scan.md>). These EDFs indicate vulnerability information about the Log4J/Log4Shell exploit. |
| [CWM - Automate - Script - Log4J Remediation Residue Removal](<../cwa/scripts/Log4J Remediation Residue Removal.md>) | Script       | Removes the residuals left by the [Log4J (Log4Shell) File Scan](<../cwa/scripts/Log4J (Log4Shell) File Scan.md>) script, including the `Everything` service. |
