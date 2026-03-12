---
id: '27dec940-59f6-407b-bdbb-2b8432a30467'
slug: /27dec940-59f6-407b-bdbb-2b8432a30467
title: 'CyberQP DUO Cred Provider'
title_meta: 'CyberQP DUO Cred Provider'
keywords: ['quickpass', 'agent', 'installation', 'windows', 'deployment', 'duo']
description: 'This document outlines the implementation details for a remote monitor that checks for agents where "QuickPassInstalled" is true, "DuoInstalled" is true, and the registry for the DUO whitelist exists. If the registry does not exist, it will trigger the autofix script "Enabling the CyberQP Credential Provider while using Duo" to set the registry on the agent.'
tags: ['installation', 'security', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-03-12
---

## Summary

This document outlines the implementation details for a remote monitor that checks for agents where `QuickPassInstalled` is `true`, `DuoInstalled` is `true`, and the registry for the DUO whitelist exists. If the registry does not exist, it will trigger the [Script - Enabling the CyberQP Credential Provider while using Duo](/docs/249507b6-c45d-4be0-b1e9-1204a4931c8d) to set the registry on the agent.

## Dependencies

[Script - Enabling the CyberQP Credential Provider while using Duo](/docs/249507b6-c45d-4be0-b1e9-1204a4931c8d)
`Alert template - △ Custom - Execute Script - Enable CyberQP DUO` 

## Details

**Suggested "Limit to"**: QuickPassServerAgent Running 
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Execute Script - Enable CyberQP DUO  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result               |
|--------------|----------------|------------|---------------|-------------|----------|----------------------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | Does Not Contains | 14400    | DUO Setting required   |


## Target

- QuickpassServerAgent group

## Implementation

[Import - Remote Monitor - CyberQP DUO Cred Provider](/docs/127fa07e-a322-41a7-a993-a820add9af53)
- Apply the `Alert template - △ Custom - Execute Script - Enable CyberQP DUO` and update the monitor.


## Changelog

### 2026-03-12

- Added this new remote monitor to enable the CyberQP Credential Provider while using Duo automatically using the autofix [Script - Enabling the CyberQP Credential Provider while using Duo](/docs/249507b6-c45d-4be0-b1e9-1204a4931c8d) trigger on the detected agents where monitor failed.