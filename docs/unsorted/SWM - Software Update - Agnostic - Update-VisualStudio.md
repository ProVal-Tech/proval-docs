---
id: 'ef41c491-27c6-41d4-a478-eb66ca809399'
title: 'Update Visual Studio'
title_meta: 'Update Visual Studio - Automatic Updates for Installed Versions'
keywords: ['update', 'visualstudio', 'upgrade', 'enterprise', 'community']
description: 'This document provides an overview of the script that automatically updates all installed versions of Visual Studio, including VS 2022, 2019, and 2017 for both Enterprise and Community editions. It details the process of checking for installed applications, downloading updates, performing upgrades, and logging the results.'
tags: ['update', 'software', 'windows', 'installation', 'report']
draft: false
unlisted: false
---
## Overview

Updates all installed VS versions automatically. It's only available for:

- VS 2022 Enterprise
- VS 2022 Community
- VS 2019 Enterprise
- VS 2019 Community
- VS 2017 Enterprise
- VS 2017 Community

## Requirements

No

## Process

This script first checks if any of the above Visual applications are found. If found, then it downloads the update package of that particular application and performs the upgrade. Once the upgrade is done, it logs the information, and error log files, and deletes the exe package.

## Payload Usage

Update Visual Studio.

```
./Update-VisualStudio.ps1
```

## Output

```
./Update-VisualStudio-log.txt
./Update-VisualStudio-data.txt
./Update-VisualStudio-error.txt
```







