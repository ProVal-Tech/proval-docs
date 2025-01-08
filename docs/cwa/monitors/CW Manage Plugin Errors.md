---
id: 'cwa-internal-monitor-notification'
title: 'Internal Monitor Notification for ConnectWise Manage Plugin'
title_meta: 'Internal Monitor Notification for ConnectWise Manage Plugin'
keywords: ['monitor', 'notification', 'connectwise', 'alerts', 'plugin', 'error']
description: 'This document outlines the setup and dependencies for an internal monitor that notifies the specified email address of critical errors or issues related to the ConnectWise Manage Plugin. It includes information on the necessary dependencies and the target configuration for global monitoring.'
tags: ['connectwise', 'monitoring', 'alerts', 'configuration', 'email']
draft: false
unlisted: false
---
## Summary

This internal monitor is intended to notify [alerts@provaltech.com](mailto:alerts@provaltech.com) of any critical errors or other issues relating to the ConnectWise Manage Plugin.

## Dependencies

[Email RAWSQL Monitor Set Failures* [Autofix]](https://proval.itglue.com/DOC-5078775-10390936)  
CW Manage Plugin  

Use the “~Custom Email RAWSQL Monitor set results to ProVal” alert template along with the monitor set.

## Target

Global

