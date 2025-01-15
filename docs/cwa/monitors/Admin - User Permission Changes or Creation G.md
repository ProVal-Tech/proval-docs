---
id: '30dde7e3-b96b-4e24-bbc5-cfa041aa5648'
title: 'Monitor Summary and Dependencies'
title_meta: 'Monitor Summary and Dependencies for ConnectWise Automate'
keywords: ['monitor', 'dependencies', 'ticketing', 'target', 'itglue']
description: 'This document provides a comprehensive overview of the monitor, including its purpose, dependencies on ITGlue documents, suggested targets for execution, and guidelines for ticket generation. It aims to assist users in understanding how to effectively run the monitor and manage related tickets.'
tags: ['monitoring', 'itglue', 'ticketing', 'target', 'documentation']
draft: false
unlisted: false
---
## Summary

A brief summary of what this monitor is used for and any important notes about how to run it.

## Dependencies

This should be a list of ITGlue documents listed in the Related Items sidebar on which this monitor depends.

- Autofix Script Doc Link
- Custom Table Doc Link
- EDF Doc Link
- etc.

## Target

The suggested target for the monitor. This will be partially generalized as group names can vary between Automate systems. Examples:

- Global - Should be run without explicitly defined targets.
- Workstations - Should be run on non-servers
- Servers - Should be run on servers
- Windows Machines - Should be run on all Windows machines

There can also be composite definitions. Examples:

- Non-Windows Workstations - Should be run on all workstations not running a Windows OS.
- Windows Servers - Should be run on all Windows-based servers.

## Ticketing

*Note to ProVal Team: Ticket subject lines should be short and simple. The body of the ticket should provide a detailed explanation of why a ticket was generated and, ideally, what the next steps should be when a user is looking at the ticket.*

If the monitor is intended to create tickets, please note the Subject and Body of the ticket below. Include an example ticket if possible.

**Subject**

**Body**






