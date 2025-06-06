---
id: '8645a522-a9e3-4755-a498-32c2904e51c6'
slug: /8645a522-a9e3-4755-a498-32c2904e51c6
title: 'Deploy Threatlocker'
title_meta: 'Deploy Threatlocker'
keywords: ['threatlocker', 'deployment', 'machines', 'group', 'criteria']
description: 'This document outlines the creation of a dynamic group for machines eligible for Threatlocker deployment that do not currently have Threatlocker installed. It details the criteria for both Windows and Mac systems, ensuring proper identification and grouping for deployment.'
tags: ['deployment', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This group contains the machines that are eligible for Threatlocker deployment and do not have Threatlocker installed.

## Dependencies

[CW RMM - Solution - Threatlocker Deployment](/docs/c9969bad-d2da-45ec-90fe-d6be82479ebc)

## Details

| Group Name          | Type of Field (Machine or Organization) | Description                                                                 |
|---------------------|-----------------------------------------|-----------------------------------------------------------------------------|
| Deploy Threatlocker | Dynamic Group                          | This group contains the machines that are eligible for Threatlocker deployment and do not have Threatlocker installed. |

![Image](../../../static/img/docs/8645a522-a9e3-4755-a498-32c2904e51c6/image_1.webp)

## Criteria

This group is divided into two blocks to work for both Mac and Windows machines:

**For the First Block:**

- Available should be True.
- Exclude Threatlocker (Site) should equal False.
- Exclude Threatlocker (Endpoint) should equal False.
- Service Display Name should not equal "ThreatlockerService."
- Threatlocker_Organization_Name should not be equal to "NA."
- ThreatLockerAuthKey should not be equal to "NA."
- OS should be all Windows machines except EOS machines like Windows 7, 8, XP, 2008 Server, etc.

![Image](../../../static/img/docs/8645a522-a9e3-4755-a498-32c2904e51c6/image_2.webp)

**For the Second Block:**  
Add another block joining with OR and set the criteria as follows:

- Available should be True.
- Exclude Threatlocker (Site) should equal False.
- Exclude Threatlocker (Endpoint) should equal False.
- Installed Software name does not equal "Threatlocker."
- ThreatLockerMacGroupKey should not be equal to "NA."
- OS should be MAC machines.

![Image](../../../static/img/docs/8645a522-a9e3-4755-a498-32c2904e51c6/image_3.webp)

## Group

Once the above criteria are set, click the Save button to save the group.

![Image](../../../static/img/docs/8645a522-a9e3-4755-a498-32c2904e51c6/image_4.webp)

![Image](../../../static/img/docs/8645a522-a9e3-4755-a498-32c2904e51c6/image_5.webp)