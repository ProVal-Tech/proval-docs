---
id: '3af8bbf0-532f-43c5-a2ea-980be9031730'
title: 'Clear and Reinstall Disk Monitors'
title_meta: 'Clear and Reinstall Disk Monitors for ConnectWise Automate'
keywords: ['disk', 'monitor', 'agent', 'deployment', 'script']
description: 'This document outlines a script that clears existing Disk Monitors from an agent and reinstalls new Disk Monitors, intended for use during the initial deployment of service plans for servers and workstations. The process saves approximately 5 minutes by automating the removal and reinstallation of disk monitors.'
tags: ['monitor', 'deployment', 'script', 'agent', 'connectwise']
draft: false
unlisted: false
---
## Summary

This script clears existing Disk Monitors from an agent and reinstalls new Disk Monitors.

Should be run against the service plan for servers and workstations as part of the initial deployment.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Agent-Monitors---Disk---Remove-and-Rebuild---ProVal/image_1.png)

## Dependencies

- @Agent Monitor Creation - Disk* - WRAPPER

## Process

- Runs a default script Agent Monitors - Disk - Remove to remove the existing disk monitors
- Runs our Wrapper script [CWM - Automate - Script - Agent Monitor Creation - Disk* - WRAPPER](https://proval.itglue.com/DOC-5078775-8066337) to create new disk monitors on machines

## Output

- Script log






