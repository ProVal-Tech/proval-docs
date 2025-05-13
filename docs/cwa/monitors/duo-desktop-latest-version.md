---
id: 'c2082154-028d-40fc-beb4-2e8137d2aa57'
slug: /c2082154-028d-40fc-beb4-2e8137d2aa57
title: 'ProVal - Production - DUO Desktop - Latest Version Detection'
title_meta: 'ProVal - Production - DUO Desktop - Latest Version Detection'
keywords: ['DUO', 'Desktop', 'Security', 'Authentication', 'Token', 'Install', 'Update']
description: 'This monitor is designed to fetch the latest version of the DUO Desktop every month and store it in the system property DUO_Desktop_Latest_Version.'
tags: ['software', 'security', 'windows']
draft: false
unlisted: false
---

## Summary
This monitor is designed to fetch the latest version of the DUO Desktop every month and store it in the system property `DUO_Desktop_Latest_Version`.

## Dependencies

[Script - DUO Desktop - Install/Upgrade](/docs/c0019fe0-7411-4c3d-981b-f2bb70733c26)

**Alert Template - △ Custom - Execute Script - DUO Desktop**

## Target

Global 

## Implementation

- Import the Monitor
- Import the [Script - DUO Desktop - Install/Upgrade](/docs/c0019fe0-7411-4c3d-981b-f2bb70733c26)
- Import the **Alert Template - △ Custom - Execute Script - DUO Desktop**
- Navigate to the Automation->Monitors
- Apply the **Alert Template - △ Custom - Execute Script - DUO Desktop** with the monitor to run the [Script - DUO Desktop - Install/Upgrade](/docs/c0019fe0-7411-4c3d-981b-f2bb70733c26) as an autofix.
- Run now and reset the monitor.