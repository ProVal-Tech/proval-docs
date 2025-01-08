---
id: 'cwa_update-agent-all-os'
title: 'Update Agent - All OS'
title_meta: 'Update Agent - All OS'
keywords: ['automate', 'agent', 'update', 'version', 'monitor']
description: 'This document provides a summary of a monitor that identifies machines lacking the latest Automate agent. It determines the maximum agent version by querying the database for the highest version installed based on the operating system. An Autofix feature is available to attempt updating agents.'
tags: ['automate', 'update', 'monitor', 'version', 'software']
draft: false
unlisted: false
---
## Summary

This monitor looks for machines that do not have the newest Automate agent. Determines the max agent version by checking the database for the highest version installed based on OS. There is an available Autofix that will attempt to update agents. The script is named @Update Agent - All OS.

## Dependencies

None

## Target

All Agents - Should be run on all machines.

