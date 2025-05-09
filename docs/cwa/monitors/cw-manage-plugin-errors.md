---
id: 'cc311e32-be16-4133-ae95-fca238aea891'
slug: /cc311e32-be16-4133-ae95-fca238aea891
title: 'CW Manage Plugin Errors'
title_meta: 'CW Manage Plugin Errors'
keywords: ['monitor', 'notification', 'connectwise', 'alerts', 'plugin', 'error']
description: 'This document outlines the setup and dependencies for an internal monitor that notifies the specified email address of critical errors or issues related to the ConnectWise Manage Plugin. It includes information on the necessary dependencies and the target configuration for global monitoring.'
tags: ['connectwise', 'email']
draft: false
unlisted: false
---

## Summary

This internal monitor is intended to notify [alerts@provaltech.com](mailto:alerts@provaltech.com) of any critical errors or other issues related to the ConnectWise Manage Plugin.

## Dependencies

- [Email RAWSQL Monitor Set Failures* [Autofix]](/docs/901470a2-73d2-4d29-b0d3-c5f15cf19c41)  
- CW Manage Plugin  

Use the “~Custom Email RAWSQL Monitor set results to ProVal” alert template along with the monitor set.

## Target

Global
