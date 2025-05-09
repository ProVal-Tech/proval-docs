---
id: 'becaa382-47f6-414c-8d49-57b8c67b03b5'
slug: /becaa382-47f6-414c-8d49-57b8c67b03b5
title: 'Active Directory - Domain Groups and Members'
title_meta: 'Active Directory - Domain Groups and Members'
keywords: ['domains', 'groups', 'members', 'active-directory']
description: 'This document provides a detailed overview of all domains, their respective groups, and the corresponding list of members. It outlines the dependencies required for data retrieval and describes the structure of the data presented in the dataview.'
tags: ['active-directory', 'report']
draft: false
unlisted: false
---

## Summary

This dataview shows all domains, their respective groups, and a corresponding list of members.

## Dependencies

The AD Plugin needs to be installed, enabled, and configured with credentials to pull data.

**Tables Referenced**  
- `plugin_ad_memberofxrefs`  
- `plugin_ad_users`  
- `plugin_ad_domains`  

## Columns

| Column        | Description                         |
|---------------|-------------------------------------|
| Group Name    | Displays the group name             |
| Group GUID    | Displays the group GUID             |
| Members       | Displays the members of the group    |
| Domain Name   | Displays the Domain Name            |
