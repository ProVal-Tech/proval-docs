---
id: 'ce87a5e8-cc0f-43a5-8cd8-fc551002f618'
slug: /ce87a5e8-cc0f-43a5-8cd8-fc551002f618
title: 'Windows Firewall Domain'
title_meta: 'Windows Firewall Domain'
keywords: ['firewall', 'windows', 'domain', 'profile', 'detection']
description: 'This document outlines a method to detect if the Domain profile of the Windows Firewall is enabled on a Windows operating system. It includes the detection string, comparator, and applicable operating systems.'
tags: ['firewall', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document will detect if the Domain profile of the Windows Firewall is enabled.

## Settings

| Detection String                                             | Comparator | Result | Applicable OS |
|------------------------------------------------------------|------------|--------|----------------|
| \{%@netsh advfirewall show domainprofile state| find "State"@%} | Contains   | ON     | Windows        |



