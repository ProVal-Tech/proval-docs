---
id: '72aee984-4fb3-4a1a-9df3-8b12b726f967'
slug: /72aee984-4fb3-4a1a-9df3-8b12b726f967
title: 'Cumulative Update Audit'
title_meta: 'Cumulative Update Audit'
keywords: ['Cumulative', 'Update', 'Audit']
description: ''
tags: ['compliance', 'patching', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution checks the currently installed Cumulative Update on a Windows machine and records the results in a custom field for reporting and auditing purposes.

## Associated Content

- [Automation - Cumulative Update Audit](/docs/4b49b89f-51f8-4f6b-9f1e-28b8f9800991)
- [Custom Field - cPVAL Cumulative Update Audit Status](/docs/a7c72ccd-b604-4d7f-aefe-3fd5393d7f01)
- [Group - cPVAL Cumulative Update Older than threshold Days](/docs/577bdd4f-439e-4462-aac8-184b6b6d40a6)

## Implementation

### Step 1

Create the following custom fields:

- [Custom Field - cPVAL Cumulative Update Audit Status](/docs/a7c72ccd-b604-4d7f-aefe-3fd5393d7f01)

### Step 2

Create the following automations:

- [Automation - Cumulative Update Audit](/docs/4b49b89f-51f8-4f6b-9f1e-28b8f9800991)

### Step 3

Create the following group:

- [Group - cPVAL Cumulative Update Older than threshold Days](/docs/577bdd4f-439e-4462-aac8-184b6b6d40a6)

## FAQ

### 1. Can the automations be executed manually and independently of the deployment custom fields?

Yes, the automations can be executed manually without relying on the deployment custom fields. If deployment is not enabled or the machine is excluded, the scripts can still be run manually to perform the desired actions.
