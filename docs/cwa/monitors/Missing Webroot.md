---
id: 'e50cad02-bc5f-4633-91d6-4f58ba08c215'
slug: /e50cad02-bc5f-4633-91d6-4f58ba08c215
title: 'Missing Webroot'
title_meta: 'Missing Webroot'
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
- [SWM - Software Install - Solution - Webroot](/docs/2b4f5b7f-0275-4114-8686-0084c1741c9d)

## Target

- Should not target Linux-based operating systems.
- Can target macOS or Windows.
- Please review the solution document for supported systems.


