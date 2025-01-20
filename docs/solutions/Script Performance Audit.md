---
id: '057846ab-0c3b-4812-82f9-e514933cad42'
title: 'Dataviews for Script Performance and Historical Data'
title_meta: 'Dataviews for Script Performance and Historical Data'
keywords: ['dataview', 'performance', 'historical', 'audit', 'scripts']
description: 'This document outlines three dataviews designed to showcase the performance, historical, and descriptive details of scripts within an environment. It includes instructions for implementation, associated content, and answers to frequently asked questions regarding the dataviews.'
tags: ['performance', 'setup', 'software']
draft: false
unlisted: false
---
## Purpose

The solution comprises three dataviews designed to showcase the performance, historical, and descriptive details of the scripts.

## Associated Content

| Content                                                                 | Type      | Function                                                              |
|-------------------------------------------------------------------------|-----------|----------------------------------------------------------------------|
| [Dataview - Script List](<../cwa/dataviews/Script List.md>) | Dataview  | Displays the basic information of the scripts present in the environment. |
| [Dataview - Script Effectiveness Performance Audit](<../cwa/dataviews/Script Effectiveness Performance Audit.md>) | Dataview  | Displays the performance audit of the scripts present in the environment. |
| [Dataview - Script Run Time Historical Audit](<../cwa/dataviews/Script Run Time Historical Audit.md>) | Dataview  | Displays the historical run-time data of the scripts present in the environment. |

## Implementation

1. Remove the following dataviews if they are present in the environment:
   - Script List (replaced by [Script List](<../cwa/dataviews/Script List.md>))
   - Script Effectiveness Performance Audit (replaced by [Script Effectiveness Performance Audit](<../cwa/dataviews/Script Effectiveness Performance Audit.md>))
   - Script Effectiveness Audit (replaced by [Script Effectiveness Performance Audit](<../cwa/dataviews/Script Effectiveness Performance Audit.md>))
   - Script Engine + Time Saved (replaced by [Script Run Time Historical Audit](<../cwa/dataviews/Script Run Time Historical Audit.md>))

2. Import the following dataviews from the `ProSync` plugin:
   - [Dataview - Script List](<../cwa/dataviews/Script List.md>)
   - [Dataview - Script Effectiveness Performance Audit](<../cwa/dataviews/Script Effectiveness Performance Audit.md>)
   - [Dataview - Script Run Time Historical Audit](<../cwa/dataviews/Script Run Time Historical Audit.md>)

3. Reload the System Cache  
   ![System Cache](../../static/img/Script-Performance-Audit/image_1.png)

## FAQ

**Q:** Is it feasible to consolidate these dataviews into a single dataview?  
**A:** While it is technically possible to merge these dataviews into one, it's important to note that the resulting dataview will not function reliably due to the complexity of calculations and the volume of data processed to generate these views.












