---
id: '392a41e0-bbe1-4270-87a0-0a093aff3671'
slug: /392a41e0-bbe1-4270-87a0-0a093aff3671
title: 'Deploy Threatlocker Agent'
title_meta: 'Deploy Threatlocker Agent'
keywords: ['threatlocker', 'installation', 'windows', 'mac', 'groupkey']
description: 'This monitor detects both Mac and Windows agents that are missing Threatlocker agents.'
tags: ['installation', 'security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor detects both Mac and Windows agents that are missing Threatlocker agents. For windows Agents, client EDF `Threatlocker_Organization_Name` and for Mac agents Client EDF `ThreatLockerMacGroupKey`  should not be blank in order to detect machines missing the agent.
The monitor will exclude agents with either Location-Level EDF `Exclude Threatlocker` or Computer-Level EDF `Exclude Threatlocker` is marked.

## Dependencies

- [Script: Threatlocker Agent Deployment](/docs/6ee04ebc-5867-4310-a8ed-1f800f031774)
- [Solution: Threatlocker Agent Deployment](/docs/2b68cbb1-1406-4a4b-9173-e91f1b0c7f88)

## Target

Both Windows and Mac Agents

## Alert Template

- `△ Custom - Execute Script - Threatlocker Agent Deployment`
