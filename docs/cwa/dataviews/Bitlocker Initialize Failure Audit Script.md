---
id: '3c6d0ec7-4954-4116-b8ba-329c13cd2143'
title: 'BitLocker Initialization Failure Records'
title_meta: 'BitLocker Initialization Failure Records'
keywords: ['bitlocker', 'failure', 'records', 'autofix', 'script']
description: 'This document provides a dataview containing records of computers where BitLocker initialization failed twice due to issues encountered by the Autofix script. It outlines the relevant dependencies and details about each computer, including client name, location, operating system, and the number of failed attempts.'
tags: ['bitlocker']
draft: false
unlisted: false
---

## Summary

This dataview contains the computer records where BitLocker initialization failed twice due to the Autofix script "[Script - Bitlocker - Volume - Initialize [Autofix, Param] - Wrapper](<../scripts/Bitlocker - Volume - Initialize Autofix,Param - Wrapper.md>)".

## Dependencies

[Script - Bitlocker - Volume - Initialize [Autofix, Param] - Wrapper](<../scripts/Bitlocker - Volume - Initialize Autofix,Param - Wrapper.md>)

## Columns

| Column                     | Description                                           |
|---------------------------|-------------------------------------------------------|
| Client                    | Client name of the agent                              |
| Location                  | Location name of the agent                            |
| Computer                  | Computer name of the agent                            |
| Operating System          | Operating system name of the agent                    |
| Last Contact              | Last contact of the agent with the CW Automate       |
| Number of Failed Attempts  | The count of BitLocker initialization failure attempts |

