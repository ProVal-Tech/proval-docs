---
id: 'd3b1689c-fd8d-492a-91e7-ee5670f4a415'
slug: /d3b1689c-fd8d-492a-91e7-ee5670f4a415
title: 'ProVal Production - MSRT Disable/Uninstall'
title_meta: 'ProVal Production - MSRT Disable/Uninstall'
keywords: ['Software', 'Malicious', 'MSRT', 'MRT', 'Scanner', 'Security']
description: 'This monitor detects the online Windows 10/11 where the MSRT disable/uninstall EDF is checked and exclusions are not checked and ignores the agent where the disable/uninstall was already done.'
tags: ['security']
draft: false
unlisted: false
---

## Summary

This monitor detects the online Windows 10/11 where the MSRT disable/uninstall EDF is checked and exclusions are not checked and ignores the agent where the disable/uninstall was already done.

## Dependencies

[Malicious Software Removal Tool Disable/Uninstall](/docs/21c23057-f81d-11ef-87d3-8600008a66b7)

## Implementation

The monitor can be imported normally.
Run this internal monitor with the alert template `△ Custom - Execute Script - MSRT Disable/Uninstall` that runs the script [Malicious Software Removal Tool Disable/Uninstall](/docs/21c23057-f81d-11ef-87d3-8600008a66b7) to disable the MSRT and uninstall its patches completely.

## EDFs

This monitor depends on the following EDFs that needed to be imported using script [Malicious Software Removal Tool Disable/Uninstall](/docs/21c23057-f81d-11ef-87d3-8600008a66b7) during import by running it with user parameter Set_Environment = 1 on any random machine.

Refer to the script document on how to run it in the sample run screenshot:

| Name                      | Type     | Level   |Section    | Example                               | Description                                                                 |
|---------------------------|----------|---------|---------|---------------------------------------|-----------------------------------------------------------------------------|
| MSRT Disable/Uninstall    | Checkbox | Client  |Software    | 1 or 0                                | This checkbox ensures the agents of the client get its MSRT disabled and uninstalled |
| Exclude MSRT Disable/Uninstall | Checkbox | Location | Exclusions    | 1 or 0                                | This checkbox excludes the agents of the location from the MSRT disabling   |
| Exclude MSRT Disable/Uninstall | Checkbox | Computer | Exclusions    |1 or 0                                | This checkbox excludes the agent from the MSRT disabling                    |
| MSRT Scanner Result       | Text     | Computer | Software    |No Infection Found -- 2025-03-03 10:00:00 | This stores the scanner or MSRT disabling output and the date when the last changes were made |

## Target

Global


## Alert Template

`△ Custom - Execute Script - MSRT Disable/Uninstall`