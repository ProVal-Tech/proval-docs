---
id: '73399399-1acc-444b-bf16-73f6b534a35b'
slug: /73399399-1acc-444b-bf16-73f6b534a35b
title: 'Patch Not Set - Count'
title_meta: 'Patch Not Set - Count'
keywords: ['patches', 'approval', 'policy', 'client', 'automation', 'sql', 'tickets']
description: 'This document outlines a script that counts the number of patches that have not been actioned in any approval policy within a client environment. It highlights the time saved by automation and provides details on global parameters and the process involved in executing the script.'
tags: ['report', 'security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script counts the number of patches that have not been actioned in any approval policy within the client environment.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/73399399-1acc-444b-bf16-73f6b534a35b/image_1.png)

#### Global Parameters

| Name      | Example | Required | Description                                                                                      |
|-----------|---------|----------|--------------------------------------------------------------------------------------------------|
| Threshold | 10      | True     | This sets the limit to check for not set patches over which a ticket will be created.          |

## Process

This script runs a SQL query to check for the count of patches that have not been actioned via any approval policy and are left as Not Set.

## Output

- Script log

