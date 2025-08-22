---
id: 'c8f1104e-7934-408f-a35d-9279a0d5f7e1'
slug: /c8f1104e-7934-408f-a35d-9279a0d5f7e1
title: 'CW RMM Migration'
title_meta: 'CW RMM Migration'
keywords: ['cw-rmm', 'rmm-agent', 'migration', 'cw-rmm-agent']
description: 'Outlines the process of migrating agents from CW Automate to CW RMM.'
tags: ['installation', 'application']
draft: false
unlisted: false
---

## Purpose

Outlines the process of migrating agents from CW Automate to CW RMM.

## Associated Content

| Content | Type | Purpose |
| ------- | ---- | ------- |
| [CW RMM Agent Deployment](/docs/f3f03288-5bce-4fb7-8a32-1ea41d698197) | Script | Installs agent |
| [CW RMM Agent Deployment - [Windows, Mac]](/docs/0b5d4518-2be4-423e-a8e9-8c68d0a18888) | Internal Monitor | Detect machines |
| △ Custom - Execute Script - CW RMM Agent Deployment | Alert Tempalte | Executes script on machines detected by the internal monitor |

## Implementation

### Step 1

Import the following content from `ProSync` plugin:

- [Script - CW RMM Agent Deployment](/docs/f3f03288-5bce-4fb7-8a32-1ea41d698197)
- [Internal Monitor - CW RMM Agent Deployment - [Windows, Mac]](/docs/0b5d4518-2be4-423e-a8e9-8c68d0a18888)
- `Alert Template - △ Custom - Execute Script - CW RMM Agent Deployment`

### Step 2

Reload System Cache (Ctrl + R)

### Step 3

Configure the solution as follow:

- Internal Monitor: [CW RMM Agent Deployment - [Windows, Mac]](/docs/0b5d4518-2be4-423e-a8e9-8c68d0a18888)
  - Alert Template: `△ Custom - Execute Script - CW RMM Agent Deployment`

### Step 4

Configure the location level EDFs to initiate the solution.

| Name | Example | Section | Required | Type | Accepted Values | Description |
| ---- | ------- | ------- | -------- | ---- | --------------- | ----------- |
| RMMAgentDeployment | `All` | RMM Migration | True | Drop-down | <ul><li>Not Set</li><li>Workstations</li><li>Servers</li><li>All</li></ul> | Select the operating system to deploy CW RMM agent upon. |
| RMMSiteToken | `71918cbc-981e-465d-9cb4-627e2883a10b` | RMM Migration | True | Text | | CW RMM Agent token for the site. |

![Image2](../../static/img/docs/f3f03288-5bce-4fb7-8a32-1ea41d698197/image2.webp)
