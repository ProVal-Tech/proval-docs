---
id: 'cca4abea-2af2-4ea8-b8ea-d6c2342c88a2'
slug: /cca4abea-2af2-4ea8-b8ea-d6c2342c88a2
title: 'Maintenance Mode - Set'
title_meta: 'Maintenance Mode - Set'
keywords: ['maintenance', 'agent', 'script', 'time', 'automation']
description: 'This document provides a detailed overview of a script that sets maintenance mode on the target agent, including user parameters, process description, and expected output.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script sets maintenance mode on the target agent.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/5ee3b278-2443-42b9-beab-f5c58f360881/image_1.webp)

### User Parameters

| Name                | Example | Required | Description                                                                 |
|---------------------|---------|----------|-----------------------------------------------------------------------------|
| Time In Minutes     | 300     | True     | The number of minutes to set for maintenance mode. Max 99999.             |

## Process

The script starts maintenance mode with a prompt for how long to set it. Please specify the time when running the script. The maximum time allowed is 99999 minutes. Any number larger than that will cause the script to error out.

## Output

- Script log