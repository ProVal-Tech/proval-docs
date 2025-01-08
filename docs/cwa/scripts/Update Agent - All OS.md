---
id: 'cwa-update-agent-script'
title: 'Update Outdated Agents in ConnectWise Automate'
title_meta: 'Update Outdated Agents in ConnectWise Automate'
keywords: ['agent', 'update', 'environment', 'sql', 'version']
description: 'This document details a script designed to pull the highest agent version in a ConnectWise Automate environment and update any outdated agents. It highlights the time saved by automation and provides a sample run for reference.'
tags: ['connectwise', 'automation', 'update', 'software', 'performance']
draft: false
unlisted: false
---
## Summary

The script will pull the highest agent version in the environment and will attempt to update the out of date agent.

Time Saved by Automation: 2 Minutes

## Sample Run

![Sample Run](5078775/docs/8217088/images/11488512)

## Process

- The script will run some SQL to pull the highest agent version in the environment and will attempt to update the agent using those parameters.
- The script is intended to be used with ProVal – Production – Agent – Out of Date

