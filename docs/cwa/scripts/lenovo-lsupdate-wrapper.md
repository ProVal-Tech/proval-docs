---
id: '3405233d-ead9-4997-b685-c4a90432df3c'
slug: /3405233d-ead9-4997-b685-c4a90432df3c
title: 'Lenovo LSUpdate - Wrapper'
title_meta: 'Lenovo LSUpdate - Wrapper'
keywords: ['bios', 'lenovo', 'updates', 'firmware', 'driver']
description: 'This document provides a guide on using the PowerShell module LSUClient to install available BIOS updates for Lenovo machines. It includes warnings about the risks of automating driver and firmware updates, sample runs, dependencies, variables, user parameters, and expected output.'
tags: ['bios', 'firmware', 'lenovo', 'windows']
draft: false
unlisted: false
---

## Summary

This script uses the PowerShell module `LSUClient` to install available BIOS updates for Lenovo machines. The `InstallAll` parameter can be used to install all available vendor updates, including BIOS, firmware, and drivers.

## Warning

It is generally not recommended to automate `driver` and `firmware` updates on machines since they can cause unexpected results. In some rare cases, they may cause machines to stop functioning afterward.

Also, please note that the computer can be restarted even without setting the `Reboot` parameter while installing all available updates. Therefore, the `InstallAll` parameter should be used with caution.

---

## Sample Run

- Install available BIOS updates without restarting the computer:  
  ![Install available BIOS Updates without restarting](../../../static/img/docs/3405233d-ead9-4997-b685-c4a90432df3c/image_1.webp)

- Install available BIOS updates and restart the computer immediately:  
  ![Install available BIOS updates and restart](../../../static/img/docs/3405233d-ead9-4997-b685-c4a90432df3c/image_2.webp)

- Install all available updates without restarting the computer: (This option may not work as desired, because the reboot cannot be fully suppressed while installing `driver` and `firmware` updates.)  
  ![Install all available updates without restarting](../../../static/img/docs/3405233d-ead9-4997-b685-c4a90432df3c/image_3.webp)

- Install all available updates and restart the computer immediately:  
  ![Install all available updates and restart](../../../static/img/docs/3405233d-ead9-4997-b685-c4a90432df3c/image_4.webp)

---

## Dependencies

PowerShell Version 5+

---

## Variables

| Name        | Description                                                  |
|-------------|--------------------------------------------------------------|
| LogMessage  | The log message to be sent to the script log for the target. |

---

## User Parameters

| Name       | Example | Required | Description                                                                                       |
|------------|---------|----------|---------------------------------------------------------------------------------------------------|
| Reboot     | 1       | False    | Script will restart the computer if this parameter is set to 1 and a restart is required for the update. |
| InstallAll | 1       | False    | Set this parameter to 1 to install all available vendor updates including driver, firmware, and BIOS updates. **USE THIS OPTION WITH CAUTION** |

---

## Output

- Script logs