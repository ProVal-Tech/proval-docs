---
id: 'cwa-check-numa-resources'
title: 'Check NUMA Resource Limits on Hyper-V Machines'
title_meta: 'Check NUMA Resource Limits on Hyper-V Machines'
keywords: ['numa', 'hyper-v', 'resources', 'limits', 'performance']
description: 'This document describes a script designed to check for Hyper-V machines that exceed their NUMA node limits, helping to identify misconfigured virtual machines and optimize resource allocation.'
tags: ['hyper-v', 'performance', 'configuration', 'windows']
draft: false
unlisted: false
---
## Summary

This script is used to check for machines that have too many resources, exceeding their NUMA node limits.  
Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\Set-NUMA-VM-Status\image_1.png)

#### Script States

| Name                  | Example      | Description                                   |
|-----------------------|--------------|-----------------------------------------------|
| MisconfiguredNumaVMs  | %sqlresult%  | This script state holds the result of the SQL query. |

## Process

The script runs a Powershell script to get the NumaStatus. The Powershell then holds the MisconfiguredNumaVMs in the script state. The script is intended to run on the Hyper-V host servers.

## Output

- Script state



