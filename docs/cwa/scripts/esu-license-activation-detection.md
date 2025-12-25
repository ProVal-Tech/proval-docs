---
id: '634db1b5-58a2-4571-8873-74040c203d56'
slug: /634db1b5-58a2-4571-8873-74040c203d56
title: 'ESU License Activation Detection'
title_meta: 'ESU License Activation Detection'
keywords: ['esu', 'license', 'extended', 'windows-10', 'windows-2012', '22h2']
description: 'This script performs checks for ESU license activation detection for Windows 10 and Windows 2012/2012 R2 and stores the information in the EDF, reflecting it in the DV.'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Summary

This script performs checks for ESU license activation detection for Windows 10 and Windows 2012/2012 R2 and stores the information to the computer EDF `ESU Detection`, reflecting it in the [ESU Detection Status](/docs/57995fb1-5d65-4283-aa82-0c3f821652bc) dataview.

## Sample Run

![Sample Run](../../../static/img/docs/2731179e-384e-4fda-907a-365368ebf742/image1.webp)

## Dependencies

- [Solution - Windows ESU Licensing and Auditing](/docs/7fe6a52b-79fd-487b-8009-523996e74d11)

## EDF

| Name | Type | Level | Section | Required | Description |
| ---- | ---- | ----- | ------- | -------- | ----------- |
| ESU Detection | Text | Computer | Windows | True | Stores the ESU License Status returned by the script. |

## Output

- Script log
- EDF
- Dataview
