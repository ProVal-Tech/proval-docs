---
id: '72fc5a6e-e66e-4a02-bfef-4419f3c9709c'
slug: /72fc5a6e-e66e-4a02-bfef-4419f3c9709c
title: 'Local Override - Create and Set Do Not Patch Policy'
title_meta: 'Local Override - Create and Set Do Not Patch Policy'
keywords: ['local', 'overrides', 'patch', 'policy', 'automation']
description: 'This document outlines a script that facilitates the setup of local overrides on machines to prevent them from being patched. It details the process of checking for existing policies, creating new ones if necessary, and logging the actions taken. The script aims to save time by automating the management of patch policies.'
tags: ['report', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

The script is useful for setting up local overrides on machines so that they won't be patched.

**Time Saved by Automation:** 15 Minutes

## Sample Run

![Sample Run](../../../static/img/Local-Override---Create-and-Set-Do-Not-Patch-Policy/image_1.png)

## Variables

- `@Policy@` - Checks for any existing DO NOT PATCH policy.
- `@CheckPolicy@` - Checks if the policy is successfully created.

## Process

- The script checks for any existing DO NOT PATCH policy, and if it exists, it sets that policy as a local override on the machine.
- If there is no existing patch policy, it creates one and checks whether the policy is successfully created.
- If the policy is successfully created, it sets that policy as a local override.

## Output

- Script log


