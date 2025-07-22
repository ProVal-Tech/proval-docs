---
id: '20e58955-94bd-4f4f-85e7-db7d30f677b6'
slug: /20e58955-94bd-4f4f-85e7-db7d30f677b6
title: 'Install Lenovo Updates - Windows Workstations'
title_meta: 'Install Lenovo Updates - Windows Workstations'
keywords: ['lenovo', 'bios', 'firmware', 'drivers', 'vendor-specific', 'driver-updates', 'lenovo-workstations']
description: 'Automates the discovery and installation of Lenovo-specific updates (BIOS, drivers, firmware, applications) on supported workstations.'
tags: ['lenovo', 'drivers', 'bios', 'firmware']
draft: false
unlisted: false
---

## Overview

Automates the installation of Lenovo system updates on supported workstations. If no variables are configured, the component will simply return the list of available updates.

### Important Notes

- **Forceful reboots**: BIOS/firmware updates initiate hardware-level restarts that bypass `-NoReboot` parameter controls
- **Maintenance windows**: Schedule updates during planned downtime to avoid disruption
- **Power continuity**: Ensure uninterrupted power supply during firmware updates
- **Unattended requirement**: Type-based installations only process updates supporting silent installation
- **ID exceptions**: Updates installed by ID ignore unattended installation requirements

## Dependencies

[Install-LenovoUpdates](/docs/3640e534-d089-4304-89ba-68d3bc113978)

## Implementation  

1. Download the component `[Install Lenovo Updates - Windows Workstations](../../../static/attachments/install-lenovo-updates-windows-workstations.cpt)` from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Template 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

### Example 1

**Discovers and lists all available updates without installation.**  
![Image1](../../../static/img/docs/20e58955-94bd-4f4f-85e7-db7d30f677b6/image1.webp)

### Example 2

**Installs all available updates that support unattended installation and are applicable to the system. Automatically reboots if required.**  
![Image2](../../../static/img/docs/20e58955-94bd-4f4f-85e7-db7d30f677b6/image2.webp)

### Example 3

**Installs available BIOS and Firmware updates that support unattended installation and are applicable to the system. Suppresses automatic reboot (manual reboot required if pending).**  
![Image3](../../../static/img/docs/20e58955-94bd-4f4f-85e7-db7d30f677b6/image3.webp)

### Example 4

**Installs specific updates by their IDs regardless of unattended support status. Automatically reboots if required.**  
![Image4](../../../static/img/docs/20e58955-94bd-4f4f-85e7-db7d30f677b6/image4.webp)

### Example 5

**Attempts to install only driver updates that support unattended installation. Suppresses automatic reboot (manual reboot required if pending).**  
![Image5](../../../static/img/docs/20e58955-94bd-4f4f-85e7-db7d30f677b6/image5.webp)

## Datto Variables

| Variable Name | Example | Type | Default | Description |
| ------------- | ------- | ---- | ------- | ----------- |
| Type | <ul><li>All</li><li>'Application', 'BIOS', 'Driver'</li><li>'Firmware', 'BIOS'</li><li>Driver</li><li>Firmware</li><li>BIOS</li></ul> | String | | Specifies the update type to install. Updates must support unattended installation and be applicable to the system to be eligible for installation. Use 'All' for every available vendor-specific update that meets these criteria. Valid values: 'All', 'Application', 'BIOS', 'Driver', 'Firmware'. | 
| Id | <ul><li>pcieeth06w_w11</li><li>'pcieeth06w_w11', 'n3ch101w_bisbnk919kse' | String | | Specifies the ID(s) of specific update(s) to install. Both 'Id' and 'Type' cannot be used together. |
| NoReboot | | Boolean | False | Suppresses automatic reboot after installation. Critical BIOS/firmware updates may initiate low-level hardware restarts that bypass OS-level controls. These can trigger immediate system reboots regardless of setting this parameter. |

## Output

stdOut & stdError

## Attachments

[Install Lenovo Updates - Windows Workstations](../../../static/attachments/install-lenovo-updates-windows-workstations.cpt)
