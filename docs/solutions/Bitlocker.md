---
id: 'f41e4d71-7074-4c28-8246-b8e3036c1212'
title: 'Managing Bitlocker Protection on Endpoints'
title_meta: 'Managing Bitlocker Protection on Endpoints'
keywords: ['bitlocker', 'encryption', 'security', 'audit', 'monitoring']
description: 'This document provides a comprehensive guide on managing Bitlocker protection on endpoints, including updates on auditing scripts, implementation steps, and optional configurations for automatic encryption and Active Directory backups.'
tags: ['encryption', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

To manage Bitlocker protection on endpoints.

## Update Notice: 6-Sept-2024

- The solution has been updated to store and display the data even if the computer is retired. However, the data cannot be displayed if the computer is also deleted from the retired assets.
- Modified Content:
  - [Script - Bitlocker - Audit](<../cwa/scripts/Bitlocker - Audit.md>)
  - [Script - Bitlocker - AD Key Protector - Audit](<../cwa/scripts/Bitlocker - AD Key Protector - Audit.md>)
  - [Custom Table - plugin_proval_bitlocker_audit](<../cwa/tables/plugin_proval_bitlocker_audit.md>)
  - [Custom Table - plugin_proval_tpm_audit](<../cwa/tables/plugin_proval_tpm_audit.md>)
- New Content:
  - [Dataview - Bitlocker Status - Retired Computers](<../unsorted/SEC - Encryption - Dataview - Bitlocker Status - Retired Computers.md>)
- Sync the modified scripts from the `Prosync` plugin and run the [Bitlocker - Audit](<../cwa/scripts/Bitlocker - Audit.md>) script against any online Windows computer with the `Set_Environment` parameter set to `1` to modify the custom tables.

![Image](../../static/img/Bitlocker/image_1.png)

## Associated Content

### Auditing Content

| Content | Type | Function |
|---------|------|----------|
| [Script - Bitlocker - Audit](<../cwa/scripts/Bitlocker - Audit.md>) | Script | Gathers Bitlocker information from the target endpoint and stores it in the [Custom Table - plugin_proval_bitlocker_audit](<../cwa/tables/plugin_proval_bitlocker_audit.md>). |
| [Script - Bitlocker - AD Key Protector - Audit](<../cwa/scripts/Bitlocker - AD Key Protector - Audit.md>) | Script | Audits the existing backup Bitlocker key protectors from an Active Directory server. |
| [Script - Bitlocker Recovery Password - AD Backup](https://proval.itglue.com/DOC-5078775-10672949) | Script | This script backs up Bitlocker Recovery Passwords to the associated Active Directory instance. |
| [Dataview - Bitlocker Status](<../cwa/dataviews/Bitlocker Status.md>) | Dataview | Displays information from the [Custom Table - plugin_proval_bitlocker_audit](<../cwa/tables/plugin_proval_bitlocker_audit.md>) filled by the [Script - Bitlocker - Audit](<../cwa/scripts/Bitlocker - Audit.md>). Additionally, it displays information about the Active Directory backup status of each key protector. |
| [Dataview - Bitlocker Status - Retired Computers](<../unsorted/SEC - Encryption - Dataview - Bitlocker Status - Retired Computers.md>) | Dataview | Displays the Bitlocker data stored in the [Custom Table - plugin_proval_bitlocker_audit](<../cwa/tables/plugin_proval_bitlocker_audit.md>) for the retired computers. |
| [SEC - Encryption - Dataview - Bitlocker - AD Backup Audit](<../cwa/dataviews/Bitlocker - AD Backup Audit.md>) | Dataview | Displays Bitlocker key protectors backed up to Active Directory. |
| [Internal Monitor - ProVal - Production - Security - Stale Bitlocker Data](<../cwa/monitors/Security - Stale Bitlocker Data.md>) | Internal Monitor | Detects Windows computers where the [Script - Bitlocker - Audit](<../cwa/scripts/Bitlocker - Audit.md>) script has not executed within the last 30 days and triggers the audit script to run. |
| [CWM - Automate - Roles - Bitlocker](https://proval.itglue.com/DOC-5078775-17817010) | Role | These roles determine whether the Windows server is eligible for Bitlocker. They are also used in the [Internal Monitor - ProVal - Production - Security - Stale Bitlocker Data](<../cwa/monitors/Security - Stale Bitlocker Data.md>). |
| [CWA Dataview - Bitlocker Initialize Failure Audit [Script]](<../cwa/dataviews/Bitlocker Initialize Failure Audit Script.md>) | Dataview (Optional) | This dataview contains records of computers where the BitLocker initialization failed twice due to the Autofix script "[Script - Bitlocker - Volume - Initialize [Autofix, Param] - Wrapper](<../cwa/scripts/Bitlocker - Volume - Initialize Autofix,Param - Wrapper.md>)". |

### Automation

| Content | Type | Function |
|---------|------|----------|
| [Script - Bitlocker - Initialize Volume](https://proval.itglue.com/DOC-5078775-8934308) | Script | Encrypts a drive with Bitlocker disk encryption. |
| [Script - Bitlocker - Remove Volume](<../cwa/scripts/Bitlocker - Remove Volume.md>) | Script | Disables Bitlocker protection on one (or all) volumes. |
| [Internal Monitor - Bitlocker - Missing Key Protectors](<../cwa/monitors/Bitlocker - Missing Key Protectors.md>) | Internal Monitor | Detects computers where Bitlocker is enabled, and the drive is fully encrypted but does not have any key protectors. |
| [Bitlocker - Volume - Add Recovery Password [Autofix]](<../cwa/scripts/Bitlocker - Volume - Add Recovery Password Autofix.md>) | Script | Adds a recovery password to the drive where BitLocker is enabled but a key protector is not found. It is an autofix script for the [Internal Monitor - Bitlocker - Missing Key Protectors](<../cwa/monitors/Bitlocker - Missing Key Protectors.md>) monitor set. |
| △ Custom - Execute Script - Bitlocker - Volume - Add Recovery Password | Alert Template | This will be used with the [Internal Monitor - Bitlocker - Missing Key Protectors](<../cwa/monitors/Bitlocker - Missing Key Protectors.md>) and should execute the script [Bitlocker - Volume - Add Recovery Password [Autofix]](<../cwa/scripts/Bitlocker - Volume - Add Recovery Password Autofix.md>). |
| [Script - Bitlocker - Volume - Initialize [Autofix,Param] - Wrapper](<../cwa/scripts/Bitlocker - Volume - Initialize Autofix,Param - Wrapper.md>) | Script (Optional) | This script runs as an autofix to deploy the BitLocker initialization to the agents detected by the monitor [Internal Monitor - Bitlocker - Initialize Volume Deployment](<../cwa/monitors/Bitlocker - Initialize Volume Deployment.md>). |
| [Internal Monitor - Bitlocker - Initialize Volume Deployment](<../cwa/monitors/Bitlocker - Initialize Volume Deployment.md>) | Internal Monitor (Optional) | This internal monitor detects online supported Windows OS (Windows 10/11, Windows Server 2016, 2019, and 2022) that have not been updated in the `plugin_proval_bitlocker_audit` table in the last 7 days and do not have the keyprotectorid and protectionstatus set. It also checks if the location-EDF 'BitLocker Enable List' is set to either "AllDrive" or "SystemDrive" from the dropdown option and the computer-EDF 'BitLocker Enable Exclude' is not checked. It ensures running the [Script - Bitlocker - Volume - Initialize [Autofix,Param] - Wrapper](<../cwa/scripts/Bitlocker - Volume - Initialize Autofix,Param - Wrapper.md>) once every 7 days on the detected agents to avoid multiple reiterate attempts. |
| △ Custom - Execute Script - Bitlocker - Volume - Initialize [Autofix] - Wrapper | Alert Template (Optional) | This alert template needs to be applied to [Internal Monitor - Bitlocker - Initialize Volume Deployment](<../cwa/monitors/Bitlocker - Initialize Volume Deployment.md>) and should execute the [Script - Bitlocker - Volume - Initialize [Autofix,Param] - Wrapper](<../cwa/scripts/Bitlocker - Volume - Initialize Autofix,Param - Wrapper.md>). |
| [Remote Monitor - Enable Bitlocker Feature](<../cwa/monitors/Enable Bitlocker Feature.md>) | Remote Monitor | Enables the following Bitlocker features on the Windows server if they are not already installed: <ul><li>BitLocker Drive Encryption Administration Utilities</li><li>BitLocker Recovery Password Viewer</li><li>BitLocker Drive Encryption Tools</li></ul> |

### Other Content

| Content | Type | Function |
|---------|------|----------|
| [Agnostic - Initialize-BitLockerVolume](<../powershell/Initialize-BitLockerVolume.md>) | Agnostic | Encrypts a drive with Bitlocker disk encryption. |
| [Agnostic - Unprotect-BitLockerVolume](<../powershell/Unprotect-BitLockerVolume.md>) | Agnostic | Disables Bitlocker protection on one (or all) volumes. |
| [Agnostic - Get-ADBitlockerStores](https://proval.itglue.com/DOC-5078775-9038164) | Agnostic | Returns objects from AD representing backed up Bitlocker key protectors. |
| [Custom Table - plugin_proval_bitlocker_audit](<../cwa/tables/plugin_proval_bitlocker_audit.md>) | Custom Table | Stores information about Bitlocker configuration on target machines. |
| [Custom Table - plugin_proval_ad_bitlocker_keyprotectors](<../cwa/tables/plugin_proval_ad_bitlocker_keyprotectors.md>) | Custom Table | Stores information about Bitlocker key protectors backed up to Active Directory. |
| [Custom Table - plugin_proval_tpm_audit](<../cwa/tables/plugin_proval_tpm_audit.md>) | Custom Table | This table will be populated by the [Script - Bitlocker - Audit](<../cwa/scripts/Bitlocker - Audit.md>). It holds all data from the Get-TPM command. |

## Implementation

1. Import the following scripts using the ProSync plugin:
   - [Script - Bitlocker - Initialize Volume](https://proval.itglue.com/DOC-5078775-8934308)
   - [Script - Bitlocker - Remove Volume](<../cwa/scripts/Bitlocker - Remove Volume.md>)
   - [Script - Bitlocker - Audit](<../cwa/scripts/Bitlocker - Audit.md>)
   - [Script - Bitlocker - AD Key Protector - Audit](<../cwa/scripts/Bitlocker - AD Key Protector - Audit.md>)

2. Import the following Dataviews using the ProSync Plugin:
   - [Dataview - Bitlocker Status](<../cwa/dataviews/Bitlocker Status.md>)
   - [Dataview - Bitlocker Status - Retired Computers](<../unsorted/SEC - Encryption - Dataview - Bitlocker Status - Retired Computers.md>)

3. Import the following monitors using the ProSync Plugin:
   - [Internal Monitor - ProVal - Production - Security - Stale Bitlocker Data](<../cwa/monitors/Security - Stale Bitlocker Data.md>)

4. Import the following Alert Templates using the ProSync plugin:
   - △ Custom - Execute Script - Bitlocker - Audit

5. Import the following roles using the SQL provided in the [CWM - Automate - Roles - Bitlocker](https://proval.itglue.com/DOC-5078775-17817010):
   - Windows Server Bitlocker
   - Windows Server Bitlocker-Utilities
   - Windows Server BitLocker-RemoteAdminTool

6. Reload the System Cache  
   ![Image](../../static/img/Bitlocker/image_2.png)

7. Execute the [Script - Bitlocker - Audit](<../cwa/scripts/Bitlocker - Audit.md>) against any online Windows computer with the `Set_Environment` parameter set to `1` to create the custom tables used by the solution.  
   ![Image](../../static/img/Bitlocker/image_3.png)

8. Configure the solution as follows:
   - Navigate to Automation --> Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - ProVal - Production - Security - Stale Bitlocker Data](<../cwa/monitors/Security - Stale Bitlocker Data.md>)
       - Configure with the alert template: `△ Custom - Execute Script - Bitlocker - Audit`
       - Right-click and Run Now to start the monitor
   - Use the implementation instructions in the document below to set up this remote monitor:
     - [Remote Monitor - Enable Bitlocker Feature](<../cwa/monitors/Enable Bitlocker Feature.md>)
       - Import this monitor to the Domain Controllers group
       - **Do NOT** assign any alert template to the monitor.

### Optional

#### Auto Encryption

1. If the partner would like to perform the auto-deployment of the Bitlocker - Initialize volume, then only get the document below imported and implemented as mentioned:
   - Import the internal monitor:  
     [Internal Monitor - Bitlocker - Initialize Volume Deployment](<../cwa/monitors/Bitlocker - Initialize Volume Deployment.md>)
   - Import the dataview:  
     [CWA Dataview - Bitlocker Initialize Failure Audit [Script]](<../cwa/dataviews/Bitlocker Initialize Failure Audit Script.md>)
   - Import the script:  
     [Script - Bitlocker - Volume - Initialize [Autofix, Param] - Wrapper](<../cwa/scripts/Bitlocker - Volume - Initialize Autofix,Param - Wrapper.md>)
   - Import the alert template:  
     △ Custom - Execute Script - Bitlocker - Volume - Initialize [Autofix] - Wrapper
   - Configure the monitor [Internal Monitor - Bitlocker - Initialize Volume Deployment](<../cwa/monitors/Bitlocker - Initialize Volume Deployment.md>) with the alert template: `△ Custom - Execute Script - Bitlocker - Volume - Initialize [Autofix] - Wrapper`
   - Right-click and Run Now to start the monitor.

#### Bitlocker - AD Backup

1. If the partner would like their **recovery keys backed up into Active Directory**, a GPO must be created to support this.  
   - Import the script:  
     [Script - Bitlocker Recovery Password - AD Backup](https://proval.itglue.com/DOC-5078775-10672949)  
     [Bitlocker - AD Key Protector - Audit](<../cwa/scripts/Bitlocker - AD Key Protector - Audit.md>)
   - Import the Dataview:  
     [Dataview - Bitlocker AD Backups](<../cwa/dataviews/Bitlocker - AD Backup Audit.md>)  
   - Use the following document to implement this:
     - After the GPO has been created, run the [Script - Bitlocker Recovery Password - AD Backup](https://proval.itglue.com/DOC-5078775-10672949) on a single domain-joined workstation at that client to validate the settings.
     - [Bitlocker - AD Key Protector - Audit](<../cwa/scripts/Bitlocker - AD Key Protector - Audit.md>) (Tutorial at the bottom of the document)

#### Missing Key Protectors

1. If the partner would like to ensure the monitor set detects the computer where Bitlocker is enabled, and the drive is fully encrypted but does not have any key protectors, follow the steps below to set this up:
   - Import the internal monitor:  
     [Internal Monitor - Bitlocker - Missing Key Protectors](<../cwa/monitors/Bitlocker - Missing Key Protectors.md>)  
   - Import the script:  
     [Bitlocker - Volume - Add Recovery Password [Autofix]](<../cwa/scripts/Bitlocker - Volume - Add Recovery Password Autofix.md>).  
   - Configure with the alert template: `△ Custom - Execute Script - Bitlocker - Volume - Add Recovery Password`
     - Right-click and Run Now to start the monitor.
