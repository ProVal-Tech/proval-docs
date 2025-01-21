---
id: '11e2bd71-314c-497f-a22a-814ff2af0d4d'
title: 'Clear Safari Cache on macOS Devices'
title_meta: 'Clear Safari Cache on macOS Devices'
keywords: ['safari', 'cache', 'macos', 'clear', 'files', 'folders', 'logs', 'errors']
description: 'This document provides a step-by-step guide on how to clear the Safari cache on macOS devices, including the requirements, process, and output logs for successful execution.'
tags: []
draft: false
unlisted: false
---

## Overview

Clear the Safari Cache on macOS devices.

## Requirements

Must be run on macOS devices.

## Process

1. Loop through cache files and folders, removing those items.
2. Log any errors.

## Payload Usage

```
Clear-SafariCachemacOS.ps1
Clears all Safari cache files and folders from macOS devices.
```

## Output

```
./Clear-SafariCachemacOS-log.txt
./Clear-SafariCachemacOS-error.txt
```

## Locations

| Payload                    | Location                               |
|---------------------------|----------------------------------------|
| Script                    | /repo/scripts/Clear-SafariCachemacOS.ps1 |
| Automate                  |                                        |
| ConnectWise RMM           |                                        |
| Kaseya                    |                                        |
| Datto RMM                 |                                        |
