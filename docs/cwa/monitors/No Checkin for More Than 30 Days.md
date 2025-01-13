---
id: 'cwa-offline-agent-remediation'
title: 'Offline Agent Remediation'
title_meta: 'Offline Agent Remediation'
keywords: ['monitor', 'machines', 'contact', 'action', 'agent', 'ticket', 'maintenance', 'template']
description: 'This document outlines an internal monitor designed to identify machines that have not contacted the server in over 30 days. It details possible actions that can be taken, such as reinstalling the agent, creating a ticket, or retiring the agent, with a note on limitations regarding maintenance mode.'
tags: ['alert', 'monitoring', 'remediation', 'ticket', 'agent', 'maintenance']
draft: false
unlisted: false
---
## Summary

This internal monitor will show all machines which have the last contact older than 30 days. Any action can be taken against those machines like reinstalling the agent, creating a ticket, or retiring the agent.

**Note:** Autofix action(s) can not be performed on the computers in maintenance mode.

## Target

Global

## Alert Template

**Name:** △ Custom - Autofix - Offline Agent Remediation (RMM+)

**Note:** The alert template should be executing the [Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441)



