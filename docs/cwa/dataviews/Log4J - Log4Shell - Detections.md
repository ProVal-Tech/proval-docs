---
id: '59595d20-d1f8-4406-b574-58a4d32b0384'
title: 'EDF Log4J Vulnerability Report'
title_meta: 'EDF Log4J Vulnerability Report'
keywords: ['edf', 'log4j', 'vulnerability', 'scan', 'security']
description: 'This document provides a comprehensive overview of the EDFs filled by the SEC - Endpoint Protection - Script - Log4J (Log4Shell) File Scan, detailing vulnerability information related to the Log4J/Log4Shell exploit and the results of the scans conducted.'
tags: ['report', 'security', 'vulnerability']
draft: false
unlisted: false
---

## Summary

This document displays information about the EDFs filled by the [SEC - Endpoint Protection - Script - Log4J (Log4Shell) File Scan](<../scripts/Log4J (Log4Shell) File Scan.md>). These EDFs indicate vulnerability information about the Log4J/Log4Shell exploit.

## Dependencies

- [SEC - Endpoint Protection - Script - Log4J (Log4Shell) File Scan](<../scripts/Log4J (Log4Shell) File Scan.md>)

## Columns

| Column                       | Description                                                         |
|------------------------------|---------------------------------------------------------------------|
| Client                       | The client of the displayed computer.                               |
| ComputerID                   | The ID of the displayed computer.                                   |
| Computer                     | The name of the displayed computer.                                 |
| Last Scan                    | The last time that a scan was performed.                           |
| Attack Attempts Detected      | True if the YARA scan detected attack attempts; otherwise, False.   |
| Vulnerable Files Present      | True if vulnerable files were detected; otherwise, False.           |
| Vulnerable Libraries Present   | True if the Luna scan detected vulnerable libraries; otherwise, False. |
| Log Location                 | The location on the computer of the script log file.               |
| YARA Log Location            | The location on the computer of the YARA log file.                 |
| Luna Log Location            | The location on the computer of the Luna log file.                 |
