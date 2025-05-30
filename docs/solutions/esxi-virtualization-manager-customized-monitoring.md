---
id: 'deb78496-0147-4a1b-b368-3b3113f9cf5b'
slug: /deb78496-0147-4a1b-b368-3b3113f9cf5b
title: 'ESXi Virtualization Manager Customized Monitoring'
title_meta: 'ESXi Virtualization Manager Customized Monitoring'
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
| [Internal Monitor - ESXi Host Not Communicating > 3 Days](/docs/905bda70-64aa-4e66-a18f-c5d0eef2b7fd) | Internal Monitor | This monitor is intended to report any ESXi hosts in the system that have not checked in with Automate for more than 3 days.                                   |
| [Internal Monitor - ESXi Bad Sensor](/docs/2f8424d7-00aa-4cee-a4fb-56cbc412108b)                  | Internal Monitor | This monitor is intended to report any ESXi hosts in the system that have reported a Bad Sensor within the VMware monitoring.                                   |
| [Internal Monitor - ESXi Old Snapshots Detected > 3 Days](/docs/7f795515-a2b5-4041-85c8-64b6c6e59470) | Internal Monitor | This monitor identifies the ESXi host servers that contain one or more snapshots older than three days. Default alerting contains the information of all the virtual machines and the older snapshots grouped by the ESXi host. |
| [Internal Monitor - ESXi Storage Space < 10%](/docs/9b1477b3-6d88-4a1c-b313-50c638bb84ee)   | Internal Monitor | This monitor is intended to report any ESXi hosts in the system that have reported a remaining storage space for any disk that is less than 10% within the VMware monitoring. |
| [Internal Monitor - ESXi Invalid License Detected](/docs/e413063b-7bce-4a4e-99ce-daea264d6ac6) | Internal Monitor | The purpose of this monitor is to detect the ESXi hosts with expired or trial version license keys.                                                              |

### Alert Templates

| Content                                                                                               | Type            | Function                                                                                                                                                                                                                     |
|-------------------------------------------------------------------------------------------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Ticket Creation - VMware ESXi Monitoring](/docs/7fbdffc1-7472-4276-914d-1e5b845dcd3c) | Autofix Script  | This script creates a ticket on the related network probe for the detected device. Used by the `△ Custom - Ticket Creation - ESXi Monitoring` alert template.                                                             |
| △ Custom - Ticket Creation - ESXi Monitoring                                                          | Alert Template   | This alert template is designed for generating tickets related to devices identified by the internal monitors mentioned earlier.                                                                                         |
| [Script - Email Creation - VMware ESXi Monitoring](/docs/642f7615-925c-481f-b4bf-8d6b2c9ad6de) | Autofix Script  | This script sends an email alert for the devices detected by the earlier-mentioned internal monitors. Used by the `△ Custom - Email Creation - ESXi Monitoring` alert template.                                             |
| △ Custom - Email Creation - VMware ESXi Monitoring                                                   | Alert Template   | This alert template is designed for sending emails related to devices identified by the internal monitors mentioned earlier. This alert template **should be used only if the partner wishes to send an email for alerting instead of a ticket**. |

### Dataviews

| Content                                                                                   | Type      | Function                                                                                                 |
|-------------------------------------------------------------------------------------------|-----------|----------------------------------------------------------------------------------------------------------|
| [Dataview - ESXi Hosts](/docs/556a609f-b0e6-401b-afc0-17932fde35c7)                  | Dataview  | This dataview shows useful information about ESXi hosts.                                               |
| [Dataview - ESXi Snapshots](/docs/4afe3dcb-4326-4833-a87a-77a14a882c81)            | Dataview  | This dataview audits snapshots for virtual machines hosted on the ESXi.                                |

## Implementation

1. Please verify whether any of the monitor sets listed in the `Monitors` table already exist. If any of the monitor sets are already present, please follow the process outlined in [this document](/docs/b6eac8f7-222b-4c72-8bed-0b81c138074a).

