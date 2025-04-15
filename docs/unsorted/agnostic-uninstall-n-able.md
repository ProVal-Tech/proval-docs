---
id: '929401cd-6977-4389-97fe-29e544dc6b9b'
slug: /929401cd-6977-4389-97fe-29e544dc6b9b
title: 'Agnostic - Uninstall N-Able'
title_meta: 'Agnostic - Uninstall N-Able'
keywords: ['nable', 'uninstallation', 'windows', 'agent', 'removal']
description: 'This document provides a comprehensive guide on how to uninstall the N-Able Windows Agent using a PowerShell script. It details the requirements, process, and expected output files for successful uninstallation.'
tags: ['report', 'software', 'uninstallation', 'windows']
draft: false
unlisted: true
---

## Overview

This document outlines the process for uninstalling the N-Able Windows Agent.

## Requirements

- PowerShell 5.1

## Process

The script checks if the Windows Agent is installed. If it is, the script will perform a complete removal of the N-Able Windows Agent.

## Payload Usage

To uninstall N-Able, use the following command:

```
./Uninstall-N-Able.ps1
```

## Output

Upon completion, the following log files will be generated:

```
./Uninstall-N-Able-log.txt
./Uninstall-N-Able-error.txt
```