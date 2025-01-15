---
id: '8645a522-a9e3-4755-a498-32c2904e51c6'
title: 'Deploy Threatlocker Group'
title_meta: 'Deploy Threatlocker Group for Eligible Machines'
keywords: ['threatlocker', 'deployment', 'machines', 'group', 'criteria']
description: 'This document outlines the creation of a dynamic group for machines eligible for Threatlocker deployment that do not currently have Threatlocker installed. It details the criteria for both Windows and Mac systems, ensuring proper identification and grouping for deployment.'
tags: ['group', 'criteria', 'windows', 'mac', 'deployment', 'security']
draft: false
unlisted: false
---
## Summary

This Group contains the machines which are eligible for threatlocker deployment and doesn't have threatlocker on them.

## Dependencies

[CW RMM - Solution - Threatlocker Deployment](https://proval.itglue.com/DOC-5078775-17730657)

## Details

| Group Name                | Type of Field (Machine or Organization) | Description                                                                 |
|---------------------------|-----------------------------------------|-----------------------------------------------------------------------------|
| Deploy Threatlocker       | Dynamic Group                          | This Group contains the machines which are eligible for threatlocker deployment and doesn't have threatlocker on them |

![Image](../../../static/img/Deploy-Threatlocker/image_1.png)

## Criteria

This group is divided into two blocks to work for both Mac and Windows machines:

**For First Block:**

- Available Should be True.
- Exclude Threatlocker(Site) Should Equal to False
- Exclude Threatlocker(Endpoint) Should Equal to False
- Service Display Name Should not Equal to "ThreatlcokerService"
- Threatlocker_Organization_Name should not be equal to "NA"
- ThreatLockerAuthKey should not be equal to "NA"
- OS should be all Windows machines except EOS machines like Windows 7, 8, XP, 2008 Server, etc.

![Image](../../../static/img/Deploy-Threatlocker/image_2.png)

**For the Second block:**  
Add another block joining with OR and set the criteria as follows:

- Available Should be True.
- Exclude Threatlocker(Site) Should Equal to False
- Exclude Threatlocker(Endpoint) Should Equal to False
- Installed Software name does not equal "Threatlocker"
- ThreatLockerMacGroupKey should not be equal to "NA"
- OS should be MAC machines.

![Image](../../../static/img/Deploy-Threatlocker/image_3.png)

## Group

Once the above criteria, click the Save button to Save the Group.

![Image](../../../static/img/Deploy-Threatlocker/image_4.png)

![Image](../../../static/img/Deploy-Threatlocker/image_5.png)






