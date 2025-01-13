---
id: 'cwa-audit-excluded-patching'
title: 'Audit Excluded Patching in Automate'
title_meta: 'Audit Excluded Patching in Automate'
keywords: ['audit', 'patching', 'machines', 'excluded', 'automate']
description: 'This document provides a dataview that helps you audit machines that are excluded from patching within ConnectWise Automate. It outlines the necessary columns and their descriptions for efficient tracking and management.'
tags: ['audit', 'client', 'computer', 'location', 'os', 'policy', 'status']
draft: false
unlisted: false
---
## Summary

This dataview helps you audit machines which are excluded from patching inside automate.

## Dependencies

None

## Columns

| Column                  | Description                                                 |
|------------------------|-------------------------------------------------------------|
| Client                 | The client name of the detected machine                     |
| Computer ID            | The computer ID of the detected machine                     |
| Location               | The location name of the detected machine                   |
| Computer               | The computer name of the detected machine                   |
| OS                     | The operating system of the detected machine                |
| Last Contact           | The last check-in time of the detected machine              |
| Install Policy         | The Install policy that is applied on the machine           |
| Onboarding Completed    | The status of onboarding, whether the machine has completed onboarding or not |


