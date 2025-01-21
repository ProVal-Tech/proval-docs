---
id: 'e50cad02-bc5f-4633-91d6-4f58ba08c215'
title: 'Webroot Deployment Monitor'
title_meta: 'Webroot Deployment Monitor for Client Systems'
keywords: ['webroot', 'monitor', 'deployment', 'client', 'exclusion', 'location', 'macos', 'windows']
description: 'This document outlines an internal monitor that detects all computers whose associated client has the Enable Webroot Deployment EDF checked, while ensuring there are no associated location or computer exclusions. It includes dependencies and target operating systems.'
tags: ['deployment', 'macos', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor detects all computers whose associated client has the Enable Webroot Deployment EDF checked and does not have an associated location exclusion or computer exclusion.

## Dependencies

- [SWM - Software Installation - Script - △ Install Webroot SecureAnywhere](https://proval.itglue.com/DOC-5078775-11623253)
- [SWM - Software Install - Solution - Webroot](<../../solutions/Webroot.md>)

## Target

- Should not target Linux-based operating systems.
- Can target macOS or Windows.
- Please review the solution document for supported systems.
