---
id: 'cwa-auditing-windows-updates'
title: 'Auditing Windows 10 and 11 Cumulative Updates'
title_meta: 'Auditing Windows 10 and 11 Cumulative Updates'
keywords: ['windows', 'updates', 'cumulative', 'audit', 'autofix']
description: 'This document provides a comprehensive guide for auditing Windows 10 and 11 computers to ensure they have the latest installed Cumulative Update. It includes steps for implementation, automation, and troubleshooting, along with associated content and internal monitors to streamline the update process.'
tags: ['windows', 'update', 'audit', 'monitoring', 'automation', 'alert', 'software']
draft: false
unlisted: false
---
## Purpose

The solution conducts audits on Windows 10 and 11 computers to check for the latest installed Cumulative Update. It offers an Autofix option, automatically attempting to install the latest available CU if a CU hasn't been installed on the computer for over 75 days.

## Associated Content

#### Auditing

| Content                                                                                   | Type          | Function                                                         |
|-------------------------------------------------------------------------------------------|---------------|------------------------------------------------------------------|
| [Script - Get Lastest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478)  | Script        | Fetches the data from the machine.                               |
| [Dataview - Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849510)  | Dataview     | Displays the data fetched by the script.                         |
| [Internal Monitor - Execute Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849458)  | Internal Monitor | Detects machines where the script hasn't been executed within the last 7 days. |
| △ Custom - Execute Script - Get Latest Installed Cumulative Update                      | Alert Template | Executes the script upon the machines detected by the internal monitor. |

#### Automation

| Content                                                                                   | Type          | Function                                                         |
|-------------------------------------------------------------------------------------------|---------------|------------------------------------------------------------------|
| [Internal Monitor - Last Cumulative Update > 75 Days ago](https://proval.itglue.com/DOC-5078775-13582373)  | Internal Monitor | Detects computers that haven't received a Cumulative Update installation within the past 75 days, excluding End-of-Life (EOL) machines. |
| [Script - Out of Date Cumulative Updates [Autofix]*](https://proval.itglue.com/DOC-5078775-14790498)  | Autofix Script | Initiates the installation of the latest available Cumulative Update. |
| △ Custom - Autofix - Out of Date Cumulative Updates                                      | Alert Template | Executes the Autofix script upon the machines detected by the internal monitor. |

#### Other

| Content                                                                                   | Type          | Function                                                         |
|-------------------------------------------------------------------------------------------|---------------|------------------------------------------------------------------|
| [Custom Table - pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12849460)  | Custom Table  | Stores the data fetched by the [Script - Get Lastest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478) script. |
| [Script - MySQL - Table - Create (plugin_proval_windows_os_support)](https://proval.itglue.com/DOC-5078775-11564131)  | Script        | Inserts the latest version of the [plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690) custom table. |
| [Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690)  | Custom Table  | Stores windows operating systems support end date, build number, and their respective Released if any.<br>The table should be updated to the latest version to use this solution at its full potential. The custom table can be updated by the [Script - MySQL - Table - Create (plugin_proval_windows_os_support)](https://proval.itglue.com/DOC-5078775-11564131) script. |

## Implementation

### 1.
Import the following scripts from the `ProSync` plugin:
- [Script - Get Lastest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478)
- [Script - Out of Date Cumulative Updates [Autofix]*](https://proval.itglue.com/DOC-5078775-14790498)
- [Script - MySQL - Table - Create (plugin_proval_windows_os_support)](https://proval.itglue.com/DOC-5078775-11564131)

### 2.
Import the following internal monitors from the `ProSync` plugin:
- [Internal Monitor - Execute Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849458)
- [Internal Monitor - Last Cumulative Update > 75 Days ago](https://proval.itglue.com/DOC-5078775-13582373)

### 3.
Import the [Dataview - Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849510) dataview from the `ProSync` plugin.

### 4.
Import the following alert templates from the `ProSync` plugin:
- △ Custom - Execute Script - Get Latest Installed Cumulative Update
- △ Custom - Autofix - Out of Date Cumulative Updates
- △ Custom - Autofix - Ticket Creation Computer

### 5.
Reload the System Cache.

![Reload the System Cache](../../static/img/Latest-Installed-Cumulative-Update/image_2.png)

### 6.
Execute the [Get Lastest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478) script against a couple of online Windows 10/11 computers and validate the data in the [Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849510) dataview.

### 7.
Configure the Auditing section of the solution as follows:
- Navigate to Automation → Monitors within the CWA Control Center and setup the following:
  - [Internal Monitor - Execute Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849458)
    - Configure with the alert template: `△ Custom - Execute Script - Get Latest Installed Cumulative Update`
    - Right-click and Run Now to start the monitor

#### Autofix

### 1.
- Execute the [Out of Date Cumulative Updates [Autofix]*](https://proval.itglue.com/DOC-5078775-14790498) script against a Windows computer with the script parameter `Set_Environment` configured as `1`. This action will import the necessary System Properties required for solution management.

![Execute Autofix Script](../../static/img/Latest-Installed-Cumulative-Update/image_3.png)

- Configure the necessary values within the system properties.
  - `Out_of_Date_CU-EmailAlerts`: Configure this system property to 1 to activate Email Alerts in conjunction with the tickets.
  - `Out_of_Date_CU-Autofix_for_Servers`: Assign a value of 1 to this system property to enable Autofix for servers; by default, the script will only generate a ticket for servers.

### 2.
Configure the Autofix section of the solution as follows:
- Navigate to Automation → Monitors within the CWA Control Center and setup the following:
  - [Internal Monitor - Last Cumulative Update > 75 Days ago](https://proval.itglue.com/DOC-5078775-13582373)
    - Configure with the alert template: `△ Custom - Autofix - Out of Date Cumulative Updates`
    - Set the required ticket category as explained in the **Ticket Category** section of the [Out of Date Cumulative Updates [Autofix]*](https://proval.itglue.com/DOC-5078775-14790498) script's document.
    - Right-click and Run Now to start the monitor

#### Ticket Only

### 1.
Configure the Autofix section of the solution as follows:
- Navigate to Automation → Monitors within the CWA Control Center and setup the following:
  - [Internal Monitor - Last Cumulative Update > 75 Days ago](https://proval.itglue.com/DOC-5078775-13582373)
    - Configure with the alert template: `△ Custom - Ticket Creation - Computer`
    - Right-click and Run Now to start the monitor

## FAQ

**Q:** The Dataview shows this machine is online currently but has not updated its inventory in well over 10 days, why?  
**A:** The monitor is setup to run only against machines that are not EOL or recently EOL (Within 30 days). If the machine is not EOL currently, check to make sure the monitor is setup to run against the group that machine is in.



