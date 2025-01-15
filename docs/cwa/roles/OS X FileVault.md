---
id: '1e483bae-ad35-437e-a963-fb7fab9f27e1'
title: 'FileVault Status Check for Mac Agents'
title_meta: 'FileVault Status Check for Mac Agents'
keywords: ['filevault', 'mac', 'status', 'check', 'security']
description: 'This document outlines the role used to view the status of FileVault on Mac agents, including detection strings and applicable operating systems.'
tags: ['mac', 'security', 'status', 'configuration']
draft: false
unlisted: false
---
## Summary

The role is used to view the status of the FileVault on the Mac agents.

## Settings

| Detection String         | Comparator | Result               | Applicable OS |
|-------------------------|------------|----------------------|----------------|
| {%@fdesetup status@%}  | Contains   | FileVault is On      | Mac            |







