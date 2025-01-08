---
id: 'cwa_set-maintenance-mode'
title: 'Set Maintenance Mode on Target Agent'
title_meta: 'Set Maintenance Mode on Target Agent'
keywords: ['maintenance', 'agent', 'script', 'time', 'automation']
description: 'This document provides a detailed overview of a script that sets maintenance mode on the target agent, including user parameters, process description, and expected output.'
tags: ['configuration', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This script sets maintenance mode on the target agent.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](5078775/docs/8156778/images/11437966)

#### User Parameters

| Name                | Example | Required | Description                                                                 |
|---------------------|---------|----------|-----------------------------------------------------------------------------|
| Time In Minutes     | 300     | True     | The number of minutes to set for maintenance mode. Max 99999.             |

## Process

Starts maintenance mode with a prompt for how long to set it for. Please set the time when running. Max time is 99999 minutes. Any number larger than that will error out the script.

## Output

- Script log


