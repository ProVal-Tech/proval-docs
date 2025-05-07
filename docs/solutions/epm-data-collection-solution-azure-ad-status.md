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
| [View Documentation](/docs/b210a5c3-0c35-4a40-9c04-51fbadd59e8a)                       | View            | Creates the view to allow filtering of the machines |
| [Custom Field Documentation](/docs/ecddbc88-fbef-4678-b02b-2cc19b219fdc) | Custom Field    | Creates the custom field so that the procedure can update the status |
| [Agent Procedure Documentation](/docs/ee5b1d9e-eabf-4be4-ad8c-6192b5223cbb)             | Agent Procedure  | The agent procedure updates the system info.       |

## Implementation

- A view needs to be created.
- A custom field needs to be created.
- The agent procedure needs to be run once these are created.

