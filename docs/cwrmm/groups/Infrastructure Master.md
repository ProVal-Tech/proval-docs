---
id: 'c2c2d22b-f735-4ec5-91a6-a014ab2e84a8'
title: 'Infrastructure Master'
title_meta: 'Infrastructure Master'
keywords: ['infrastructure', 'masters', 'domain', 'controllers', 'group']
description: 'This document provides an overview of the Infrastructure Masters group, detailing its dependencies, setup instructions, and includes relevant screenshots for reference.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

The group contains the Infrastructure Masters.

## Dependencies

- [CW RMM - Machine Group - Domain Controllers](<./Domain Controllers.md>)
- [CW RMM - Custom Field - Is Primary Domain Controller](<../custom-fields/Is Primary Domain Controller.md>)
- [CW RMM - Task - Validate Primary Domain Controller](<../tasks/Validate Primary Domain Controller.md>)

## Screenshots

![Screenshot 1](../../../static/img/Infrastructure-Master/image_1.png)

![Screenshot 2](../../../static/img/Infrastructure-Master/image_2.png)

## Group

- **Group Name:** Infrastructure Master
- **Description:** Contains Infrastructure Masters
- Select the `Is Primary Domain Controller` custom field for criteria, `Equal` for comparator, and type `Yes` in the condition box.
- Click the `Save` button at the top left to create the group.



