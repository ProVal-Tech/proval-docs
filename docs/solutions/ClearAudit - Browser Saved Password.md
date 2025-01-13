---
id: 'rmm-clear-audit-browser-saved-password'
title: 'Clear or Audit Browser Saved Passwords'
title_meta: 'Clear or Audit Browser Saved Passwords'
keywords: ['browser', 'password', 'audit', 'clear', 'endpoint']
description: 'This document outlines a solution for clearing or auditing saved passwords in browsers from endpoints. It includes associated tasks, dynamic groups, custom fields, and optional monitors to ensure effective password management and security.'
tags: ['audit', 'clear', 'endpoint', 'monitor', 'custom', 'dynamic', 'task']
draft: false
unlisted: false
---
## Purpose

This solution is built to perform the Clear or Audit of the Browsers Saved Password from the endpoints.

## Associated Content

| Content                                                                 | Type           | Function                                                                                                                                                   |
|-------------------------------------------------------------------------|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286) | Task           | This task is designed to perform the Browser Saved Password Audit or Clearance based on the custom fields selected.                                      |
| [Dynamic Groups - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17312581) | Dynamic Groups | The groups below are created to deploy the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286) and audit the failure endpoints where the browser's saved password failed to clear. |
| [Custom Field - Clear/Audit Browsers Saved Password](https://proval.itglue.com/DOC-5078775-17312650) | Custom Fields  | The custom fields described here are used in the creation of [Dynamic Groups - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17312581) and used in the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286). |
| [Monitor - Browser Saved Password Failure Detection](https://proval.itglue.com/DOC-5078775-17312473) | Monitor (Optional) | This monitor is designed to create a ticket for the failure of the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286) in removing the browser-saved passwords. |

## Implementation

- Create the [Custom Field - Clear/Audit Browsers Saved Password](https://proval.itglue.com/DOC-5078775-17312650)
- Create the [Dynamic Groups - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17312581)
- Create the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286) and follow the deployment instructions.
- (Optional) Create the [Monitor - Browser Saved Password Failure Detection](https://proval.itglue.com/DOC-5078775-17312473) and follow the deployment instructions. This should be created only if the partner approves it.

## FAQ






