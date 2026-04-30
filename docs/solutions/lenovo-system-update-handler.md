---
id: 'd801eded-6c8e-413b-852a-5ff83058667b'
slug: /d801eded-6c8e-413b-852a-5ff83058667b
title: 'Lenovo System Update Handler'
title_meta: 'Lenovo System Update Handler'
keywords: ['lenovo', 'bios', 'firmware', 'drivers', 'vendor-specific', 'driver-updates', 'lenovo-workstations']
description: 'The goal of this solution is to manage, audit, and carry out updates (such as drivers, software, and firmware) on physical Lenovo Workstations using the LSUClient module.'
tags: ['lenovo', 'drivers', 'bios', 'firmware']
draft: false
unlisted: false
last_update:
  date: 2026-04-30
---

## Purpose

The goal of this solution is to manage, audit, and carry out updates (such as drivers, software, and firmware) on physical Lenovo Workstations using the LSUClient module.

## Associated Content

### Script

| Content | Type | Function |
|---------|------|----------|
| [Lenovo LSUClient Module - Install + Command Handler [DV,Param,Autofix]](/docs/9c0e2d8e-dccc-4253-9d3c-0f21a7d1f010) | Script | Automatically installs/maintains the required LSUClient module, performs scanning audits, and executes update commands. |
| [OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8) | Script | Helper script used to handle and insert overflowed data into the custom database table. |

### Monitor

| Content | Type | Function |
|---------|------|----------|
| [Lenovo System Update Scan](/docs/ff8d3f33-14ea-4e5b-9cec-95fab016f633) | Internal Monitor | Executes the main script once per day against supported Lenovo workstations to scan for available updates. |

### Alert Template

| Content | Type | Function |
|---------|------|----------|
| △ Custom - Execute Script - Lenovo System Update Scan | Alert Template | Executes the [Lenovo LSUClient Module - Install + Command Handler [DV,Param,Autofix]](/docs/9c0e2d8e-dccc-4253-9d3c-0f21a7d1f010) script against the machines detected by the internal monitor. |

### Data and Reporting

| Content | Type | Function |
|---------|------|----------|
| [pvl_lsuclient_audit](/docs/14af3c59-efba-4f62-959a-50ad6e382836) | Custom Table | Stores the available update data retrieved during the scanning process. |
| [Lenovo System Update Audit](/docs/537b1c7c-5f38-4915-847f-3682339e9211) | Dataview | Displays the available Lenovo update information gathered by the script. |

## Implementation

1. Import the associated scripts, internal monitor, dataview, and alert template from the ProSync plugin.

2. Execute the [Lenovo LSUClient Module - Install + Command Handler [DV,Param,Autofix]](/docs/9c0e2d8e-dccc-4253-9d3c-0f21a7d1f010) script on any online Windows computer. Make sure to set the `SetEnvironment` parameter to `1`. This will automatically create the required EDFs and the [pvl_lsuclient_audit](/docs/14af3c59-efba-4f62-959a-50ad6e382836) custom table.  
    ![Image1](/static/img/docs/9c0e2d8e-dccc-4253-9d3c-0f21a7d1f010/image1.webp)

3. Reload the system cache (**Ctrl + R**) and verify the existence of the following Extra Data Fields (EDFs):
   - **Lenovo System Update Audit** (Client Level)
   - **Exclude Lenovo System Update Scan** (Location / Computer Level)  

4. Enable the **Lenovo System Update Audit** checkbox at the Client level for any clients whose Lenovo hardware you wish to monitor and update. Use the exclusion EDFs at the Location or Computer level to exempt specific machines as needed.

5. Configure the solution as follows:
   - Navigate to `Automation` --> `Monitors` within the CWA Control Center and set up the following:
     - [Lenovo System Update Scan](/docs/ff8d3f33-14ea-4e5b-9cec-95fab016f633)
       - Configure with the alert template: `△ Custom - Execute Script - Lenovo System Update Scan`
       - Right-click and Run Now to start the monitor.  

## FAQ

**Q:** What types of machines should this solution be applied to?  
**A:** This solution is intended exclusively for Lenovo workstations running Windows 10 or Windows 11. The script will automatically verify Lenovo hardware and Windows OS compatibility before running.

**Q:** What happens if the LSUClient module is not installed on the endpoint?  
**A:** The script automatically installs and maintains the required LSUClient module.

**Q:** Does this solution automatically install updates or just scan for them?  
**A:** By default, if the script is triggered without any arguments (such as via the daily internal monitor), it discovers and lists all available updates without installation and logs them into the custom table. To automatically install updates, you must manually execute the script and pass specific values to the `Type` or `Id` parameters. 

**Q:** Are BIOS updates supported and recommended through this solution?  
**A:** While the LSUClient module can handle BIOS updates, ProVal does not recommend performing BIOS updates remotely. ProVal is not responsible for any failed devices due to remote BIOS updates. BIOS updates are performed strictly at the MSP's risk. Critical BIOS/firmware updates may initiate low-level hardware restarts that bypass OS-level controls and trigger immediate reboots regardless of the `NoReboot` parameter.

## Changelog

### 2026-04-30

- Initial version of the document.
