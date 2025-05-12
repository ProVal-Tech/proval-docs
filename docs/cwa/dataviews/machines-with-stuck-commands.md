---
id: '60b06d7b-2357-4fbd-a13c-92288169adf5'
slug: /60b06d7b-2357-4fbd-a13c-92288169adf5
title: 'Machines with Stuck Commands'
title_meta: 'Machines with Stuck Commands'
keywords: ['machines', 'command', 'execution', 'report', 'status']
description: 'This document provides a detailed report on machines where a specific command has been stuck in the execution state for an extended period, typically exceeding one hour. It includes various columns such as Client ID, Computer ID, Operating System, and more to help identify and troubleshoot issues.'
tags: ['report', 'windows']
draft: false
unlisted: false
---

## Summary

The dataview displays information about machines where a specific command has been stuck in the execution state for an extended period, typically exceeding one hour.

## Columns

| Column                   | Description                           |
|--------------------------|---------------------------------------|
| Client ID                | Client ID (Hidden)                   |
| Location ID              | Location ID (Hidden)                 |
| Computer ID              | Computer ID                           |
| Client                   | Client Name                           |
| Location                 | Location Name                         |
| Computer                 | Computer Name                         |
| Operating System         | Operating System                      |
| Last Contact             | Last Contact with RMM                |
| Last Logged-In User      | Last Logged-In User                   |
| Form Factor              | Form Factor                           |
| Stuck Command            | Command that is Stuck                |
| Command Parameter        | Parameter of the Stuck Command       |
| Date Updated             | Start time of the command            |
| Stuck Since (Hours)     | Duration the command has been stuck   |