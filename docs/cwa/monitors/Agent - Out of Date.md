---
id: 'e0471432-a947-47c6-8453-c2554bacc96f'
title: 'Update Agent - All OS'
title_meta: 'Update Agent - All OS'
keywords: ['automate', 'agent', 'update', 'version', 'monitor']
description: 'This document provides a summary of a monitor that identifies machines lacking the latest Automate agent. It determines the maximum agent version by querying the database for the highest version installed based on the operating system. An Autofix feature is available to attempt updating agents.'
tags: ['software', 'update']
draft: false
unlisted: false
---

## Summary

This monitor looks for machines that do not have the newest Automate agent. It determines the maximum agent version by checking the database for the highest version installed based on the operating system. An Autofix feature is available that will attempt to update agents. The script is named `@Update Agent - All OS`.

## Dependencies

None

## Target

All Agents - This monitor should be run on all machines.
