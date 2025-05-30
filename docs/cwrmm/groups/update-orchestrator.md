---
id: 'dc9cd56d-9a0c-4e40-8205-2da48893d825'
slug: /dc9cd56d-9a0c-4e40-8205-2da48893d825
title: 'Update Orchestrator'
title_meta: 'Update Orchestrator'
keywords: ['device', 'group', 'update', 'orchestrator', 'solution', 'windows']
description: 'This document provides a step-by-step guide on how to create a device group for the Update Orchestrator solution in ConnectWise RMM. It includes dependencies, creation instructions, and criteria for grouping devices based on OS type.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

There is one device group related to the Update Orchestrator solution. Please see the guide below to create a device group.

## Dependencies

- [CW RMM - Task - Update Orchestrator Bouncer](/docs/06e1e902-b204-498e-a31f-9de7879c528e)
- [CW RMM - Custom Monitor - Update Orchestrator Bouncer](/docs/a88678ef-dc82-4837-802c-e77573277504)

## Create Device Group

There is one device group for this solution. To create device groups, please navigate to **Devices > Device Groups**.

![Image](../../../static/img/docs/dc9cd56d-9a0c-4e40-8205-2da48893d825/image_1.webp)

Select **Add > Dynamic Group**.

![Image](../../../static/img/docs/dc9cd56d-9a0c-4e40-8205-2da48893d825/image_2.webp)

---

## Device Group Name: Update Orchestrator

![Image](../../../static/img/docs/dc9cd56d-9a0c-4e40-8205-2da48893d825/image_3.webp)

**Description:** Machines in this group will get the Update Orchestrator solution.

**Criteria:**

![Image](../../../static/img/docs/dc9cd56d-9a0c-4e40-8205-2da48893d825/image_4.webp)

When adding criteria, please search for the **OS Type**.

**Contains any of:** "Windows"

**AND**

**Site > Contains any of >** "Select the sites you want this to target."