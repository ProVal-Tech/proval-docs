---
id: 'ps-set-display-scaling'
title: 'Set Custom Display Scaling for Windows Users'
title_meta: 'Set Custom Display Scaling for Windows Users'
keywords: ['display', 'scaling', 'windows', 'users', 'script']
description: 'This document provides a script to set custom display scaling on existing and new users for Windows machines. It includes user parameters, sample runs, and dependencies for successful execution.'
tags: ['configuration', 'windows', 'performance', 'setup']
draft: false
unlisted: false
---
## Summary

This script sets custom Display scaling on existing as well as new users for windows machines.

## Sample Run

![Sample Run](..\..\..\static\img\Set-DisplayScaling\image_1.png)

## Dependencies

[Agnostic - Set-DisplayScaling](https://proval.itglue.com/DOC-5078775-16343605)

## User Parameters

| Name            | Example | Required | Description                                                                                                                                                          |
|-----------------|---------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ScalePercentage  | 150     | True     | Enter One of the scaling percentages from the below option:                                                                                                        |
|                 |         |          | - 100 - to maximize the windows zoom to 100%                                                                                                                     |
|                 |         |          | - 125 - to maximize the windows zoom to 125%                                                                                                                     |
|                 |         |          | - 150 - to maximize the windows zoom to 150%                                                                                                                     |
|                 |         |          | - 175 - to maximize the windows zoom to 175%                                                                                                                     |
|                 |         |          | - 200 - to maximize the windows zoom to 200%                                                                                                                     |

## Output

- Script log


