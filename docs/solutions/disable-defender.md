---
id: '496a399f-7746-4cc6-9c31-476193d5ee9e'
slug: /496a399f-7746-4cc6-9c31-476193d5ee9e
title: 'Disable Defender'
title_meta: 'Disable Defender'
keywords: ['security','antivirus','defender','other av']
description: 'This solution disable the defender if the supported other AVs are detected and running.'
tags: ['security','antivirus']
draft: false
unlisted: false
last_update:
  date: 2026-06-17
---

## Purpose

This solution disable the defender if the supported other AVs are detected and running.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Supported AV Services](/docs/f0bef227-5f8b-4c6e-bfd4-9940fde736c8)      | Custom Field | This custom field will require the list of AV that are active and running; if found, then the Defender gets disabled. Provide the value of AVs in a comma-separated list within the single quotes. For example: SentinelAgent,AnotherAVService |
| [Disable Defender Vs Supported AV](/docs/54c6d331-9974-4267-bfb4-13d1f16e8d9c) | Script | This script will disable the defender if the supported AVs are found and running. |
| [Disable Defender Failure Detection Workstation](/docs/c813811b-23ea-44d2-9a01-d5e5a8226b05) | Compound Condition | This compound condition will detect the workstations where the disable defender has failed. |
| [Disable Defender Failure Detection Server](/docs/cd0e2e09-299b-40df-a619-6babf4cd2436) | Compound Condition | This compound condition will detect the servers where the disable defender has failed. |

## Implementation

- Create the [Custom field - CPVAL Supported AV Services](/docs/f0bef227-5f8b-4c6e-bfd4-9940fde736c8)
- Create the [Script - Disable Defender Vs Supported AV](/docs/54c6d331-9974-4267-bfb4-13d1f16e8d9c)
- Create the [Compound Condition - Disable Defender Failure Detection Workstation](/docs/c813811b-23ea-44d2-9a01-d5e5a8226b05)
- Create the [Compound Condition - Disable Defender Failure Detection Server](/docs/cd0e2e09-299b-40df-a619-6babf4cd2436)
- The compound conditions will trigger the automation [Script - Disable Defender Vs Supported AV](/docs/54c6d331-9974-4267-bfb4-13d1f16e8d9c) every 4 hours and will create the ticket if the [Script - Disable Defender Vs Supported AV](/docs/54c6d331-9974-4267-bfb4-13d1f16e8d9c) failed to disable or execute.

## Changelog

### 2026-06-17

- Initial version of the document