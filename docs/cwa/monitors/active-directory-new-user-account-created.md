---
id: 'e04e673a-5340-47af-9536-28788ffd37ae'
slug: /e04e673a-5340-47af-9536-28788ffd37ae
title: 'Active Directory - New User Account Created'
title_meta: 'Active Directory - New User Account Created'
keywords: ['domain', 'user', 'account', 'monitor', 'ticket']
description: 'This document outlines a monitor that detects new domain user accounts created within the last day, automatically generating a ticket for each new account found. It requires the AD Plugin and targets a global scope.'
tags: ['active-directory', 'report', 'setup']
draft: false
unlisted: false
---

## Summary

This monitor looks for new domain user accounts that have a creation date within the past day. A ticket is created for each new account discovered.

## Dependencies

- AD Plugin

## Target

Global

