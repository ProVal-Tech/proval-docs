---
id: '57995fb1-5d65-4283-aa82-0c3f821652bc'
slug: /57995fb1-5d65-4283-aa82-0c3f821652bc
title: 'ESU Detection Status'
title_meta: 'ESU Detection Status'
keywords: ['esu', 'license', 'extended', 'windows-10', 'windows-2012', '22h2']
description: 'This dataview displays the Windows 10 and Windows 2012/2012 R2 ESU extended license status audited by the script ESU License Activation Detection.'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Summary

This dataview displays the Windows 10 and Windows 2012/2012 R2 ESU extended license status audited by the [ESU License Activation Detection](/docs/634db1b5-58a2-4571-8873-74040c203d56) script.

## Dependencies

- [Script - ESU License Activation Detection](/docs/634db1b5-58a2-4571-8873-74040c203d56)
- [Solution - Windows ESU Licensing and Auditing](/docs/7fe6a52b-79fd-487b-8009-523996e74d11)

## Columns

| Column | Description |
| ------ | ----------- |
| ClientId     |   CW Automate client id of the agent          |
| LocationId | CW Automate location id of the agent  |
| ComputerId | CW Automate computer id of the agent  |
| Client | Client name of the agent |
| Location | Location name of the agent |
| Computer | Computer name of the agent |
| Operating System | Operating system information of the agent |
| LastContact | Last contact of the agent with the CW Automate |
| ESU Status | ESU license renewal status of the agent |
