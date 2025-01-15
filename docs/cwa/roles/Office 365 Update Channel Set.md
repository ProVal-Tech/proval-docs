---
id: '53cae8ee-21f7-4648-9ae4-5ee9d74af357'
title: 'Office 365 Update Channel Detection'
title_meta: 'Office 365 Update Channel Detection for Agents'
keywords: ['office365', 'update', 'detection', 'registry', 'agent']
description: 'This document provides details on how to identify whether an agent has an Office 365 Update Channel set in the registry, including the detection string and applicable operating systems.'
tags: ['windows', 'configuration', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

This role denotes that the agent has an Office 365 Update Channel set in the registry.

## Settings

| Detection String                                          | Comparator | Result | Applicable OS |
|----------------------------------------------------------|------------|--------|----------------|
| {%-HKLM/SOFTWARE/Microsoft/Office/ClickToRun/Configura... | Exists     |        | Windows OS     |







