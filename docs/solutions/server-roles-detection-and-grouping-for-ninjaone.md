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
| [cPVAL Windows Servers](../ninjaone/groups/cpval-windows-servers.md) | Group | A group designated for machines running the Windows Servers. |
| [Windows Server Roles Detection](../ninjaone/automations/windows-server-roles-detection.md) | Automation | Retrieves installed Windows Server roles, additional services, and FSMO roles (if applicable). |
| [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) | Custom Field | This custom field stores the list of roles detected on a Windows server. |
| [Windows Server Roles Detection](../ninjaone/tasks/windows-server-roles-detection.md) | Task | Runs the [Windows Server Roles Detection](../automations/windows-server-roles-detection.md) automation daily against [cPVAL - Windows Servers](../groups/cpval-windows-servers.md) group |

## Server Role Groups

| Name | Role | Condition | Description |
| ---- | ---- | --------- | ----------- |
| [cPVAL - Server Role - Certificate Authority Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Active Directory Certificate Services | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Active Directory Certificate Services` | A group tailored for Windows Servers that have the `Active Directory Certificate Services` role installed |
| [cPVAL - Server Role - Domain Controllers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Active Directory Domain Services | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Active Directory Domain Services` | A group tailored for Windows Servers that have the `Active Directory Domain Services` role installed |
| [cPVAL - Server Role - Federation Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Active Directory Federation Services | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Active Directory Federation Services` | A group tailored for Windows Servers that have the `Active Directory Federation Services` role installed |
| [cPVAL - Server Role - LDS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Active Directory Lightweight Directory Services | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Active Directory Lightweight Directory Services` | A group tailored for Windows Servers that have the `Active Directory Lightweight Directory Services` role installed |
| [cPVAL - Server Role - RMS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Active Directory Rights Management Services | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Active Directory Rights Management Services` | A group tailored for Windows Servers that have the `Active Directory Rights Management Services` role installed |
| [cPVAL - Server Role - Application Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Application Server | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Application Server` | A group tailored for Windows Servers that have the `Application Server` role installed |
| [cPVAL - Server Role - Health Attestation Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Device Health Attestation | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Device Health Attestation` | A group tailored for Windows Servers that have the `Device Health Attestation` role installed |
| [cPVAL - Server Role - DHCP Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | DHCP Server | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `DHCP Server` | A group tailored for Windows Servers that have the `DHCP Server` role installed |
| [cPVAL - Server Role - DNS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | DNS Server | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `DNS Server` | A group tailored for Windows Servers that have the `DNS Server` role installed |
| [cPVAL - Server Role - Fax Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Fax Server | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Fax Server` | A group tailored for Windows Servers that have the `Fax Server` role installed |
| [cPVAL - Server Role - File Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | File and Storage Services | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `File and Storage Services` | A group tailored for Windows Servers that have the `File and Storage Services` role installed |
| [cPVAL - Server Role - HGS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Host Guardian Service | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Host Guardian Service` | A group tailored for Windows Servers that have the `Host Guardian Service` role installed |
| [cPVAL - Server Role - Hyper-V Host](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Hyper-V | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Hyper-V` | A group tailored for Windows Servers that have the `Hyper-V` role installed |
| [cPVAL - Server Role - NPS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Network Policy and Access Services | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Network Policy and Access Services` | A group tailored for Windows Servers that have the `Network Policy and Access Services` role installed |
| [cPVAL - Server Role - Print Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Print and Document Services | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Print and Document Services` | A group tailored for Windows Servers that have the `Print and Document Services` role installed |
| [cPVAL - Server Role - Remote Access Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Remote Access | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Remote Access` | A group tailored for Windows Servers that have the `Remote Access` role installed |
| [cPVAL - Server Role - RDS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Remote Desktop Services | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Remote Desktop Services` | A group tailored for Windows Servers that have the `Remote Desktop Services` role installed |
| [cPVAL - Server Role - Volume Activation Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Volume Activation Services | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Volume Activation Services` | A group tailored for Windows Servers that have the `Volume Activation Services` role installed |
| [cPVAL - Server Role - Web Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Web Server (IIS) | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Web Server (IIS)` | A group tailored for Windows Servers that have the `Web Server (IIS)` role installed |
| [cPVAL - Server Role - WDS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Windows Deployment Services | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Windows Deployment Services` | A group tailored for Windows Servers that have the `Windows Deployment Services` role installed |
| [cPVAL - Server Role - Essentials Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Windows Server Essentials Experience | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Windows Server Essentials Experience` | A group tailored for Windows Servers that have the `Windows Server Essentials Experience` role installed |
| [cPVAL - Server Role - WSUS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Windows Server Update Services | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Windows Server Update Services` | A group tailored for Windows Servers that have the `Windows Server Update Services` role installed |
| [cPVAL - Server Role - MSSQL Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | MSSQL Server | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `MSSQL Server` | A group tailored for Windows Servers that have the `MSSQL Server` role installed |
| [cPVAL - Server Role - Exchange Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Exchange Server | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Exchange Server` | A group tailored for Windows Servers that have the `Exchange Server` role installed |
| [cPVAL - Server Role - MySQL Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | MySQL Server | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `MySQL Server` | A group tailored for Windows Servers that have the `MySQL Server` role installed |
| [cPVAL - Server Role - Veeam BDR](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Veeam BDR | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Veeam BDR` | A group tailored for Windows Servers that have the `Veeam BDR` role installed |
| [cPVAL - Server Role - SharePoint Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md) | SharePoint Server | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `SharePoint Server` | A group tailored for Windows Servers that have the `SharePoint Server` role installed |
| [cPVAL - Server Role - FSMO - Schema Master](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Schema Master | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Schema Master` | A group tailored for Windows Servers that have the `Schema Master` role installed |
| [cPVAL - Server Role - FSMO - Domain Naming Master](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Domain Naming Master | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Domain Naming Master` | A group tailored for Windows Servers that have the `Domain Naming Master` role installed |
| [cPVAL - Server Role - FSMO - PDC Emulator](../ninjaone/groups/cpval-server-role-domain-controllers.md) | PDC Emulator | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `PDC Emulator` | A group tailored for Windows Servers that have the `PDC Emulator` role installed |
| [cPVAL - Server Role - FSMO - RID Master](../ninjaone/groups/cpval-server-role-domain-controllers.md) | RID Master | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `RID Master` | A group tailored for Windows Servers that have the `RID Master` role installed |
| [cPVAL - Server Role - FSMO - Infrastructure Master](../ninjaone/groups/cpval-server-role-domain-controllers.md) | Infrastructure Master | `Custom Field` [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) `Contains` `Infrastructure Master` | A group tailored for Windows Servers that have the `Infrastructure Master` role installed |

## Implementation

### Step 1

Create the [cPVAL Windows Servers](../ninjaone/groups/cpval-windows-servers.md) group.

### Step 2

Create the [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) custom field.

### Step 3

Create the [Windows Server Roles Detection](../ninjaone/automations/windows-server-roles-detection.md) automation.

### Step 4

Create the [Windows Server Roles Detection](../ninjaone/tasks/windows-server-roles-detection.md) task schedule.

### Step 5

Create the following server role groups:

- [cPVAL - Server Role - Certificate Authority Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Domain Controllers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Federation Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - LDS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - RMS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Application Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Health Attestation Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - DHCP Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - DNS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Fax Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - File Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - HGS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Hyper-V Host](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - NPS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Print Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Remote Access Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - RDS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Volume Activation Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Web Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - WDS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Essentials Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - WSUS Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - MSSQL Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Exchange Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - MySQL Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - Veeam BDR](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - SharePoint Servers](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - FSMO - Schema Master](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - FSMO - Domain Naming Master](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - FSMO - PDC Emulator](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - FSMO - RID Master](../ninjaone/groups/cpval-server-role-domain-controllers.md)
- [cPVAL - Server Role - FSMO - Infrastructure Master](../ninjaone/groups/cpval-server-role-domain-controllers.md)

## FAQ

**Q1. How often should the "[Windows Server Roles Detection](../ninjaone/automations/windows-server-roles-detection.md)" automation be scheduled?**

**A:** It is recommended to schedule the task to run daily to ensure that the server role information is up-to-date.

**Q2. Can I customize the server role groups?**

**A:** Yes, you can customize the server role groups by creating additional groups or modifying the conditions in the existing groups to suit your organization's requirements.

**Q3. What happens if a server has multiple roles installed?**

**A:** If a server has multiple roles installed, it will be included in all the corresponding server role groups based on the roles detected.

**Q4. How do I verify that the roles are being detected correctly?**

**A:** You can verify the detected roles by checking the value of the custom field [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md) for a specific server. Ensure that the roles listed match the roles installed on the server.

**Q5. What should I do if a role is not being detected?**

**A:** Ensure that the [Windows Server Roles Detection](../ninjaone/automations/windows-server-roles-detection.md) automation and task are configured correctly. Verify that the server is part of the [cPVAL Windows Servers](../ninjaone/groups/cpval-windows-servers.md) group and that the automation is running successfully.

**Q6. Can I add roles that are not listed in this document?**

**A:** Yes, you can add additional roles by creating new server role groups and defining the conditions based on the custom field [cPVAl Roles Detected](../ninjaone/custom-fields/cpval-roles-detected.md).

**Q7. Is this solution compatible with non-Windows servers?**

**A:** No, this solution is specifically designed for Windows Servers and relies on detecting roles that are unique to the Windows Server operating system.