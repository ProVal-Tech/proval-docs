---
id: 'fdbe1912-b216-4876-b64b-db83eee691a1'
title: 'EPM Data Collection Script Power Plan Audit'
title_meta: 'EPM Data Collection Script Power Plan Audit'
keywords: ['epm', 'script', 'audit', 'power', 'plan', 'collection']
description: 'This document outlines the execution of the EPM Data Collection Script for auditing power plans on managed Windows workstations. It details dependencies, target systems, and the alert template configuration for automated monitoring.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The internal monitor executes the [EPM - Data Collection - Script - Power Plan - Audit [DV]](<../scripts/Power Plan - Audit DV.md>) script once per week against the physical Windows workstations.

## Dependencies

- [EPM - Data Collection - Script - Power Plan - Audit [DV]](<../scripts/Power Plan - Audit DV.md>)
- [EPM - Data Collection - Custom Table - pvl_powerplan_audit](<../tables/pvl_powerplan_audit.md>)

## Target

Managed Workstations  

![Image](../../../static/img/Execute-Script---Power-Plan---Audit/image_1.png)

## Alert Template

**Name:** `△ Custom - Execute Script - Power Plan - Audit`  

![Image](../../../static/img/Execute-Script---Power-Plan---Audit/image_2.png)  

The alert template should execute the [EPM - Data Collection - Script - Power Plan - Audit [DV]](<../scripts/Power Plan - Audit DV.md>) script.  

![Image](../../../static/img/Execute-Script---Power-Plan---Audit/image_3.png)  


