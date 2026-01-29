---
id: 'fdbe1912-b216-4876-b64b-db83eee691a1'
slug: /fdbe1912-b216-4876-b64b-db83eee691a1
title: 'Execute Script - Power Plan - Audit'
title_meta: 'Execute Script - Power Plan - Audit'
keywords: ['epm', 'script', 'audit', 'power', 'plan', 'collection']
description: 'This document outlines the execution of the EPM Data Collection Script for auditing power plans on managed Windows workstations. It details dependencies, target systems, and the alert template configuration for automated monitoring.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The internal monitor executes the [Power Plan - Audit [DV]](/docs/6e9ec56b-ba57-48cd-8dff-e659c30d2f3d) script once per week against the physical Windows workstations.

## Dependencies

- [Script - Power Plan - Audit [DV]](/docs/6e9ec56b-ba57-48cd-8dff-e659c30d2f3d)
- [Custom Table - pvl_powerplan_audit](/docs/9560f2db-f58f-4c07-a9da-2828deabc4cf)
- [Solution - Power Plan Management](/docs/e7911ff5-d709-4ba0-b847-16969445c19b/)


## Target

Managed Workstations  

![Image](../../../static/img/docs/fdbe1912-b216-4876-b64b-db83eee691a1/image_1.webp)

## Alert Template

**Name:** `△ Custom - Execute Script - Power Plan - Audit`  

![Image](../../../static/img/docs/fdbe1912-b216-4876-b64b-db83eee691a1/image_2.webp)  

The alert template should execute the [Power Plan - Audit [DV]](/docs/6e9ec56b-ba57-48cd-8dff-e659c30d2f3d) script.  

![Image](../../../static/img/docs/fdbe1912-b216-4876-b64b-db83eee691a1/image_3.webp)  