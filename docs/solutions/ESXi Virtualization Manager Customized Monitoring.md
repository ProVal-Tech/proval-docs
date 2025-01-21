---
id: 'deb78496-0147-4a1b-b368-3b3113f9cf5b'
title: 'Internal Monitors for Virtualization Manager Plugin'
title_meta: 'Internal Monitors for Virtualization Manager Plugin'
keywords: ['monitors', 'virtualization', 'esxi', 'alert', 'dataview']
description: 'This guide provides detailed instructions on sharing internal monitor details with partners regarding the Virtualization Manager plugin. It includes setup, implementation steps, and associated content for monitoring ESXi hosts.'
tags: ['esxi', 'networking']
draft: false
unlisted: false
---

## Purpose

This guide explains what details can be shared with our partners regarding the internal monitors we use, which depend on data from the Virtualization Manager plugin. The success of this approach hinges on correctly setting up and running the Virtualization Manager Plugin.

It's essential to confirm that the Virtualization Manager Plugin is properly configured and working in the partner's environment before moving forward with implementing or importing the associated content. If there are any issues, please don't hesitate to reach out for assistance.

## Associated Content

### Monitors

| Content                                                                                       | Type            | Function                                                                                                                                                           |
|-----------------------------------------------------------------------------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Internal Monitor - ESXi Host Not Communicating > 3 Days](<../cwa/monitors/ESXi Host Not Communicating 3 Days.md>) | Internal Monitor | This monitor is intended to report any ESXi hosts in the system that have not checked in with Automate for more than 3 days.                                   |
| [Internal Monitor - ESXi Bad Sensor](<../cwa/monitors/ESXi Bad Sensor.md>)                  | Internal Monitor | This monitor is intended to report any ESXi hosts in the system that have reported a Bad Sensor within the VMware monitoring.                                   |
| [Internal Monitor - ESXi Old Snapshots Detected > 3 Days](<../cwa/monitors/ESXi Old Snapshots Detected 3 Days.md>) | Internal Monitor | This monitor identifies the ESXi host servers that contain one or more snapshots older than three days. Default alerting contains the information of all the virtual machines and the older snapshots grouped by the ESXi host. |
| [Internal Monitor - ESXi Storage Space < 10%](<../cwa/monitors/ESXi Storage Space 10.md>)   | Internal Monitor | This monitor is intended to report any ESXi hosts in the system that have reported a remaining storage space for any disk that is less than 10% within the VMware monitoring. |
| [Internal Monitor - ESXi Invalid License Detected](<../cwa/monitors/ESXi Invalid License Detected.md>) | Internal Monitor | The purpose of this monitor is to detect the ESXi hosts with expired or trial version license keys.                                                              |

### Alert Templates

| Content                                                                                               | Type            | Function                                                                                                                                                                                                                     |
|-------------------------------------------------------------------------------------------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Ticket Creation - VMware ESXi Monitoring](<../cwa/scripts/Ticket Creation - VMware ESXi Monitoring.md>) | Autofix Script  | This script creates a ticket on the related network probe for the detected device. Used by the `△ Custom - Ticket Creation - ESXi Monitoring` alert template.                                                             |
| △ Custom - Ticket Creation - ESXi Monitoring                                                          | Alert Template   | This alert template is designed for generating tickets related to devices identified by the internal monitors mentioned earlier.                                                                                         |
| [Script - Email Creation - VMware ESXi Monitoring](<../cwa/scripts/Email Creation - VMware ESXi Monitoring.md>) | Autofix Script  | This script sends an email alert for the devices detected by the earlier-mentioned internal monitors. Used by the `△ Custom - Email Creation - ESXi Monitoring` alert template.                                             |
| △ Custom - Email Creation - VMware ESXi Monitoring                                                   | Alert Template   | This alert template is designed for sending emails related to devices identified by the internal monitors mentioned earlier. This alert template **should be used only if the partner wishes to send an email for alerting instead of a ticket**. |

### Dataviews

| Content                                                                                   | Type      | Function                                                                                                 |
|-------------------------------------------------------------------------------------------|-----------|----------------------------------------------------------------------------------------------------------|
| [Dataview - ESXi Hosts](<../cwa/dataviews/ESXi Hosts.md>)                  | Dataview  | This dataview shows useful information about ESXi hosts.                                               |
| [Dataview - ESXi Snapshots](<../cwa/dataviews/ESXi Snapshots.md>)            | Dataview  | This dataview audits snapshots for virtual machines hosted on the ESXi.                                |

