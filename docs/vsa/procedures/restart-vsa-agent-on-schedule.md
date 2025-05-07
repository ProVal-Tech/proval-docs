---
id: 'e028ad3f-fecc-4701-83b8-0537db4e8494'
slug: /e028ad3f-fecc-4701-83b8-0537db4e8494
title: 'Restart VSA Agent on Schedule'
title_meta: 'Restart VSA Agent on Schedule'
keywords: ['vsa', 'agent', 'restart', 'service', 'failure']
description: 'This document outlines the process for allowing VSA Agents to automatically come back online after a service failure without user intervention. It includes a deletion script to undo the process if necessary and provides links to associated agent procedures for creating and removing scheduled tasks.'
tags: ['recovery']
draft: false
unlisted: false
---

## Purpose

This document allows VSA Agents to come back online after a service failure on their own, without user intervention. It includes a deletion script that can undo this process.

## Associated Content

| Content                                                                                     | Type            | Function                      |
|---------------------------------------------------------------------------------------------|-----------------|-------------------------------|
| [VSA - Agent - Agent Procedure - Scheduled Task for Agent Restart - Create](/docs/7eb2b58e-9f5e-4732-8457-6518060f0cc3) | Agent Procedure  | Creates the scheduled task    |
| [VSA - Agent - Agent Procedure - Scheduled Task for Agent Restart - Remove](/docs/b4f78d3c-4c41-46eb-9fee-94b9f7d3caab) | Agent Procedure  | Removes the scheduled task    |

## Implementation

Import both XML files into the client environment. Edit [VSA - Agent - Agent Procedure - Scheduled Task for Agent Restart - Create](/docs/7eb2b58e-9f5e-4732-8457-6518060f0cc3) to point to the correct VSA service name. Use the variable `#serviceName#` for this. Finally, schedule and deploy the procedures.
