---
id: 'ps-show-font'
title: 'Show Installed Fonts'
title_meta: 'Show Installed Fonts - Custom Object of Fonts on System'
keywords: ['fonts', 'registry', 'customobject', 'installed', 'system']
description: 'This document provides an overview of a script that returns a custom object listing all installed fonts on a system by querying the registry. It details the process, usage, and output format of the script.'
tags: ['configuration', 'windows', 'software']
draft: false
unlisted: false
---
## Overview

Returns a custom object of all installed fonts on a system

## Process

1. Query the registry for fonts
2. Return the custom object

## Payload Usage

```
Show-Font.ps1
Returns a CustomObject listing all installed fonts
```

## Output

```
CustomObject
```

## Locations

| Payload                | /repo/scripts/show-font.ps1 |
|-----------------------|-------------------------------|
| Automate              |                               |
| ConnectWise RMM       |                               |
| Kaseya                |                               |
| Datto RMM            |                               |


