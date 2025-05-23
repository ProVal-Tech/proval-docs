---
id: 'f1bc732b-7469-4689-aa3e-d0af5161ecc5'
slug: /f1bc732b-7469-4689-aa3e-d0af5161ecc5
title: 'Active Directory - Enabled Test Accounts'
title_meta: 'Active Directory - Enabled Test Accounts'
keywords: ['active-directory', 'monitor', 'account', 'enabled', 'test']
description: 'This document describes a monitor that utilizes the Active Directory plugin to identify any enabled accounts with the name "test" on the domain. The purpose is to help technicians evaluate these accounts for potential security risks.'
tags: ['active-directory', 'security']
draft: false
unlisted: false
---

## Summary

Using the Active Directory plugin, this monitor will look for any account with the name "test" in the account name and will flag that account if it is enabled on the domain. The goal of this monitor is to locate these enabled test accounts so a technician can evaluate the account and decide if it should be enabled or not.

## Dependencies

- AD Plugin

## Target

Global