---
id: '4bc06cc4-3b78-452a-b602-063e57221234'
slug: /4bc06cc4-3b78-452a-b602-063e57221234
title: 'No Checkin for More Than 30 Days'
title_meta: 'No Checkin for More Than 30 Days'
keywords: ['monitor', 'machines', 'contact', 'action', 'agent', 'ticket', 'maintenance', 'template']
description: 'This document outlines an internal monitor designed to identify machines that have not contacted the server in over 30 days. It details possible actions that can be taken, such as reinstalling the agent, creating a ticket, or retiring the agent, with a note on limitations regarding maintenance mode.'
tags: []
draft: false
unlisted: false
---

## Summary

This internal monitor will show all machines that have not contacted the server in over 30 days. Any action can be taken against those machines, such as reinstalling the agent, creating a ticket, or retiring the agent.

**Note:** Autofix action(s) cannot be performed on computers in maintenance mode.

## Target

Global

## Alert Template

**Name:** △ Custom - Autofix - Offline Agent Remediation (RMM+)

**Note:** The alert template should execute the [Script - Automate Agent - Auto Repair](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c)