## Implementation

1. Please verify whether any of the monitor sets listed in the `Monitors` table already exist. If any of the monitor sets are already present, please follow the process outlined in [this document](https://proval.itglue.com/5078775/docs/14731110).

2. Import the following internal monitors using the Prosync Plugin:
   - [Internal Monitor - ESXi Host Not Communicating > 3 Days](<../cwa/monitors/ESXi Host Not Communicating 3 Days.md>)
   - [Internal Monitor - ESXi Bad Sensor](<../cwa/monitors/ESXi Bad Sensor.md>)
   - [Internal Monitor - ESXi Old Snapshots Detected > 3 Days](<../cwa/monitors/ESXi Old Snapshots Detected 3 Days.md>)
   - [Internal Monitor - ESXi Storage Space < 10%](<../cwa/monitors/ESXi Storage Space 10.md>)
   - [Internal Monitor - ESXi Invalid License Detected](<../cwa/monitors/ESXi Invalid License Detected.md>)

3. Import the following dataviews from the Prosync Plugin:
   - [Dataview - ESXi Hosts](<../cwa/dataviews/ESXi Hosts.md>)
   - [Dataview - ESXi Snapshots](<../cwa/dataviews/ESXi Snapshots.md>)

4. Import the required alert template from the following list using the Prosync plugin.
   - Custom - Ticket Creation - ESXi Monitoring
     - Unless specified by the consultant, import and use this one only.
   - Custom - Email Creation - VMware ESXi Monitoring
     - **Only import this one if the partner requires emailing (typically not required).**

5. Import the required autofix script from the following list using the Prosync plugin, if they are not already imported along with the alert template.
   - [Script - Ticket Creation - VMware ESXi Monitoring](<../cwa/scripts/Ticket Creation - VMware ESXi Monitoring.md>)
   - [Script - Email Creation - VMware ESXi Monitoring](<../cwa/scripts/Email Creation - VMware ESXi Monitoring.md>)

6. Reload the System Cache  
   ![Reload System Cache](../../static/img/ESXi-Virtualization-Manager-Customized-Monitoring/image_1.png)

7. Configure the solution as follows:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - ESXi Host Not Communicating > 3 Days](<../cwa/monitors/ESXi Host Not Communicating 3 Days.md>)
       - Configure with the imported alert template
         - Unless otherwise stated by the consultant, use this: `△ Custom - Ticket Creation - ESXi Monitoring`
       - Right-click and Run Now to start the monitor.
     - [Internal Monitor - ESXi Bad Sensor](<../cwa/monitors/ESXi Bad Sensor.md>)
       - Configure with the imported alert template
         - Unless otherwise stated by the consultant, use this: `△ Custom - Ticket Creation - ESXi Monitoring`
       - Right-click and Run Now to start the monitor.
     - [Internal Monitor - ESXi Old Snapshots Detected > 3 Days](<../cwa/monitors/ESXi Old Snapshots Detected 3 Days.md>)
       - Configure with the imported alert template
         - Unless otherwise stated by the consultant, use this: `△ Custom - Ticket Creation - ESXi Monitoring`
       - Right-click and Run Now to start the monitor.
     - [Internal Monitor - ESXi Storage Space < 10%](<../cwa/monitors/ESXi Storage Space 10.md>)
       - Configure with the imported alert template
         - Unless otherwise stated by the consultant, use this: `△ Custom - Ticket Creation - ESXi Monitoring`
       - Right-click and Run Now to start the monitor.
     - [Internal Monitor - ESXi Invalid License Detected](<../cwa/monitors/ESXi Invalid License Detected.md>)
       - Configure with the imported alert template
         - Unless otherwise stated by the consultant, use this: `△ Custom - Ticket Creation - ESXi Monitoring`
       - Right-click and Run Now to start the monitor.

## FAQ

**Q:** Where will the ticket be generated, and on which device?  
**A:** The ticket will be created for the identified device and associated with the respective Network Probe.

**Q:** My VMware ESXi host is not showing up in the Virtualization Manager. What can I do to troubleshoot?  
**A:** Refer to this document: [VMware Host Not Detected in Virtualization Manager Plugin](https://proval.itglue.com/DOC-5078775-11901041)

