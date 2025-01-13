---
id: 'cwa-setup-local-overrides'
title: 'Setting Up Local Overrides for Patch Policies'
title_meta: 'Setting Up Local Overrides for Patch Policies'
keywords: ['local', 'overrides', 'patch', 'policy', 'automation']
description: 'This document outlines a script that facilitates the setup of local overrides on machines to prevent them from being patched. It details the process of checking for existing policies, creating new ones if necessary, and logging the actions taken. The script aims to save time by automating the management of patch policies.'
tags: ['configuration', 'security', 'setup', 'report']
draft: false
unlisted: false
---
## Summary

The script is useful in setting up local overrides on that machines so that they won't get patched.

Time Saved by Automation: 15 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\Local-Override---Create-and-Set-Do-Not-Patch-Policy\image_1.png)

## Variables

- `@Policy@` - Checks for any existing DO NOT PATCH policy.
- `@CheckPolicy@` - Checks if the policy is successfully created.

## Process

- Script checks for any existing DO NOT PATCH policy and if it exists then sets that policy as a local override on the machine.
- If there is no existing patch policy then it creates one and checks whether the policy is successfully created or not.
- If the policy is successfully created then it sets that policy as a local override.

## Output

- Script log


