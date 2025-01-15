---
id: '71cf5ece-22b7-4b19-b4e8-6a048b2c2ecc'
title: 'Script Summary Dataview'
title_meta: 'Script Summary Dataview'
keywords: ['dataview', 'scripts', 'summary', 'log', 'retention']
description: 'This document provides an overview of a Dataview that displays a summary of all scripts run over the specified script log retention days, including total runs, failures, successes, and effectiveness metrics.'
tags: ['database', 'report', 'configuration', 'performance', 'windows']
draft: false
unlisted: false
---
## Summary

This Dataview displays a summary of all scripts run over the set script log retention days. It displays the total runs, failures, successes, and the scripts effectiveness. The Script log retention days can be seen at the automate location below:

![Script Log Retention Days](../../../static/img/Scripts-Effectiveness-Audit/image_1.png)

## Columns

| Column              | Description                          |
|---------------------|--------------------------------------|
| Script Name         | Name of the script                   |
| Script Path         | Path to the script                   |
| Total Runs          | Number of times it ran               |
| Failure             | Number of times it Failed            |
| Success             | Number of times it Succeed           |
| Effective Percent    | Effective percent of Success         |
| Script Last Run     | This shows the last run of the script|

## Example Screenshot

![Example Screenshot](../../../static/img/Scripts-Effectiveness-Audit/image_2.png)






