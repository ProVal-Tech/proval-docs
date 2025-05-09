---
id: '3af8bbf0-532f-43c5-a2ea-980be9031730'
slug: /3af8bbf0-532f-43c5-a2ea-980be9031730
title: 'Agent Monitors - Disk - Remove and Rebuild - ProVal'
title_meta: 'Agent Monitors - Disk - Remove and Rebuild - ProVal'
keywords: ['disk', 'monitor', 'agent', 'deployment', 'script']
description: 'This document outlines a script that clears existing Disk Monitors from an agent and reinstalls new Disk Monitors, intended for use during the initial deployment of service plans for servers and workstations. The process saves approximately 5 minutes by automating the removal and reinstallation of disk monitors.'
tags: ['connectwise', 'deployment']
draft: false
unlisted: false
---

## Summary

This script clears existing Disk Monitors from an agent and reinstalls new Disk Monitors.

It should be run against the service plan for servers and workstations as part of the initial deployment.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/3af8bbf0-532f-43c5-a2ea-980be9031730/image_1.webp)

## Dependencies

- @Agent Monitor Creation - Disk* - WRAPPER

## Process

- Runs a default script, **Agent Monitors - Disk - Remove**, to remove the existing disk monitors.
- Runs our wrapper script, [CWM - Automate - Script - Agent Monitor Creation - Disk* - WRAPPER](/docs/3bd7b221-88a0-4bc0-a285-b0f9c6fd93fe), to create new disk monitors on machines.

## Output

- Script log