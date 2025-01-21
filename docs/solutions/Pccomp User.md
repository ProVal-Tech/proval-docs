---
id: 'aa19f899-568a-489c-be3c-854cc4198667'
title: 'Check User - pccomp'
title_meta: 'Check User - pccomp'
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

| Content                                                                                      | Type         | Function                                                                                                   |
|----------------------------------------------------------------------------------------------|--------------|------------------------------------------------------------------------------------------------------------|
| [https://proval.itglue.com/5078775/docs/18178737](https://proval.itglue.com/5078775/docs/18178737) | Script       | The script populates the information to the CF if the desired user is present on the machine.              |
| [https://proval.itglue.com/5078775/docs/18178752](https://proval.itglue.com/5078775/docs/18178752) | Custom field | The CF stores the information in the format "pccomp is present/Not Present".                               |
| [https://proval.itglue.com/5078775/docs/18178739](https://proval.itglue.com/5078775/docs/18178739) | View         | The view is updated based on the above CF and displays the machines that have the desired user present on them. |

- Delete User - pccomp

| Content                                                                                      | Type         | Function                                                                                                   |
|----------------------------------------------------------------------------------------------|--------------|------------------------------------------------------------------------------------------------------------|
| [https://proval.itglue.com/5078775/docs/18178736](https://proval.itglue.com/5078775/docs/18178736) | Script       | The script deletes the User - pccomp if it is present on the machine.                                    |

## Implementation

The script checks whether the desired user is present on the machine and updates the Custom Field (CF) with the corresponding information. The CF stores this data in a "pccomp is present/Not Present" format. Based on the CF data, the associated view is updated to display the machines where the desired user is present.

Moreover, a corresponding script to delete the user is also created.

## FAQ


