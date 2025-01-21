---
id: 'f3c63891-aac1-49f9-a05d-552886c5b6da'
title: 'Collecting AD Users Department Information'
title_meta: 'Collecting AD Users Department Information'
keywords: ['ad', 'users', 'department', 'information', 'collection']
description: 'This document outlines a script designed to collect department information for Active Directory users. It details the dependencies required for the script, the process it follows to gather and store data, and the expected output, including logs and dataviews.'
tags: ['active-directory', 'database', 'report']
draft: false
unlisted: false
---

## Summary

This script collects the department information of Active Directory (AD) users.

## Sample Run

![Sample Run](../../../static/img/Computer-Department-AuditingDV/image_1.png)

## Dependencies

- [plugin_proval_computer_department](<../../unsorted/plugin_proval_computer_department.md>)  
- @Department Detail of AD Users [Script] -- Dataviews  
- @Department Detail of Computer [Script] -- Dataviews  

## Process

This script collects the department information of AD users. It stores the information in the table `plugin_proval_computer_department` and also records the value in the EDF "Computer Department."

## Output

- Script log
- Table `plugin_proval_computer_department`
- Dataview
- etc.

