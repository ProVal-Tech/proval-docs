---
id: '3add591b-445e-440d-a7b3-cc85b2ea0674'
title: 'Autopilot Hash Monitor for Windows Machines'
title_meta: 'Autopilot Hash Monitor for Windows Machines'
keywords: ['autopilot', 'hash', 'monitor', 'windows', 'edf', 'client', 'computer']
description: 'This document outlines the setup and functionality of a monitor designed to detect Windows machines where the Autopilot hash has not been collected. It specifies the conditions under which the monitor operates, including the required client-level and computer-level EDF settings, as well as dependencies on the Get-AutopilotHash script.'
tags: ['monitor', 'windows', 'edf', 'autopilot', 'client', 'computer']
draft: false
unlisted: false
---
## Summary

The purpose of this monitor is to detect the windows machines where Autopilot hash has not been collected yet. It selects the machines where the client-level EDF "Collect Autopilot Hardware Hash" is enabled, the computer-level EDF "Autopilot Hash" is empty, and the script [CWA - Script - Get-AutopilotHash](https://proval.itglue.com/DOC-5078775-17245317) has not been successfully executed on the device within the last 7 days.

## Dependencies

[CWA - Script - Get-AutopilotHash](https://proval.itglue.com/DOC-5078775-17245317)

## Client-Level EDF

| Name                          | Type      | Example | Section   | Required | Description                                   |
|-------------------------------|-----------|---------|-----------|----------|-----------------------------------------------|
| Collect Autopilot Hardware Hash | Check-Box | 0/1     | Autopilot | False    | Mark this EDF to collect Hardware Hash of the machines |

## Computer-Level EDF

| Name          | Type  | Section   | Required | Description                                                                                       |
|---------------|-------|-----------|----------|---------------------------------------------------------------------------------------------------|
| Autopilot Hash | Text  | Autopilot | False    | This EDF is filled by [CWA - Script - Get-AutopilotHash](https://proval.itglue.com/DOC-5078775-17245317). It has not been filled manually. |

## Target

Global

## Alert Template

`△ Custom - Execute Script - Get-AutopilotHash`






