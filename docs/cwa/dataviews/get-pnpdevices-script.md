---
id: 'f0f7231c-f13b-46a0-baa6-aebb8640adaf'
slug: /f0f7231c-f13b-46a0-baa6-aebb8640adaf
title: 'Get-PNPDevices [Script]'
title_meta: 'Get-PNPDevices [Script]'
keywords: ['html', 'markdown', 'conversion', 'formatting']
description: 'This displays the information of PnP Devices gethered by the script Get-PNPDevices [DV].'
tags: ['database', 'installation', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

This displays the information of [PnP Devices](https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-plug-and-play) gethered by the script [Get-PNPDevices [DV]](/docs/9d2c62e4-37a5-4d37-867c-c0cda13bdef9).


## Dependencies

- [Script - Get-PNPDevices [DV]](/docs/9d2c62e4-37a5-4d37-867c-c0cda13bdef9)
- [Custom Table - Plugin_ProVal_PnpDevices](/docs/d0d38e82-7faf-4e0f-86b3-81b01a9f18fb).
- [Solution - PnP Devices Inventory](/docs/f92a5e4c-9ade-4cb9-ba9f-4e8b7d6ae0da)

## Columns

| Column                        | Description                                                                                                           |
|-------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| Client Name                     | Client name of the agent.                                                                                            |
| Location Name                     | Location name of the agent.                                                                                          |
| Computer Name                    | Computer name of the agent.                                                                                          |
| Operating System              | The operating system name of the agent.                                                                              |
| Last Contact                  | Last contact of the agent with the CW Automate. |
|Days Since Last Contact | Days since the computer was last online in Automate  |
|OS Type |  Type Of Operating System  |
|PNPDevice Name |  Name of the PnP Device     |
|Status |  Status of PnP devices    |
|Class   |  Refers to the device setup class, which is a category that defines the type of hardware and its installation requirements    |
|Last Updated |  The last time script ran updated the table.   |