---
id: 'f8b7444f-398c-42a5-8ed8-f83c3491818e'
slug: /f8b7444f-398c-42a5-8ed8-f83c3491818e
title: 'Clickshare installation'
title_meta: 'Clickshare installation'
keywords: ['clickshare', 'installation', 'script', 'agent', 'taskscheduler']
description: 'This document provides a comprehensive guide on how to install ClickShare using a script. It covers the installation options for all users or the logged-in user, along with dependencies and global parameters.'
tags: ['installation', 'setup', 'software']
draft: false
unlisted: true
---

## Summary

This script will help to install ClickShare.

## Sample Run

![Sample Run](../../static/img/docs/f8b7444f-398c-42a5-8ed8-f83c3491818e/image_1.webp)

## Dependencies

[Download Link](https://www.barco.com/services/website/en/TdeFiles/Download?FileNumber=R3306183&TdeType=3&MajorVersion=04&MinorVersion=18&PatchVersion=00&BuildVersion=008&ShowDownloadPage=False)

#### Global Parameters

| Name          | Example | Required | Description                                                                                     |
|---------------|---------|----------|-------------------------------------------------------------------------------------------------|
| TaskScheduler | 0,1     | True     | 1 --> Schedule the task to install ClickShare for all users; 0 --> Install ClickShare for the logged-in user |

## Process

This script helps to install ClickShare on the agent. It can install the application for all users at once or for the logged-in user based on the global parameter "TaskScheduler".

## Output

- Script log