---
id: '3e424fbe-30e1-444b-a7c3-cc29793226a6'
title: 'EPM - Disk - Component - Soji Disk Cleaner'
title_meta: 'EPM - Disk - Component - Soji Disk Cleaner'
keywords: ['disk', 'cleaner', 'soji', 'endpoint', 'rmm']
description: 'This document outlines the implementation process for running the Soji Disk Cleaner on selected endpoints within Datto RMM. It includes dependencies, implementation steps, and output details to ensure successful execution.'
tags: ['cleanup', 'datto', 'disk-cleanup', 'software']
draft: true
unlisted: false
---

## Summary

This document describes the process of running the Soji Disk Cleaner on selected endpoint(s).

## Dependencies

- [Soji](https://proval.itglue.com/DOC-5078775-10338558) Agnostic Content  
- .NET 6 (Installation will be attempted by the component if not detected.)

## Implementation

Import the [attached component](https://proval.itglue.com/attachments/11025946) into Datto RMM.

## Output

- stdOut  
- stdError  
- ProgramData/_automation/app/soji/sojilogs/



