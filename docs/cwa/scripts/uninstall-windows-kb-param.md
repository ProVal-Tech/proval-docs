---
id: 'fd611b68-7cd6-4a6a-bee1-3d772ecd9a27'
slug: /fd611b68-7cd6-4a6a-bee1-3d772ecd9a27
title: 'Uninstall Windows KB Param'
title_meta: 'Uninstall Windows KB Param'
keywords: ['uninstall', 'windows', 'update', 'kbid', 'reboot']
description: 'This script assists in the uninstallation of a specific Windows update by allowing the user to input the KBID. It includes an option to authorize a system restart if necessary while also striving to prevent an immediate reboot unless required by the update.'
tags: ['reboot', 'software', 'uninstallation', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The script is designed to facilitate the uninstallation of a specific Windows update on a computer. To achieve this, it requires the user to input the KBID (Knowledge Base Identifier) of the Windows update through a designated user parameter. Additionally, there is an option to authorize a system restart if the update necessitates it, which can be accomplished by providing a '1' in the user parameter for reboot. 

The script will endeavor to remove the targeted update without initiating a system restart when the reboot parameter is either left blank or set to '0'.

**Caution:** It's worth noting, however, that in certain scenarios, the update itself may trigger an involuntary system reboot.

## Sample Run

The computer will undergo a reboot if the patch necessitates a restart to finalize the removal process.

![Sample Run Image 1](../../../static/img/docs/fd611b68-7cd6-4a6a-bee1-3d772ecd9a27/image_1.png)

The script will endeavor to prevent an immediate reboot; nonetheless, it is important to acknowledge that, in specific circumstances, the update may autonomously initiate a mandatory system reboot.

![Sample Run Image 2](../../../static/img/docs/fd611b68-7cd6-4a6a-bee1-3d772ecd9a27/image_2.png)

#### User Parameters

| Name   | Example   | Required | Description                                                                                     |
|--------|-----------|----------|-------------------------------------------------------------------------------------------------|
| kbID   | KB545664  | True     | KBID (Knowledge Base Identifier) of the Windows update to uninstall.                          |
| Reboot | 1         | False    | To facilitate a system reboot when required, input '1'. Alternatively, enter '0' or leave it blank to prompt an attempt to suppress the reboot. |

## Output

- Script log

