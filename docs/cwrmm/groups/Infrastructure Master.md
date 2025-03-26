---
id: 'c2c2d22b-f735-4ec5-91a6-a014ab2e84a8'
slug: /c2c2d22b-f735-4ec5-91a6-a014ab2e84a8
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

- [CW RMM - Machine Group - Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68)
- [CW RMM - Custom Field - Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae)
- [CW RMM - Task - Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168)

## Screenshots

![Screenshot 1](../../../static/img/Infrastructure-Master/image_1.png)

![Screenshot 2](../../../static/img/Infrastructure-Master/image_2.png)

## Group

- **Group Name:** Infrastructure Master
- **Description:** Contains Infrastructure Masters
- Select the `Is Primary Domain Controller` custom field for criteria, `Equal` for comparator, and type `Yes` in the condition box.
- Click the `Save` button at the top left to create the group.


