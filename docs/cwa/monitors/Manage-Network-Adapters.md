---
id: '3a35f74d-113e-4e0f-83b2-f3c3daacccb1'
title: 'Manage Network Adapters'
title_meta: 'Manage Network Adapters'
keywords: ['DHCP','windows','networking','Protocol','IPV4','IPv6','Script','Automate']
description: 'This internal monitor detects windows machines selected for Network Adapters Protocol Solution'
tags: ['DHCP', 'windows','networking']
draft: False
unlisted: false
---

## Summary
This internal monitor detects windows machines selected for Network Adapters Protocol Solution. Selection depends when Client EDF `Enable Solution` is selected and Machine is not excluded from the solution using the `Action` edf at client/location/computer level.

## Dependencies

- [Script: Manage-NetworkAdapterProtocols](/docs)
- [Solution : Manage-NetworkAdapterProtocols](/docs)


## Target

Managed Windows Computers

## Alert Template

**Name:** `△ Custom - Execute Script - Manage-NetworkAdapterProtocols`
