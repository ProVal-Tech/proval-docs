---
id: '56ed4b40-11ce-4f8d-b1ca-c897d2c496e6'
slug: /56ed4b40-11ce-4f8d-b1ca-c897d2c496e6
title: 'Server Roles Detection and Grouping for NinjaOne'
title_meta: 'Server Roles Detection and Grouping for NinjaOne'
keywords: ['ninja', 'roles', 'server-roles']
description: 'This document details the procedure for categorizing servers into suitable groups according to their installed roles.'
tags: ['custom-fields', 'windows']
draft: false
unlisted: false
---

## Purpose

This document details the procedure for categorizing servers into suitable groups according to their installed roles."

## Associated Content

| Content | Type | Function |
| ------- | ---- | -------- |
| [cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) | Group | A group designated for machines running the Windows Servers. |
| [Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9) | Automation | Retrieves installed Windows Server roles, additional services, and FSMO roles (if applicable). |
| [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) | Custom Field | This custom field stores the list of roles detected on a Windows server. |
| [Windows Server Roles Detection](/docs/8bbf34f6-8c05-4776-9f8c-c589944b4042) | Task | Runs the [Windows Server Roles Detection](../automations/windows-server-roles-detection.md) automation daily against [cPVAL - Windows Servers](../groups/cpval-windows-servers.md) group |

## Server Role Groups

