---
id: 'ffef0ee2-6b6c-43df-ab5a-ef2dbc702325'
slug: /ffef0ee2-6b6c-43df-ab5a-ef2dbc702325
title: 'Check Windows Home Edition Status'
title_meta: 'Check Windows Home Edition Status'
keywords: ['check','home','edition']
description: 'Detects whether the installed Windows OS is a Home edition and updates the NinjaOne custom field with the result.'
tags: ['windows','custom-fields','auditing']
draft: false
unlisted: false
---

## Overview

Detects whether the installed Windows operating system is a Home edition by checking the OS Caption value. Displays True if the operating system name contains Home, otherwise displays False.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/ffef0ee2-6b6c-43df-ab5a-ef2dbc702325/scriptrun.webp)

## Dependencies

- [Custom Field - cPVAL Windows Home Edition Status](/docs/4a1a47e3-19f1-4dba-be3c-be633cd52979)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/check-windows-home-edition.ps1)

## Output

- Activity Details  
- Custom Field
