---
id: '3fb9240d-0256-481b-b1d3-0415b707850f'
title: 'ClearAudit - Browser Saved Password'
title_meta: 'ClearAudit - Browser Saved Password'
keywords: ['browser', 'password', 'audit', 'clear', 'endpoint']
description: 'This document outlines a solution for clearing or auditing saved passwords in browsers from endpoints. It includes associated tasks, dynamic groups, custom fields, and optional monitors to ensure effective password management and security.'
tags: []
draft: false
unlisted: false
---

## Purpose

This solution is designed to perform the clearing or auditing of saved passwords in browsers from endpoints.

## Associated Content

| Content                                                                 | Type           | Function                                                                                                                                                   |
|-------------------------------------------------------------------------|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Task - Clear/Audit - Browser Saved Password](<../cwrmm/tasks/ClearAudit - Browser Saved Password.md>) | Task           | This task is designed to perform the browser saved password audit or clearance based on the custom fields selected.                                      |
| [Dynamic Groups - Browser Saved Password](<../cwrmm/groups/Browser Saved Password.md>) | Dynamic Groups | The groups below are created to deploy the [Task - Clear/Audit - Browser Saved Password](<../cwrmm/tasks/ClearAudit - Browser Saved Password.md>) and audit the endpoints where the browser's saved passwords failed to clear. |
| [Custom Field - Clear/Audit Browsers Saved Password](<../cwrmm/custom-fields/ClearAudit Browsers Saved Password.md>) | Custom Fields  | The custom fields described here are used in the creation of [Dynamic Groups - Browser Saved Password](<../cwrmm/groups/Browser Saved Password.md>) and in the [Task - Clear/Audit - Browser Saved Password](<../cwrmm/tasks/ClearAudit - Browser Saved Password.md>). |
| [Monitor - Browser Saved Password Failure Detection](<../cwrmm/monitors/Browser Saved Password Failure Detection.md>) | Monitor (Optional) | This monitor is designed to create a ticket for the failure of the [Task - Clear/Audit - Browser Saved Password](<../cwrmm/tasks/ClearAudit - Browser Saved Password.md>) in removing the browser-saved passwords. |

## Implementation

- Create the [Custom Field - Clear/Audit Browsers Saved Password](<../cwrmm/custom-fields/ClearAudit Browsers Saved Password.md>)
- Create the [Dynamic Groups - Browser Saved Password](<../cwrmm/groups/Browser Saved Password.md>)
- Create the [Task - Clear/Audit - Browser Saved Password](<../cwrmm/tasks/ClearAudit - Browser Saved Password.md>) and follow the deployment instructions.
- (Optional) Create the [Monitor - Browser Saved Password Failure Detection](<../cwrmm/monitors/Browser Saved Password Failure Detection.md>) and follow the deployment instructions. This should be created only if the partner approves it.

## FAQ






