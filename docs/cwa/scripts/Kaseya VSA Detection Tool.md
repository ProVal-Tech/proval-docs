---
id: 'cwa-vulnerability-scan'
title: 'VSA Vulnerability Scan Script'
title_meta: 'VSA Vulnerability Scan Script'
keywords: ['vulnerability', 'scan', 'vsa', 'server', 'audit']
description: 'This document provides details about a script that performs a vulnerability scan on a Kaseya VSA server, logging the output to a dependent dataview. It includes a summary of the script's functionality, sample run images, dependencies, and the processes involved in detecting vulnerabilities.'
tags: ['security', 'scan', 'vsa', 'log', 'audit', 'output']
draft: false
unlisted: false
---
## Summary

This script will perform the vulnerability scan on VSA server and log output to dependent dataview.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\Kaseya-VSA-Detection-Tool\image_1.png)

## Dependencies

[Kaseya Vulnerability Audit](https://proval.itglue.com/DOC-5078775-7836236)

#### Script States

| Name                     | Example               | Description                                                                                       |
|--------------------------|-----------------------|---------------------------------------------------------------------------------------------------|
| VSAEndpointDetection      | safe -- %shellresult% | This will store the script output and comparative status whether server is vulnerable or safe.   |

## Process

- This script will detect the suspicious certificate check, suspicious executable check, suspicious file reference check, scan indicates intrusion risk and malicious file check and report everything to the dataview.
- This should be target to VSA server only.

## Output

- Script log
- Script state
- Dataview



