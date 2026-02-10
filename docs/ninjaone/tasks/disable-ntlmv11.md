---
id: '2fa3b191-0fe1-4bb9-95fe-517b40794441'
slug: /2fa3b191-0fe1-4bb9-95fe-517b40794441
title: 'Disable NTLMv1.1'
title_meta: 'Disable NTLMv1.1'
keywords: ['ntlm', 'protocol', 'windows', 'security', 'domain']
description: 'It executes `Disable NTLMv1.1` on targeted machines to disable NTLMv1.1 protocol'
tags: ['networking', 'security', 'windows']
draft: false
unlisted: false
---

## Summary
It executes `Disable NTLMv1.1` on targeted machines to disable NTLMv1.1 protocol

## Dependencies

- [Automation - Disable NTLMv1.1 ](/docs/6d899921-3e52-4d4f-9f9e-742242b8171a) 
- [Solution - NTLMv1.1 ](/docs/94b6df2a-8565-4118-b2e7-35a3fe7206dc)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
|-----|----|----|-----|----|----|----|----|---|
| Disable NTLMv1.1 | It executes `Disable NTLMv1.1` automation on targeted machines to disable NTLMv1.1 protocol | True | Daily | 1 Day | (Current Date) 10:00 AM | Never  | `cPVAL Machines with NTLMv1.1 Enabled` group | Disable NTLMv1.1 |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/disable-ntlmv11.toml)