---
id: '62c75166-da9a-4b8a-ae44-1be7a7076401'
title: 'Clear Duplicate Entries from Scriptstate Table'
title_meta: 'Clear Duplicate Entries from Scriptstate Table'
keywords: ['duplicate', 'scriptstate', 'sql', 'cleanup', 'database']
description: 'This document provides a detailed guide on how to clear duplicate entries from the scriptstate table in a client script. It includes sample runs, variable descriptions, and a step-by-step process to effectively manage and schedule the cleanup of duplicate entries on a daily basis.'
tags: ['cleanup', 'database', 'sql']
draft: false
unlisted: false
---

## Summary

This document outlines the process to clear duplicate entries from the scriptstate table.  
It is a client script that can be scheduled to run once per day.

## Sample Run

This script is to be scheduled as a client script.  
![Sample Run Image](../../../static/img/Remove-Duplicates-from-ScriptState-Table/image_1.png)

## Variables

| Name               | Description                                                                                           |
|--------------------|-------------------------------------------------------------------------------------------------------|
| @Count@            | Saves the total number of duplicate variables per script per computer                                 |
| @SqlScriptid@      | Distinct Scriptid                                                                                     |
| @SqlComputerid@    | Distinct Computerid                                                                                   |
| @SqlVariable@      | Distinct Variable                                                                                     |
| @SqlNumberofValues@| Total number of duplicate entries for the distinct variable for the distinct computer for the distinct scriptid |
| @Limit@            | @SqlNumberofValues - 1                                                                                |
| %sqlresult%        | Used to refresh the loop counter                                                                       |

## Process

**Step 1:** Fetch the total number of duplicate entries per scriptid, per computerid, and per variable from the scriptstate table using the following SQL query:  
```sql
SELECT scriptid, variable, computerid, COUNT(*) AS NumberofValues 
FROM scriptstate 
GROUP BY scriptid, variable, computerid 
HAVING NumberofValues > 1;
```

**Step 2:** Exit if the total number of results from the above step is zero.  

**Step 3:** Run a loop to delete all the duplicate entries for each script state per computer per script.
