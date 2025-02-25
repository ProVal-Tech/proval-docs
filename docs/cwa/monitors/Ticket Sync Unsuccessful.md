---
id: '1fa27f5d-ca9d-4bff-8776-569a15f772d3'
title: 'Ticket Sync Unsuccessful'
title_meta: 'Ticket Sync Unsuccessful'
keywords: ['ticket', 'sync', 'monitor', 'psa', 'automate']
description: 'This document outlines a monitor for identifying tickets within ConnectWise Automate that have failed to sync successfully to the PSA. It includes dependencies and target details for effective implementation.'
tags: ['connectwise']
draft: false
unlisted: false
---

## Summary

This monitor looks for tickets within Automate that have failed to sync successfully to the PSA.

## Dependencies

[Ticket Sync Failed](<../scripts/Ticket Sync Failed.md>) - This needs to be tied as an Autofix with this Monitor.  

- **Autofix**: The Ticket Sync Failed alert template should be used along with this monitor set.

## Target

Global