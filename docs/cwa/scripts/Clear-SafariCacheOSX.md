---
id: 'ps-clear-safari-cache-osx'
title: 'Clear Safari Cache on OSX Devices'
title_meta: 'Clear Safari Cache on OSX Devices'
keywords: ['safari', 'cache', 'osx', 'clear', 'files', 'folders', 'logs', 'errors']
description: 'This document provides a step-by-step guide on how to clear the Safari cache on OSX devices, including the requirements, process, and output logs for successful execution.'
tags: ['osx', 'cache', 'files', 'logs', 'error']
draft: false
unlisted: false
---
## Overview

Clear the Safari Cache on OSX devices

## Requirements

Must be run on OSX devices

## Process

1. Loops through cache files and folders removing those items
2. Logs any errors

## Payload Usage

```
Clear-SafariCacheOSX.ps1
Clears all safari cache files and folders from osx devices
```

## Output

```
    .\Clear-SafariCacheOSX-log.txt
    .\Clear-SafariCacheOSX-error.txt
```

## Locations

| Payload                    | /repo/scripts/Clear-SafariCacheOSX.ps1 |
|---------------------------|-----------------------------------------|
| Automate                  |                                         |
| ConnectWise RMM           |                                         |
| Kaseya                    |                                         |
| Datto RMM                 |                                         |


