---
id: ps-clear-geckocache
title: 'Clear-GeckoCache'
title_meta: 'Clear-GeckoCache Command'
keywords: ['clear', 'gecko', 'cache', 'firefox']
description: 'Documentation for the Clear-GeckoCache command to clear Gecko engine (Firefox) browser caches for all users.'
tags: ['firefox', 'performance']
draft: false
unlisted: false
---

## Description
Clears Gecko engine (Firefox) browser caches.

## Usage
1. If a sub-directory of `\\Users\\<Username>\\AppData\\Local` with the name `Profiles` has a child directory named `cache2`, then it is detected as a Gecko cache directory.
2. The detected directories are then purged of all files without an extension. The directory structure is left in place.

*Clears Gecko engine browser caches for all users.*

```powershell
.\\Clear-GeckoCache.ps1
```

## Output
The output log can be found at:
```
.\\Clear-GeckoCache-log.txt
```
