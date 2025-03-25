---
id: 'c852661d-3253-466e-ae17-ee2753885920'
slug: /c852661d-3253-466e-ae17-ee2753885920
title: 'EPM - Data Collection - Solution- Azure AD Status'
title_meta: 'EPM - Data Collection - Solution- Azure AD Status'
keywords: ['azure', 'ad', 'status', 'machine', 'agent', 'procedure', 'custom', 'field']
description: 'This document outlines the procedure for checking the Azure AD status of a machine using an agent procedure that updates a custom field for better management and visibility of machine status.'
tags: ['active-directory', 'update']
draft: false
unlisted: false
---

## Purpose

This solution is used to check the Azure AD status of a machine. An agent procedure updates a custom field that allows a view to pull the machines.

## Associated Content

| Content                                                                                       | Type            | Function                                           |
|-----------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------|
| [View Documentation](<../vsa/views/Azure AD Status.md>)                       | View            | Creates the view to allow filtering of the machines |
| [Custom Field Documentation](<../vsa/custom-fields/EPM - Data Collection - Custom Field- Azure AD Status.md>) | Custom Field    | Creates the custom field so that the procedure can update the status |
| [Agent Procedure Documentation](<../vsa/procedures/Azure AD Status.md>)             | Agent Procedure  | The agent procedure updates the system info.       |

## Implementation

- A view needs to be created.
- A custom field needs to be created.
- The agent procedure needs to be run once these are created.



