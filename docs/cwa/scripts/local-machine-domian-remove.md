---
id: '4bd0cdb9-f90e-4ffb-b880-52e4ff1c28c1'
slug: /4bd0cdb9-f90e-4ffb-b880-52e4ff1c28c1
title: 'Local Machine - Domain - Remove'
title_meta: 'Local Machine - Domain - Remove'
keywords: ['remove','domain']
description: 'This script will attempt to remove the computer from its domain. The script will make use of the domain admin credentials stored in the clients tab. While running the script, the password title should be supplied as a parameter. This script will check the reboot pending flag before execution as was as force a reboot after domain removal.'
tags: ['Active Directory','Domain','Windows']
draft: false
unlisted: false
---

## Summary

The script attempts to remove a computer from the domain it is currently connected to. Once the computer has been removed, the script will force a reboot and validate that it is no longer connected to the domain.

## Sample Run

![Sample Run](<../../../static/img/docs/Local Machine - Domian -Remove/image_1.png>)

![Password Location](<../../../static/img/docs/Local Machine - Domian -Remove/image_2.png>)

## Dependencies

- Will only run on Windows computers that are currently domain joined

## User Parameters

| Name                 | Example       | Required   | Description                                           |
|----------------------|---------------|------------|-------------------------------------------------------|
| DomainPasswordtitle  | Domain Admin  | True       | Title of the Domain Admin password saved in Automate. |


## Output

- Script log
