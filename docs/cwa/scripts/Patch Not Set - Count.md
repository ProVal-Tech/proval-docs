---
id: 'cwa-count-not-actioned-patches'
title: 'Count Not Actioned Patches'
title_meta: 'Count Not Actioned Patches in ConnectWise Automate'
keywords: ['patches', 'approval', 'policy', 'client', 'automation', 'sql', 'tickets']
description: 'This document outlines a script that counts the number of patches that have not been actioned in any approval policy within a client environment. It highlights the time saved by automation and provides details on global parameters and the process involved in executing the script.'
tags: ['configuration', 'report', 'security', 'software', 'windows']
draft: false
unlisted: false
---
## Summary

This script will count the number of patches which has not been actioned in any approval policy at the client environment.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\Patch-Not-Set---Count\image_1.png)

#### Global Parameters

| Name      | Example | Required | Description                                                                                      |
|-----------|---------|----------|--------------------------------------------------------------------------------------------------|
| Threshold | 10      | True     | This sets to set limit to check for not set patches over which ticket will be created.          |

## Process

This script runs a SQL query to check for the patches count which has not been actioned via any approval policy and left as Not Set.

## Output

- Script log


