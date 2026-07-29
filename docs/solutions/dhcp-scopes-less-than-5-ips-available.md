---
id: '25ae26d7-19ef-4df6-8ea0-a179b5599dc28'
slug: /25ae26d7-19ef-4df6-8ea0-a179b5599dc28
title: 'DHCP Scope(s) < 5 IP Addresses'
title_meta: 'DHCP Scope(s) < 5 IP Addresses'
keywords: ['dhcp', 'monitor', 'ip', 'addresses', 'network', 'alert', 'server']
description: 'This solution automates the evaluation of a DHCP health check script’s output, determining whether any scope has fewer than 5 free IPs. When an issue is detected, it automatically triggers the creation of a support ticket with all relevant scope details to enable rapid remediation.'
tags: ['networking', 'ticketing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-29
---

## Purpose

This solution automates the evaluation of a DHCP health check script’s output, determining whether any scope has fewer than 5 free IPs. When an issue is detected, it automatically triggers the creation of a support ticket with all relevant scope details to enable rapid remediation.

## Associated Content

| Content | Type | Function |
| ------- | ---- | -------- |
| [DHCP Scope(s) < 5 IP Addresses](/docs/f36ee848-8f7a-48e1-8cfa-e5407a35b6e8) | Automation | Monitors DHCP scopes and triggers the workflow when any DHCP scope has fewer than 5 available IP addresses remaining. |
| [DHCP Scopes IP Alerts](/docs/127f62ec-19d2-4ee4-8605-d9cbf3d8aad8) | Ticket Template | Creates a ConnectWise Manage ticket when a DHCP scope is detected with fewer than 5 available IP addresses. |
| [DHCP Scope(s) < 5 IP Addresses](/docs/f36ee848-8f7a-48e1-8cfa-e5407a35b6e8) | Task | Checks all DHCP scopes on the server and identifies any scopes with fewer than 5 available IP addresses. |
| [DHCP Scope(s) < 5 IP Addresses](/docs/3aaea0e7-76f1-4cfc-8e0f-8940b176c17b) | Condition | Evaluates the task output and determines whether the automation should generate an alert based on the remaining available IP addresses in the DHCP scope. |


## Implementation

- Create the automation [DHCP Scope(s) < 5 IP Addresses](/docs/f36ee848-8f7a-48e1-8cfa-e5407a35b6e8).
- Create the condition [DHCP Scope(s) < 5 IP Addresses](/docs/3aaea0e7-76f1-4cfc-8e0f-8940b176c17b).
- Create the ticket template [CW Manage - DHCP Scopes IP Alerts](/docs/127f62ec-19d2-4ee4-8605-d9cbf3d8aad8).
- Create the task [DHCP Scope(s) < 5 IP Addresses](/docs/f36ee848-8f7a-48e1-8cfa-e5407a35b6e8).

## FAQ

**Q1. What does this solution monitor?**

`This solution monitors DHCP scopes on Windows DHCP servers and generates an alert when any scope has fewer than 5 available IP addresses remaining.`

**Q2. What happens when a DHCP scope falls below the threshold?**

`The automation creates a ConnectWise Manage ticket to notify technicians that the DHCP scope is running low on available IP addresses.`

**Q3. Which devices should this automation be deployed to?**

`This automation should be deployed only to Windows servers hosting the DHCP Server role.`

**Q4. Can I change the threshold from 5 available IP addresses?**

`Yes. You can modify the task or automation logic if a different threshold is required for your environment.`

**Q5. Does this solution make any changes to the DHCP configuration?**

`No. This solution is monitoring-only. It does not modify DHCP scopes or settings; it only detects low IP availability and generates an alert.`

## Changelog

### 2025-07-29

- Initial version of the document