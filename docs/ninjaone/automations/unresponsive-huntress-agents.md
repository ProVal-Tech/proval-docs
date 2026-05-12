---
id: '30da4898-4cc5-4cd0-9536-f594192544b1'
slug: /30da4898-4cc5-4cd0-9536-f594192544b1
title: 'Unresponsive Huntress Agents'
title_meta: 'Unresponsive Huntress Agents'
keywords: ['huntress', 'agent', 'orphaned', 'security']
description: 'This script detects if Huntress Agent is Orphaned or not'
tags: ['security','windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-12
---

## Overview
This script detects if Huntress Agent is Orphaned or not. By Orphaned it means Huntress has not received a response from the agent within 30 days and the Agent's key/token has been revoked by Huntress. At that point, the agent is unable to send or receive any data from the Huntress portal and is essentially not performing security tasks anymore.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/30da4898-4cc5-4cd0-9536-f594192544b1/image1.webp)

## Dependencies

- [Solution - Unresponsive Huntress Agent Detection](/docs/48618a4c-997d-4dbc-83ef-cc1bf1ead6c4)  

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/unresponsive-huntress-agents.ps1)

## Output

- Activity Details 

## Changelog

### 2026-05-12

- Initial version of the document