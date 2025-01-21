---
id: 'be916af8-6402-4b0d-8a1f-e7bd059286a3'
title: 'O365 Current Update Channel Detection'
title_meta: 'O365 Current Update Channel Detection'
keywords: ['o365', 'update', 'detection', 'channel', 'apps']
description: 'This document outlines the detection method for identifying if the O365 applications are on the Current Update Channel. It includes settings and detection strings for effective monitoring and compliance.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This role detects if the O365 apps are on the Current Update Channel.

## Settings

| Detection String                                              | Comparator | Result                                                                                      | Applicable OS |
|--------------------------------------------------------------|------------|---------------------------------------------------------------------------------------------|----------------|
| \{%-HKLM/SOFTWARE/Microsoft/Office/ClickToRun/Configuration:CDNBaseUrl-%} | Contains   | [http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60](http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60) | Windows        |

