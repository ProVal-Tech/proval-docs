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
| [EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status](/docs/71ac312f-e490-4126-bc2d-f9c07f5582cf) | Script        | Queries ConnectWise Control API to find all agents' online status |
| [EPM - Data Collection - Custom Table - plugin_proval_control_session_status](/docs/d468b194-6df4-46b0-8dbc-657b623209ff) | Custom Table  | Holds values from Get - CW-Control - Online Status        |
| [EPM - Data Collection - Dataview - Agent online status check CWC to CWA](/docs/36dec374-8bc6-4fda-a273-4e4a1af2f6f7) | Dataview      | Displays the data from the custom table compared to the state in Automate. |