| Name | Role | Condition | Description |
| ---- | ---- | --------- | ----------- |
| [cPVAL - Server Role - Certificate Authority Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Active Directory Certificate Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Active Directory Certificate Services` | A group tailored for Windows Servers that have the `Active Directory Certificate Services` role installed |
| [cPVAL - Server Role - Domain Controllers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Active Directory Domain Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Active Directory Domain Services` | A group tailored for Windows Servers that have the `Active Directory Domain Services` role installed |
| [cPVAL - Server Role - Federation Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Active Directory Federation Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Active Directory Federation Services` | A group tailored for Windows Servers that have the `Active Directory Federation Services` role installed |
| [cPVAL - Server Role - LDS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Active Directory Lightweight Directory Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Active Directory Lightweight Directory Services` | A group tailored for Windows Servers that have the `Active Directory Lightweight Directory Services` role installed |
| [cPVAL - Server Role - RMS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Active Directory Rights Management Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Active Directory Rights Management Services` | A group tailored for Windows Servers that have the `Active Directory Rights Management Services` role installed |
| [cPVAL - Server Role - Application Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Application Server | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Application Server` | A group tailored for Windows Servers that have the `Application Server` role installed |
| [cPVAL - Server Role - Health Attestation Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Device Health Attestation | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Device Health Attestation` | A group tailored for Windows Servers that have the `Device Health Attestation` role installed |
| [cPVAL - Server Role - DHCP Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | DHCP Server | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `DHCP Server` | A group tailored for Windows Servers that have the `DHCP Server` role installed |
| [cPVAL - Server Role - DNS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | DNS Server | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `DNS Server` | A group tailored for Windows Servers that have the `DNS Server` role installed |
| [cPVAL - Server Role - Fax Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Fax Server | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Fax Server` | A group tailored for Windows Servers that have the `Fax Server` role installed |
| [cPVAL - Server Role - File Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | File and Storage Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `File and Storage Services` | A group tailored for Windows Servers that have the `File and Storage Services` role installed |
| [cPVAL - Server Role - HGS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Host Guardian Service | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Host Guardian Service` | A group tailored for Windows Servers that have the `Host Guardian Service` role installed |
| [cPVAL - Server Role - Hyper-V Host](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Hyper-V | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Hyper-V` | A group tailored for Windows Servers that have the `Hyper-V` role installed |
| [cPVAL - Server Role - NPS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Network Policy and Access Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Network Policy and Access Services` | A group tailored for Windows Servers that have the `Network Policy and Access Services` role installed |
| [cPVAL - Server Role - Print Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Print and Document Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Print and Document Services` | A group tailored for Windows Servers that have the `Print and Document Services` role installed |
| [cPVAL - Server Role - Remote Access Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Remote Access | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Remote Access` | A group tailored for Windows Servers that have the `Remote Access` role installed |
| [cPVAL - Server Role - RDS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Remote Desktop Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Remote Desktop Services` | A group tailored for Windows Servers that have the `Remote Desktop Services` role installed |
| [cPVAL - Server Role - Volume Activation Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Volume Activation Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Volume Activation Services` | A group tailored for Windows Servers that have the `Volume Activation Services` role installed |
| [cPVAL - Server Role - Web Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Web Server (IIS) | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Web Server (IIS)` | A group tailored for Windows Servers that have the `Web Server (IIS)` role installed |
| [cPVAL - Server Role - WDS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Windows Deployment Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Windows Deployment Services` | A group tailored for Windows Servers that have the `Windows Deployment Services` role installed |
| [cPVAL - Server Role - Essentials Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Windows Server Essentials Experience | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Windows Server Essentials Experience` | A group tailored for Windows Servers that have the `Windows Server Essentials Experience` role installed |
| [cPVAL - Server Role - WSUS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Windows Server Update Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Windows Server Update Services` | A group tailored for Windows Servers that have the `Windows Server Update Services` role installed |
| [cPVAL - Server Role - MSSQL Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | MSSQL Server | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `MSSQL Server` | A group tailored for Windows Servers that have the `MSSQL Server` role installed |
| [cPVAL - Server Role - Exchange Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Exchange Server | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Exchange Server` | A group tailored for Windows Servers that have the `Exchange Server` role installed |
| [cPVAL - Server Role - MySQL Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | MySQL Server | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `MySQL Server` | A group tailored for Windows Servers that have the `MySQL Server` role installed |
| [cPVAL - Server Role - Veeam BDR](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Veeam BDR | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Veeam BDR` | A group tailored for Windows Servers that have the `Veeam BDR` role installed |
| [cPVAL - Server Role - SharePoint Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | SharePoint Server | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `SharePoint Server` | A group tailored for Windows Servers that have the `SharePoint Server` role installed |
| [cPVAL - Server Role - FSMO - Schema Master](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Schema Master | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Schema Master` | A group tailored for Windows Servers that have the `Schema Master` role installed |
| [cPVAL - Server Role - FSMO - Domain Naming Master](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Domain Naming Master | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Domain Naming Master` | A group tailored for Windows Servers that have the `Domain Naming Master` role installed |
| [cPVAL - Server Role - FSMO - PDC Emulator](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | PDC Emulator | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `PDC Emulator` | A group tailored for Windows Servers that have the `PDC Emulator` role installed |
| [cPVAL - Server Role - FSMO - RID Master](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | RID Master | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `RID Master` | A group tailored for Windows Servers that have the `RID Master` role installed |
| [cPVAL - Server Role - FSMO - Infrastructure Master](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3) | Infrastructure Master | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Infrastructure Master` | A group tailored for Windows Servers that have the `Infrastructure Master` role installed |

## Implementation

### Step 1

Create the [cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) group.

### Step 2

Create the [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) custom field.

### Step 3

Create the [Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9) automation.

### Step 4

Create the [Windows Server Roles Detection](/docs/8bbf34f6-8c05-4776-9f8c-c589944b4042) task schedule.

### Step 5

Create the following server role groups:

- [cPVAL - Server Role - Certificate Authority Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Domain Controllers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Federation Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - LDS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - RMS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Application Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Health Attestation Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - DHCP Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - DNS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Fax Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - File Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - HGS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Hyper-V Host](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - NPS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Print Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Remote Access Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - RDS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Volume Activation Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Web Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - WDS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Essentials Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - WSUS Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - MSSQL Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Exchange Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - MySQL Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Veeam BDR](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - SharePoint Servers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - FSMO - Schema Master](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - FSMO - Domain Naming Master](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - FSMO - PDC Emulator](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - FSMO - RID Master](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - FSMO - Infrastructure Master](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)

## FAQ

**Q1. How often should the "[Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9)" automation be scheduled?**

**A:** It is recommended to schedule the task to run daily to ensure that the server role information is up-to-date.

**Q2. Can I customize the server role groups?**

**A:** Yes, you can customize the server role groups by creating additional groups or modifying the conditions in the existing groups to suit your organization's requirements.

**Q3. What happens if a server has multiple roles installed?**

**A:** If a server has multiple roles installed, it will be included in all the corresponding server role groups based on the roles detected.

**Q4. How do I verify that the roles are being detected correctly?**

**A:** You can verify the detected roles by checking the value of the custom field [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) for a specific server. Ensure that the roles listed match the roles installed on the server.

**Q5. What should I do if a role is not being detected?**

**A:** Ensure that the [Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9) automation and task are configured correctly. Verify that the server is part of the [cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) group and that the automation is running successfully.

**Q6. Can I add roles that are not listed in this document?**

**A:** Yes, you can add additional roles by creating new server role groups and defining the conditions based on the custom field [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba).

**Q7. Is this solution compatible with non-Windows servers?**

**A:** No, this solution is specifically designed for Windows Servers and relies on detecting roles that are unique to the Windows Server operating system.