---
id: '372dfa84-9e1d-4e86-9a1b-8c8904d3a489'
slug: /372dfa84-9e1d-4e86-9a1b-8c8904d3a489
title: 'Windows Firewall Private'
title_meta: 'Windows Firewall Private'
keywords: ['firewall', 'detection', 'private', 'security', 'windows']
description: 'This document outlines a role for detecting whether the Private firewall is enabled on a machine. If the firewall is active, the role is applied to the machine within the ConnectWise Automate database. It includes specific detection strings and settings for implementation.'
tags: ['firewall', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This role detects if the 'Private' firewall is enabled on the machine. If so, this role is applied to the machine in the Automate database.

## Settings

| Detection String                                         | Comparator | Result | Applicable OS |
|---------------------------------------------------------|------------|--------|----------------|
| \{%@netsh advfirewall show privateprofile state| find "State"@%} | Contains   | ON     | Windows        |