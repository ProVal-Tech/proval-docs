---
id: 'ef41c491-27c6-41d4-a478-eb66ca809399'
slug: /ef41c491-27c6-41d4-a478-eb66ca809399
title: 'SWM - Software Update - Agnostic - Update-VisualStudio'
title_meta: 'SWM - Software Update - Agnostic - Update-VisualStudio'
keywords: ['update', 'visualstudio', 'upgrade', 'enterprise', 'community']
description: 'This document provides an overview of the script that automatically updates all installed versions of Visual Studio, including VS 2022, 2019, and 2017 for both Enterprise and Community editions. It details the process of checking for installed applications, downloading updates, performing upgrades, and logging the results.'
tags: ['installation', 'report', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Overview

This script updates all installed versions of Visual Studio automatically. It is available for:

- VS 2022 Enterprise
- VS 2022 Community
- VS 2019 Enterprise
- VS 2019 Community
- VS 2017 Enterprise
- VS 2017 Community

## Requirements

None

## Process

The script first checks if any of the above Visual Studio applications are installed. If found, it downloads the update package for that particular application and performs the upgrade. Once the upgrade is complete, it logs the information, error log files, and deletes the executable package.

## Payload Usage

To update Visual Studio, run the following command:

```
./Update-VisualStudio.ps1
```

## Output

The output files will be generated as follows:

```
./Update-VisualStudio-log.txt
./Update-VisualStudio-data.txt
./Update-VisualStudio-error.txt
```

