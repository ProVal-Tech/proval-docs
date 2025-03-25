---
id: '55a527b6-7b59-4f67-9b1d-1ed421199363'
slug: /55a527b6-7b59-4f67-9b1d-1ed421199363
title: 'Get - CW-ControlAPI-Online Status'
title_meta: 'Get - CW-ControlAPI-Online Status'
keywords: ['connectwise', 'automate', 'control', 'devices', 'comparison', 'repair']
description: 'This document outlines a solution for comparing online devices between ConnectWise Automate and ConnectWise Control, identifying if any repair actions are necessary for either platform. It includes associated content such as scripts and custom tables that facilitate this comparison.'
tags: ['connectwise']
draft: false
unlisted: false
---

## Purpose

This solution provides a way to compare ConnectWise Automate online devices with ConnectWise Control online devices to determine if repair actions are needed for either platform.

## Associated Content

| Content                                                                                       | Type          | Function                                                  |
|-----------------------------------------------------------------------------------------------|---------------|-----------------------------------------------------------|
| [EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status](<../cwa/scripts/Get - CW-ControlAPI - Online Status.md>) | Script        | Queries ConnectWise Control API to find all agents' online status |
| [EPM - Data Collection - Custom Table - plugin_proval_control_session_status](<../cwa/tables/plugin_proval_control_session_status.md>) | Custom Table  | Holds values from Get - CW-Control - Online Status        |
| [EPM - Data Collection - Dataview - Agent online status check CWC to CWA](<../cwa/dataviews/Agent online status check CWC to CWA.md>) | Dataview      | Displays the data from the custom table compared to the state in Automate. |


