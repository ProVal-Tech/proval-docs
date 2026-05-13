---
id: '48618a4c-997d-4dbc-83ef-cc1bf1ead6c4'
slug: /48618a4c-997d-4dbc-83ef-cc1bf1ead6c4
title: 'Unresponsive Huntress Agent Detection'
title_meta: 'Unresponsive Huntress Agent Detection'
keywords: ['huntress', 'agent', 'orphaned', 'security']
description: 'Runs the Unresponsive Huntress Agents automation on machines with Huntress Agent.'
tags: ['security','windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-12
---

## Purpose

This Solution detectes if Huntress Agent is Orphaned or not. By Orphaned it means Huntress has not received a response from the agent within 30 days and the Agent's key/token has been revoked by Huntress. At that point, the agent is unable to send or receive any data from the Huntress portal and is essentially not performing security tasks anymore.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Automation - Unresponsive Huntress Agents](/docs/30da4898-4cc5-4cd0-9536-f594192544b1)     | Automation | Detects if Huntress Agent is Orphaned or not.  |
| [Compound Condition - Detect Unresponsive Huntress Agents](/docs/13e97aa8-f0f4-4667-9edd-cbd5f460f162)     | Compound Condition | Executes [Unresponsive Huntress Agents](/docs/30da4898-4cc5-4cd0-9536-f594192544b1) automation once in a day on machines with Huntress Agent.  |
| [Ticket Template - Unresponsive Huntress Agents](/docs/6a332f26-d519-41c2-b38e-7b84ada2edbb)     | Ticket Template | Configures how a ConnectWise Manage ticket will be generated in response to the [Detect Unresponsive Huntress Agents](/docs/13e97aa8-f0f4-4667-9edd-cbd5f460f162) condition. |

## Implementation

- Create the [Automation - Unresponsive Huntress Agents](/docs/30da4898-4cc5-4cd0-9536-f594192544b1) 
- Create the [Ticket Template - Unresponsive Huntress Agents](/docs/6a332f26-d519-41c2-b38e-7b84ada2edbb)  
- Create the [Compound Condition - Detect Unresponsive Huntress Agents](/docs/13e97aa8-f0f4-4667-9edd-cbd5f460f162)  

## Changelog

### 2026-05-12

- Initial version of the document