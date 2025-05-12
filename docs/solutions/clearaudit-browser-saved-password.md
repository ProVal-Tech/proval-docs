---
id: '3fb9240d-0256-481b-b1d3-0415b707850f'
slug: /3fb9240d-0256-481b-b1d3-0415b707850f
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
| [Task - Clear/Audit - Browser Saved Password](/docs/a56e605b-a1d4-45ea-bebb-4411f3890f7e) | Task           | This task is designed to perform the browser saved password audit or clearance based on the custom fields selected.                                      |
| [Dynamic Groups - Browser Saved Password](/docs/a9b4c5f1-c1bb-4e0d-8a2f-fad1bca51d47) | Dynamic Groups | The groups below are created to deploy the [Task - Clear/Audit - Browser Saved Password](/docs/a56e605b-a1d4-45ea-bebb-4411f3890f7e) and audit the endpoints where the browser's saved passwords failed to clear. |
| [Custom Field - Clear/Audit Browsers Saved Password](/docs/5059a874-fdcd-4b78-989f-a0fd5184d7ce) | Custom Fields  | The custom fields described here are used in the creation of [Dynamic Groups - Browser Saved Password](/docs/a9b4c5f1-c1bb-4e0d-8a2f-fad1bca51d47) and in the [Task - Clear/Audit - Browser Saved Password](/docs/a56e605b-a1d4-45ea-bebb-4411f3890f7e). |
| [Monitor - Browser Saved Password Failure Detection](/docs/62efcaa3-e03b-4500-a48a-f472a82f039f) | Monitor (Optional) | This monitor is designed to create a ticket for the failure of the [Task - Clear/Audit - Browser Saved Password](/docs/a56e605b-a1d4-45ea-bebb-4411f3890f7e) in removing the browser-saved passwords. |

## Implementation

- Create the [Custom Field - Clear/Audit Browsers Saved Password](/docs/5059a874-fdcd-4b78-989f-a0fd5184d7ce)
- Create the [Dynamic Groups - Browser Saved Password](/docs/a9b4c5f1-c1bb-4e0d-8a2f-fad1bca51d47)
- Create the [Task - Clear/Audit - Browser Saved Password](/docs/a56e605b-a1d4-45ea-bebb-4411f3890f7e) and follow the deployment instructions.
- (Optional) Create the [Monitor - Browser Saved Password Failure Detection](/docs/62efcaa3-e03b-4500-a48a-f472a82f039f) and follow the deployment instructions. This should be created only if the partner approves it.

## FAQ