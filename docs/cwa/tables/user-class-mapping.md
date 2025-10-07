---
id: '6c97beaa-f30e-4529-8251-2ecbd01e2221'
slug: /6c97beaa-f30e-4529-8251-2ecbd01e2221
title: 'user_class_mapping'
title_meta: 'user_class_mapping'
keywords: ['audit', 'userclass', 'user', 'permission', 'Automate']
description: 'This document outlines the purpose and structure for storing audit data of the Automate user(s) permissions changes'
tags: ['database', 'permission']
draft: false
unlisted: false
---

## Purpose

This document outlines the purpose and structure for storing audit data of the Automate user(s) permissions changes detected by the client script [Automate Users Permission Audit](/docs/daeddc31-ebd5-49f6-ae90-b812f6dbfb2a).

## Dependencies

[Automate Users Permission Audit](/docs/daeddc31-ebd5-49f6-ae90-b812f6dbfb2a).

## Tables

### user_class_mapping

| Column               | Type      | Explanation                                                                                     |
|----------------------|-----------|-------------------------------------------------------------------------------------------------|
| userid           | int       | Automate User id                                                                   |
| username          | varchar   | Display name of the application.                                                                 |
| email            | varchar   | Email id assigned to the Automate user                                                                   |
| user_permissions      | varchar   | This stores the Client-level permissions of the Automate User                                                           |
| secondary      | varchar   | This stores the Group-level permissions of the Automate User                                            |
| classid               | varchar   | It contains the userclass id                                                    |
| classname            | varchar  | It stores the userclass name that is assigned to the Automate user                                                         |
| class_permissions                | varchar   | It stores the UserClass permissions                                           |
| permissionshigh      | varchar  | It stores the UserClass plugins permissions |