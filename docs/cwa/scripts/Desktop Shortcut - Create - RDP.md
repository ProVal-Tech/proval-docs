---
id: '1575f234-039a-4d1c-a4e5-ce0656e82c4f'
title: 'Create RDP Shortcut on Desktop'
title_meta: 'Create RDP Shortcut on Desktop for Windows Users'
keywords: ['rdp', 'shortcut', 'desktop', 'windows', 'users']
description: 'This document explains how to create an RDP shortcut on the desktop of each user on a Windows computer, utilizing the target computer’s address or name from the Target parameter. It includes user parameters, output details, and sample run images.'
tags: ['networking', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes a script that creates an RDP shortcut on the desktop of each user on a Windows computer. The script takes the target computer’s address or name from the `Target` parameter.

## Sample Run

![Sample Run](../../../static/img/Desktop-Shortcut---Create---RDP/image_1.png)

#### User Parameters

| Name   | Example                      | Required | Description                     |
|--------|------------------------------|----------|---------------------------------|
| Name   | CW-Automate                  | True     | Shortcut Name                   |
| Target | CW-Automate or 192.168.168.13 | True     | Target Computer / IP Address    |

## Output

- Script Log
- RDP shortcut on the user's desktop:
  ![Shortcut Image 1](../../../static/img/Desktop-Shortcut---Create---RDP/image_2.png)
  ![Shortcut Image 2](../../../static/img/Desktop-Shortcut---Create---RDP/image_3.png)
