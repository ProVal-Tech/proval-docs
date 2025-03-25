---
id: '6adef424-cef8-4ce5-af25-51f41191c464'
slug: /6adef424-cef8-4ce5-af25-51f41191c464
title: 'Wallpaper Set'
title_meta: 'Wallpaper Set'
keywords: ['wallpaper', 'windows', 'endpoint', 'scheduled', 'task']
description: 'This document outlines the procedure for setting the wallpaper on a Windows endpoint and includes the option to enforce that wallpaper using a scheduled task at logon. It provides examples of agent procedure logs to illustrate the successful execution of the script.'
tags: ['performance', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document explains how to set the wallpaper on a Windows endpoint and optionally enforce that wallpaper via an AtLogon scheduled task.

## Example Agent Procedure Log

| Time                     | Event                                         | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | User                      |
|--------------------------|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------|
| 3:22:38 pm 15-Feb-23    | Wallpaper Set                                 | Success THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | provaltech.com/dan.hicks  |
| 3:22:37 pm 15-Feb-23    | Wallpaper Set-0002                           | Log: 2023-02-15 15:18:52.030 -05:00 [INF] Writing user-level script to 'C:/Windows/TEMP/Set-WallpaperUL.ps1'. 2023-02-15 15:18:52.656 -05:00 [INF] Granting public access to 'C:/Windows/TEMP/Set-WallpaperUL.ps1'. 2023-02-15 15:18:53.015 -05:00 [INF] Granting public access to 'C:/Windows/TEMP/4844810.jpg'. 2023-02-15 15:22:26.270 -05:00 [INF] Writing user-level script to 'C:/Windows/TEMP/Set-WallpaperUL.ps1'. 2023-02-15 15:22:26.785 -05:00 [INF]  |


