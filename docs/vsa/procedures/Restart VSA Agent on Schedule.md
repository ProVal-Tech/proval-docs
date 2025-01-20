---
id: 'e028ad3f-fecc-4701-83b8-0537db4e8494'
title: 'VSA Agent Restart Automation'
title_meta: 'VSA Agent Restart Automation'
keywords: ['vsa', 'agent', 'restart', 'service', 'failure']
description: 'This document outlines the process for allowing VSA Agents to automatically come back online after a service failure without user intervention. It includes a deletion script to undo the process if necessary and provides links to associated agent procedures for creating and removing scheduled tasks.'
tags: ['recovery']
draft: false
unlisted: false
---
## Purpose

Allows VSA Agents to come back online after a service failure on their own, without user intervention. Includes a deletion script that undoes this process.

## Associated Content

| Content                                                                                     | Type            | Function                      |
|---------------------------------------------------------------------------------------------|-----------------|-------------------------------|
| [VSA - Agent - Agent Procedure - Scheduled Task for Agent Restart - Create](<./Scheduled Task for Agent Restart - Create.md>) | Agent Procedure  | Creates the scheduled task    |
| [VSA - Agent - Agent Procedure - Scheduled Task for Agent Restart - Remove](<./Scheduled Task for Agent Restart - Remove.md>) | Agent Procedure  | Removes the Scheduled task    |

## Implementation

Import both XMLs into the client environment. Edit [VSA - Agent - Agent Procedure - Scheduled Task for Agent Restart - Create](<./Scheduled Task for Agent Restart - Create.md>) to point to the proper VSA service name. Use the getVariable `#serviceName#` for this. Schedule / deploy procedures.












