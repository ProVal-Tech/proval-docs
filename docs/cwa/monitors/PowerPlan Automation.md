---
id: 'ps-internal-monitor-power-plan-automation'
title: 'Internal Monitor for Power Plan Automation'
title_meta: 'Internal Monitor for Power Plan Automation'
keywords: ['monitor', 'power', 'plan', 'automation', 'edf']
description: 'This document outlines the functionality of the internal monitor that detects machines with unavailable Power Plans set in the Client-Level EDF "PowerPlan Name" when Power Plan Automation is enabled. It also includes dependencies and alert template information.'
tags: ['monitoring', 'power', 'automation', 'edf', 'configuration']
draft: false
unlisted: false
---
## Summary

The internal monitor will detect machines where the Power Plan set in the Client-Level EDF "PowerPlan Name" EDF is not available, and Power Plan Automation is enabled.

## Dependencies

[EPM - Windows Configuration - Script - Power Plan - Set/Create](https://proval.itglue.com/DOC-5078775-15053772)

## Target

Global

## Alert Template

Name: `△ Custom - PowerPlan Automation`


