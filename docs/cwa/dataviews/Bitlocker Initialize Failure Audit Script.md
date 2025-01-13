---
id: 'cwa-bitlocker-initialization-failure'
title: 'BitLocker Initialization Failure Records'
title_meta: 'BitLocker Initialization Failure Records'
keywords: ['bitlocker', 'failure', 'records', 'autofix', 'script']
description: 'This document provides a dataview containing records of computers where BitLocker initialization failed twice due to issues encountered by the Autofix script. It outlines the relevant dependencies and details about each computer, including client name, location, operating system, and the number of failed attempts.'
tags: ['bitlocker', 'failure', 'autofix', 'client', 'location', 'computer', 'operating-system']
draft: false
unlisted: false
---
## Summary

This dataview contains the computer record where the BitLocker initialization failed twice by the Autofix script "[Script - Bitlocker - Volume - Initialize [Autofix, Param] - Wrapper](https://proval.itglue.com/DOC-5078775-16716755)".

## Dependencies

[Script - Bitlocker - Volume - Initialize [Autofix, Param] - Wrapper](https://proval.itglue.com/DOC-5078775-16716755)

## Columns

| Column                     | Description                                           |
|---------------------------|-------------------------------------------------------|
| Client                    | Client name of the agent                              |
| Location                  | Location name of the agent                            |
| Computer                  | Computer name of the agent                            |
| Operating System          | Operating system name of the agent                    |
| LastContact               | Last contact of the agent with the CW Automate       |
| Number of Failed Attempts  | The BitLocker initialization failed attempts count    |



