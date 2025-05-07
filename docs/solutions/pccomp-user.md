---
id: 'aa19f899-568a-489c-be3c-854cc4198667'
slug: /aa19f899-568a-489c-be3c-854cc4198667
title: 'Pccomp User'
title_meta: 'Pccomp User'
keywords: ['user', 'cf', 'presence', 'script', 'view']
description: 'This document outlines the process for checking the presence of the User - pccomp on machines and updating a Custom Field (CF) accordingly. It includes details on associated scripts, custom fields, and views that help manage user presence effectively.'
tags: []
draft: false
unlisted: false
---

## Purpose

The end goal of the solution is to check the presence of User - pccomp on the machines and update it to a CF. Based on the CF, a view is created to show the machines that have the user present on them.

## Associated Content

- For cPVAL User - PCComp

| Content                                                                                            | Type         | Function                                                                                      |
| -------------------------------------------------------------------------------------------------- | ------------ | --------------------------------------------------------------------------------------------- |
| [Vsa HDD Monitoring Solution](/docs/ea55f0eb-9011-436a-bbd9-1795fc206f81)                          | Script       | The script populates the information to the CF if the desired user is present on the machine. |

## Implementation

The script checks whether the desired user is present on the machine and updates the Custom Field (CF) with the corresponding information. The CF stores this data in a "pccomp is present/Not Present" format. Based on the CF data, the associated view is updated to display the machines where the desired user is present.

Moreover, a corresponding script to delete the user is also created.

## FAQ


