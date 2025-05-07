---
id: '79f53096-8353-4935-9343-0a77b74fe052'
slug: /79f53096-8353-4935-9343-0a77b74fe052
title: 'Invoke-UninstallHideUpdate'
title_meta: 'Invoke-UninstallHideUpdate'
keywords: ['uninstall', 'hide', 'update', 'kbarticles']
description: 'Documentation for the Invoke-UninstallHideUpdate command to uninstall and hide specified KB articles using the PSWindowsUpdate module.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Description
Uninstalls, then hides, a specified list of KB articles.

## Requirements
Requires manual reboot if necessary.

## Usage
Uses the PSWindowsUpdate module to hide and uninstall the provided KB articles.

```powershell
C:> ./Invoke-UninstallHideUpdate -KBArticles "KB100000","KB200000"
```

## Parameters
| Parameter       | Alias | Required | Default | Type   | Description                               |
|-----------------|-------|----------|---------|--------|-------------------------------------------|
| $KBArticles     |       | True     |         | String | Accepts a string array separated by commas.|

## Output
Location of output for log, result, and error files.

```
.\Invoke-UninstallHideUpdate-log.txt
.\Invoke-UninstallHideUpdate-error.txt
```