2. Import the following internal monitors using the Prosync Plugin:
   - [Internal Monitor - ESXi Host Not Communicating > 3 Days](/docs/905bda70-64aa-4e66-a18f-c5d0eef2b7fd)
   - [Internal Monitor - ESXi Bad Sensor](/docs/2f8424d7-00aa-4cee-a4fb-56cbc412108b)
   - [Internal Monitor - ESXi Old Snapshots Detected > 3 Days](/docs/7f795515-a2b5-4041-85c8-64b6c6e59470)
   - [Internal Monitor - ESXi Storage Space < 10%](/docs/9b1477b3-6d88-4a1c-b313-50c638bb84ee)
   - [Internal Monitor - ESXi Invalid License Detected](/docs/e413063b-7bce-4a4e-99ce-daea264d6ac6)

3. Import the following dataviews from the Prosync Plugin:
   - [Dataview - ESXi Hosts](/docs/556a609f-b0e6-401b-afc0-17932fde35c7)
   - [Dataview - ESXi Snapshots](/docs/4afe3dcb-4326-4833-a87a-77a14a882c81)

4. Import the required alert template from the following list using the Prosync plugin.
   - Custom - Ticket Creation - ESXi Monitoring
     - Unless specified by the consultant, import and use this one only.
   - Custom - Email Creation - VMware ESXi Monitoring
     - **Only import this one if the partner requires emailing (typically not required).**

5. Import the required autofix script from the following list using the Prosync plugin, if they are not already imported along with the alert template.
   - [Script - Ticket Creation - VMware ESXi Monitoring](/docs/7fbdffc1-7472-4276-914d-1e5b845dcd3c)
   - [Script - Email Creation - VMware ESXi Monitoring](/docs/642f7615-925c-481f-b4bf-8d6b2c9ad6de)

6. Reload the System Cache  
   ![Reload System Cache](../../static/img/docs/deb78496-0147-4a1b-b368-3b3113f9cf5b/image_1.webp)

7. Configure the solution as follows:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - ESXi Host Not Communicating > 3 Days](/docs/905bda70-64aa-4e66-a18f-c5d0eef2b7fd)
       - Configure with the imported alert template
         - Unless otherwise stated by the consultant, use this: `△ Custom - Ticket Creation - ESXi Monitoring`
       - Right-click and Run Now to start the monitor.
     - [Internal Monitor - ESXi Bad Sensor](/docs/2f8424d7-00aa-4cee-a4fb-56cbc412108b)
       - Configure with the imported alert template
         - Unless otherwise stated by the consultant, use this: `△ Custom - Ticket Creation - ESXi Monitoring`
       - Right-click and Run Now to start the monitor.
     - [Internal Monitor - ESXi Old Snapshots Detected > 3 Days](/docs/7f795515-a2b5-4041-85c8-64b6c6e59470)
       - Configure with the imported alert template
         - Unless otherwise stated by the consultant, use this: `△ Custom - Ticket Creation - ESXi Monitoring`
       - Right-click and Run Now to start the monitor.
     - [Internal Monitor - ESXi Storage Space < 10%](/docs/9b1477b3-6d88-4a1c-b313-50c638bb84ee)
       - Configure with the imported alert template
         - Unless otherwise stated by the consultant, use this: `△ Custom - Ticket Creation - ESXi Monitoring`
       - Right-click and Run Now to start the monitor.
     - [Internal Monitor - ESXi Invalid License Detected](/docs/e413063b-7bce-4a4e-99ce-daea264d6ac6)
       - Configure with the imported alert template
         - Unless otherwise stated by the consultant, use this: `△ Custom - Ticket Creation - ESXi Monitoring`
       - Right-click and Run Now to start the monitor.

## FAQ

**Q:** Where will the ticket be generated, and on which device?  
**A:** The ticket will be created for the identified device and associated with the respective Network Probe.

**Q:** My VMware ESXi host is not showing up in the Virtualization Manager. What can I do to troubleshoot?  
**A:** Refer to this document: [VMware Host Not Detected in Virtualization Manager Plugin](/docs/2dc2bb07-e083-48d0-836e-55e40c05c871)