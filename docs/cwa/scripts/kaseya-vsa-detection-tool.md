---
id: '765eb6aa-cc3a-471e-b11e-d7d8e1972e11'
slug: /765eb6aa-cc3a-471e-b11e-d7d8e1972e11
title: 'Kaseya VSA Detection Tool'
title_meta: 'Kaseya VSA Detection Tool'
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

![Sample Run](../../../static/img/docs/765eb6aa-cc3a-471e-b11e-d7d8e1972e11/image_1.webp)

## Dependencies

[Kaseya Vulnerability Audit](/docs/4c9692d8-b924-4901-a9c6-81b57d95b898)

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
