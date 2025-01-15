---
id: 'e50cad02-bc5f-4633-91d6-4f58ba08c215'
title: 'Webroot Deployment Monitor'
title_meta: 'Webroot Deployment Monitor for Client Systems'
keywords: ['webroot', 'monitor', 'deployment', 'client', 'exclusion', 'location', 'macos', 'windows']
description: 'This document outlines an internal monitor that detects all computers whose associated client has the Enable Webroot Deployment EDF checked, while ensuring there are no associated location or computer exclusions. It includes dependencies and target operating systems.'
tags: ['monitor', 'deployment', 'client', 'exclusion', 'macos', 'windows']
draft: false
unlisted: false
---
## Summary

This internal monitor detects all computers whose associated client has the Enable Webroot Deployment EDF Checked and does not have an associated location exclusion or computer exclusion.

## Dependencies

- [SWM - Software Installation - Script - △ Install Webroot SecureAnyWhere](https://proval.itglue.com/DOC-5078775-11623253)
- [SWM - Software Install - Solution - Webroot](https://proval.itglue.com/DOC-5078775-11665357)

## Target

- Should not target Linux based operating systems
- Can target MACOS or Windows.
- Please review Solution Document for supported systems.






