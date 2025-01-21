---
id: '765eb6aa-cc3a-471e-b11e-d7d8e1972e11'
title: 'VSA Vulnerability Scan Script'
title_meta: 'VSA Vulnerability Scan Script'
keywords: ['vulnerability', 'scan', 'vsa', 'server', 'audit']
description: 'This document provides details about a script that performs a vulnerability scan on a Kaseya VSA server, logging the output to a dependent dataview. It includes a summary of the script functionality, sample run images, dependencies, and the processes involved in detecting vulnerabilities.'
tags: ['security']
draft: false
unlisted: false
---

## Summary

This script performs a vulnerability scan on the VSA server and logs the output to a dependent dataview.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Kaseya-VSA-Detection-Tool/image_1.png)

## Dependencies

[Kaseya Vulnerability Audit](<../dataviews/Kaseya Vulnerability Audit.md>)

### Script States

| Name                     | Example               | Description                                                                                       |
|--------------------------|-----------------------|---------------------------------------------------------------------------------------------------|
| VSAEndpointDetection      | safe -- %shellresult% | This will store the script output and comparative status indicating whether the server is vulnerable or safe.   |

## Process

- This script will detect suspicious certificate checks, suspicious executable checks, suspicious file reference checks, scan for intrusion risks, and malicious file checks, reporting everything to the dataview.
- This should be targeted to the VSA server only.

## Output

- Script log
- Script state
- Dataview
