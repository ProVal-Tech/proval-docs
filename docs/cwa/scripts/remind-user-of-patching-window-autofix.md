---
id: '3334a875-2f72-4e0f-bb0a-129430a4abce'
slug: /3334a875-2f72-4e0f-bb0a-129430a4abce
title: 'Remind User of Patching Window Autofix'
title_meta: 'Remind User of Patching Window Autofix'
keywords: ['popup', 'message', 'user', 'patching', 'maintenance']
description: 'This document describes a script that sends a popup message to the currently logged-in user, requesting them to leave their machine online for necessary patching and maintenance. The script helps ensure that systems remain available for updates, enhancing overall security and performance.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script will send a popup message to the logged-in user to leave their machine online for patching and maintenance.

**Time Saved by Automation:** 2 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/3334a875-2f72-4e0f-bb0a-129430a4abce/image_1.webp)

## Process

- The script first verifies if the user is logged in. If not, it exits.
- If a user is logged in, it sends a popup message to the user to leave their machine online.