---
id: '625fc28a-23a7-4cb7-beeb-ad5b659af2ab'
slug: /625fc28a-23a7-4cb7-beeb-ad5b659af2ab
title: 'PowerPlan Automation'
title_meta: 'PowerPlan Automation'
keywords: ['monitor', 'power', 'plan', 'automation', 'edf']
description: 'This document outlines the functionality of the internal monitor that detects machines with unavailable Power Plans set in the Client-Level EDF "PowerPlan Name" when Power Plan Automation is enabled. It also includes dependencies and alert template information.'
tags: []
draft: false
unlisted: false
---

## Summary

The internal monitor will detect machines where the Power Plan set in the Client-Level EDF "PowerPlan Name" is not available, and Power Plan Automation is enabled.

## Dependencies

[EPM - Windows Configuration - Script - Power Plan - Set/Create](/docs/8d2a9b84-38b6-460f-9e9e-3992ea6fd448)

## Target

Global

## Alert Template

Name: `△ Custom - PowerPlan Automation`


