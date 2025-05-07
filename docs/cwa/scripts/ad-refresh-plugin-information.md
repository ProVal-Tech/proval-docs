---
id: '17153d23-676f-47b8-bc1c-f32fb10049c0'
slug: /17153d23-676f-47b8-bc1c-f32fb10049c0
title: 'AD - Refresh Plugin Information'
title_meta: 'AD - Refresh Plugin Information'
keywords: ['active-directory', 'plugin', 'synchronize', 'labtech', 'command']
description: 'This document outlines a script designed to reset the Active Directory plugin for the Domain Controller it operates on, detailing the process and expected time savings from automation.'
tags: ['active-directory', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script will reset the AD plugin for the Domain Controller (DC) it runs on.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/17153d23-676f-47b8-bc1c-f32fb10049c0/image_1.webp)

## Process

- Runs LabTech Command 13 to reset the AD plugin on the DC.
- Runs another LabTech command "update plugins" to synchronize plugin data on the agent.
