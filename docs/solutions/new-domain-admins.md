---
id: '35a03717-5ade-46fb-b396-10a277043788'
slug: /35a03717-5ade-46fb-b396-10a277043788
title: 'New Domain Admins'
title_meta: 'New Domain Admins'
keywords: ['domain', 'admin', 'alert', 'monitoring', 'security']
description: 'This document outlines a solution to monitor for newly created or promoted domain admins within an Active Directory environment and generate alerts accordingly. It includes associated content and implementation steps to ensure proper setup and functionality.'
tags: ['active-directory', 'security', 'setup']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to monitor for newly created or promoted domain admins and generate alerts.

## Associated Content

| Content | Type | Function |
|---------|------|----------|
| [Machine Group - Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68) | Group | Stores the Domain Controllers in a single place. |
| [Custom Field - Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae) | Custom Field | Used to determine whether a Domain Controller is an infrastructure master or not. |
| [Task - Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168) | Task | Validates whether a computer is an infrastructure master or not and updates the custom field [Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae). |
| [Machine Group - Infrastructure Master](/docs/c2c2d22b-f735-4ec5-91a6-a014ab2e84a8) | Group | Stores all the available infrastructure masters in a single place. |
| [Custom Field - New Domain Admins](/docs/376db2a5-e76b-426f-b696-6791c83ab626) | Custom Field | Stores the information of the new domain admins returned by the [New Domain Admins](/docs/a96db8f9-87fc-4e02-a1b3-2ed60913fc82) task. |
| [Task - New Domain Admins](/docs/a96db8f9-87fc-4e02-a1b3-2ed60913fc82) | Task | Checks and returns the newly detected domain admin(s) since the previous execution of the task. |

## Implementation

- Read all the associated documents carefully.
- Create the custom field: [Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae).
- Create the Machine Group: [Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68).
- Create the task: [Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168).
- Create the deployment schedule as described in this document: [Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168).
- Create the custom field: [New Domain Admins](/docs/376db2a5-e76b-426f-b696-6791c83ab626).
- Create the Machine Group: [Infrastructure Master](/docs/c2c2d22b-f735-4ec5-91a6-a014ab2e84a8).
- Create the task: [New Domain Admins](/docs/a96db8f9-87fc-4e02-a1b3-2ed60913fc82).
- Create the deployment schedule as described in this document: [New Domain Admins](/docs/a96db8f9-87fc-4e02-a1b3-2ed60913fc82).