---
id: 'f36ee848-8f7a-48e1-8cfa-e5407a35b6e8'
slug: /f36ee848-8f7a-48e1-8cfa-e5407a35b6e8
title: 'DHCP Scope(s) < 5 IP Addresses Available'
title_meta: 'DHCP Scope(s) < 5 IP Addresses Available'
keywords: ['dhcp', 'monitor', 'ip', 'addresses', 'network', 'alert', 'server']
description: 'This document outlines a remote monitor designed to retrieve information about DHCP server scopes and their corresponding IP address statistics. It filters out inactive scopes, focusing on active ones, and checks for those with 5 or fewer available IP addresses, alerting administrators to potential network connectivity issues.'
tags: ['networking', 'ticketing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-28
---

## Overview

The script retrieves information about DHCP server scopes and their corresponding IP address statistics. It filters out inactive scopes and focuses only on active ones. The script then checks the number of available IP addresses within each active scope and identifies those with 5 or fewer available IP addresses.

In other words, it detects the DHCP servers having any active DHCP scope with less than 5 IP addresses available.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/f36ee848-8f7a-48e1-8cfa-e5407a35b6e8/sample-run.webp)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/dhcp-scopes-less-than-5-ips-available.ps1)

## Output

- Activity Details

## Changelog

### 2026-07-28

- Initial version of the document