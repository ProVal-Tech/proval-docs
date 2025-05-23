---
id: '97aba1f6-ff21-4997-ba2b-7b43c337567a'
slug: /97aba1f6-ff21-4997-ba2b-7b43c337567a
title: 'Show-Font'
title_meta: 'Show-Font'
keywords: ['fonts', 'registry', 'customobject', 'installed', 'system']
description: 'This document provides an overview of a script that returns a custom object listing all installed fonts on a system by querying the registry. It details the process, usage, and output format of the script.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Overview

This script returns a custom object of all installed fonts on a system.

## Process

1. Query the registry for fonts.
2. Return the custom object.

## Payload Usage

```
Show-Font.ps1
Returns a CustomObject listing all installed fonts.
```

## Output

```
CustomObject
```

## Locations

| Payload                | Location                     |
|-----------------------|------------------------------|
| /repo/scripts/show-font.ps1 |                          |
| Automate              |                              |
| ConnectWise RMM       |                              |
| Kaseya                |                              |
| Datto RMM            |                              |
## Attachments
[Install-AnyConnect.ps1](<../../static/attachments/itg/10371907/Install-AnyConnect.ps1>)