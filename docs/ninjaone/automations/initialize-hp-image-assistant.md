---
id: 'bd8ac3ee-0a20-406d-8f9a-8d24e51621b3'
slug: /bd8ac3ee-0a20-406d-8f9a-8d24e51621b3
title: 'Initialize HP Image Assistant'
title_meta: 'Initialize HP Image Assistant'
keywords: ['hp','hpia','hp-image-assistant','image-assistant','drivers','firmware','driver-updates','bios']
description: 'The component automates the process of checking, analyzing, and installing updates for HP workstations using HP Image Assistant (HPIA). It performs system compatibility checks, downloads necessary components, and executes HPIA with specified parameters.'
tags: ['hp','firmware','bios','drivers']
draft: false
unlisted: false
last_update:
  date: 2026-03-06
---

## Overview

This procedure deploys all updates including BIOS, firmware, and drivers to the endpoint HP workstations using HP Image Assistant (HPIA). It addresses the tedious, error-prone manual process of validating, acquiring, and installing driver, firmware, BIOS, and software updates on HP business PCs by fully automating:

- Environment and hardware validation
- Downloading and managing HP’s update tools
- Running update scans and applying updates
- Providing structured, human-readable reports

This tool is ideal for standardizing HP client environments, keeping endpoints secure, compliant, and up to date with minimal manual intervention.

For complete documentation on supported arguments, refer to: [HP Image Assistant User Guide](https://ftp.hp.com/pub/caps-softpaq/cmit/imagepal/userguide/936944-005.pdf)

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/bd8ac3ee-0a20-406d-8f9a-8d24e51621b3/sample.webp)

## Dependencies

- [Agnostic script - Initialize-HPImageAssistant](/docs/92b749f0-2e30-4d4d-8916-fb5f30d85bff)

## Parameters

| Parameter | Required | Example | Type | Details | Description |
| --------- | -------- | ------- | ---- | ------- | ----------- |
| `Argument` | False | `/Operation:Analyze /Category:All /Selection:All /Action:Install /Silent /AutoCleanup /ReportFilePath:"C:\ProgramData\_Automation\App\HPImageAssistant\InstallReport"` | `String/Text` | HPIA arguments to execute. See the [HP Image Assistant User Guide](https://ftp.hp.com/pub/caps-softpaq/cmit/imagepal/userguide/936944-005.pdf) for supported parameters. | Executes HP Image Assistant to analyze the system and install applicable updates |

### Examples

1. **Default scan operation**: If executing the script without any arguments, it will only scan.

   ![blank argument](../../../static/img/docs/bd8ac3ee-0a20-406d-8f9a-8d24e51621b3/scan.webp)

2. **Apply driver updates silently**: To perform an update action (for example, silent install of recommended driver updates):

   `/Operation:Analyze /Category:Drivers /Selection:Recommended /Action:Install /Silent /AutoCleanup /ReportFilePath:"C:\ProgramData\_Automation\App\HPImageAssistant\InstallReport"`

   ![driver argument](../../../static/img/docs/bd8ac3ee-0a20-406d-8f9a-8d24e51621b3/driver.webp)

3. **Apply Firmware updates silently**: To perform an update action (for example, silent install of recommended firmware updates):

   `/Operation:Analyze /Category:Firmware /Selection:Recommended /Action:Install /Silent /AutoCleanup /ReportFilePath:"C:\ProgramData\_Automation\App\HPImageAssistant\InstallReport"`

   ![Firmware argument](../../../static/img/docs/bd8ac3ee-0a20-406d-8f9a-8d24e51621b3/firmware.webp)

4. **Apply BIOS updates silently**: To perform an update action (for example, silent install of recommended firmware updates):

   `/Operation:Analyze /Category:BIOS /Selection:Recommended /Action:Install /Silent /AutoCleanup /ReportFilePath:"C:\ProgramData\_Automation\App\HPImageAssistant\InstallReport"`

   ![Firmware argument](../../../static/img/docs/bd8ac3ee-0a20-406d-8f9a-8d24e51621b3/bios.webp)

5. **Apply All updates silently** :To perform an update action (for example, silent install of all available updates):

    `/Operation:Analyze /Category:All /Selection:All /Action:Install /Silent /AutoCleanup /ReportFilePath:"C:\ProgramData\_Automation\App\HPImageAssistant\InstallReport"`

    ![All argument](../../../static/img/docs/bd8ac3ee-0a20-406d-8f9a-8d24e51621b3/all.webp)

## Output

- Activity Details  
![Activity Logs](../../../static/img/docs/bd8ac3ee-0a20-406d-8f9a-8d24e51621b3/activity-log.webp)

## Automation Setup/Import

- [Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/initialize-hp-image-assistant.ps1)

## Changelog

### 2026-03-06

- Initial version of the document
