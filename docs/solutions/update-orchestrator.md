---
id: 'b493b3e6-8bd3-4578-bb2a-4f7c34a3b6bf'
slug: /b493b3e6-8bd3-4578-bb2a-4f7c34a3b6bf
title: 'Update Orchestrator'
title_meta: 'Update Orchestrator'
keywords: ['update', 'orchestrator', 'management', 'deployment', 'monitoring']
description: "This document outlines a solution for managing and deploying ProVal's Update Orchestrator to prevent unintended patching and rebooting of machines. It details the use of a custom task, device group, and monitor to ensure controlled updates."
tags: ['deployment', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution uses a custom task, a device group, and a custom monitor to manage and deploy ProVal's solution to prevent the Update Orchestrator from patching and rebooting machines without warning.

## Associated Content

| Content                                                                                             | Type         | Function                                                                                                                                                                                                                                                                                                      |
| --------------------------------------------------------------------------------------------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [CW RMM - Device Groups - Update Orchestrator](/docs/dc9cd56d-9a0c-4e40-8205-2da48893d825)          | Device Group | The device group is designed to slowly deploy the Update Orchestrator in the environment.                                                                                                                                                                                                                     |
| [CW RMM - Task - Update Orchestrator Bouncer](/docs/06e1e902-b204-498e-a31f-9de7879c528e)           | Task         | Will attempt to "neuter" the Update Orchestrator solution on endpoints by renaming/removing a directory.                                                                                                                                                                                                      |
| [CW RMM - Custom Monitor - Update Orchestrator Bouncer](/docs/a88678ef-dc82-4837-802c-e77573277504) | Monitor      | This solution will monitor the `C:/Windows/System32/Tasks/Microsoft/Windows/UpdateOrchestrator/Reboot` path. If the folder for "reboot" exists, it will be renamed to `reboot.bak`. This prevents the Update Orchestrator from side loading Microsoft patches on endpoints that are not approved via the RMM. |

## Implementation

1. Create the device groups. This step is required before creating the tasks; otherwise, they will not have a proper target.  
   Follow the documentation here: [CW RMM - Device Groups - Update Orchestrator](/docs/dc9cd56d-9a0c-4e40-8205-2da48893d825)

2. Create the Update Orchestrator task.  
   Follow the documentation here: [CW RMM - Task - Update Orchestrator Bouncer](/docs/06e1e902-b204-498e-a31f-9de7879c528e)  
   **Please ensure that the task is scheduled per the above documentation!**

3. Create the custom monitor.  
   Follow the documentation here: [CW RMM - Custom Monitor - Update Orchestrator Bouncer](/docs/a88678ef-dc82-4837-802c-e77573277504)  
   **Please ensure that the task is scheduled as the Automation Task on the monitor.**

## FAQ
