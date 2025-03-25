---
id: '54997a10-a21b-450a-8c77-f63d5d048190'
slug: /54997a10-a21b-450a-8c77-f63d5d048190
title: 'Automate - User Password Audit'
title_meta: 'Automate - User Password Audit'
keywords: ['automate', 'password', 'strength', 'security', 'user']
description: 'This document outlines the criteria for determining whether an Automate user’s password is considered strong or weak. It details the requirements for a strong password, including character length, variety, and complexity, and provides a summary of the data view used to assess password strength.'
tags: ['security']
draft: false
unlisted: false
---

## Summary

This document outlines the criteria for determining if an Automate user's password is considered weak. The following items are required for a "strong" password:

- No variations on the word "Password"
  - P@s$W0rd
  - p@$swORD
  - etc.
- At least 10 characters long
- Contains one lowercase character
- Contains one uppercase character
- Contains one numeric character
- Contains one non-alphanumeric character

## Columns

| Column          | Description                                                  |
|-----------------|--------------------------------------------------------------|
| Username        | User name                                                   |
| Email           | Email of the user                                           |
| Password Error  | The password complexity error indicating whether the password is strong or not. |


