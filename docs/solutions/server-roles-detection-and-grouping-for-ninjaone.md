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

This document details the procedure for categorizing servers into suitable groups according to their installed roles.

## Associated Content

| Content                                                                      | Type         | Function                                                                                                                                                                                   |
| ---------------------------------------------------------------------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256)          | Group        | A group designated for machines running the Windows Servers.                                                                                                                               |
| [Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9) | Automation   | Retrieves installed Windows Server roles, additional services, and FSMO roles (if applicable).                                                                                             |
| [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)           | Custom Field | This custom field stores the list of roles detected on a Windows server.                                                                                                                   |
| [Windows Server Roles Detection](/docs/8bbf34f6-8c05-4776-9f8c-c589944b4042) | Task         | Runs the [Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9) automation daily against [cPVAL - Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) group |

## Server Role Groups

| Name                                                                                              | Role                                            | Condition                                                                                                                                      | Description                                                                                                         |
| ------------------------------------------------------------------------------------------------- | ----------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| [cPVAL - Server Role - Certificate Authority Servers](/docs/2b5f6e75-c2d7-4c48-b147-dee2527d9922) | Active Directory Certificate Services           | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Active Directory Certificate Services`           | A group tailored for Windows Servers that have the `Active Directory Certificate Services` role installed           |
| [cPVAL - Server Role - Domain Controllers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)            | Active Directory Domain Services                | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Active Directory Domain Services`                | A group tailored for Windows Servers that have the `Active Directory Domain Services` role installed                |
| [cPVAL - Server Role - Federation Servers](/docs/18b85f9f-084b-4862-a58c-3de6996ebf52)            | Active Directory Federation Services            | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Active Directory Federation Services`            | A group tailored for Windows Servers that have the `Active Directory Federation Services` role installed            |
| [cPVAL - Server Role - LDS Servers](/docs/4f82968d-8ba6-4548-a7c4-76df6e08fc1e)                   | Active Directory Lightweight Directory Services | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Active Directory Lightweight Directory Services` | A group tailored for Windows Servers that have the `Active Directory Lightweight Directory Services` role installed |
| [cPVAL - Server Role - RMS Servers](/docs/89562472-df5d-4440-a6b8-fafb0a722276)                   | Active Directory Rights Management Services     | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Active Directory Rights Management Services`     | A group tailored for Windows Servers that have the `Active Directory Rights Management Services` role installed     |
| [cPVAL - Server Role - Application Servers](/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1)           | Application Server                              | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Application Server`                              | A group tailored for Windows Servers that have the `Application Server` role installed                              |
| [cPVAL - Server Role - Health Attestation Servers](/docs/017bdfd2-819f-4927-b932-0a9d901269fa)    | Device Health Attestation                       | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Device Health Attestation`                       | A group tailored for Windows Servers that have the `Device Health Attestation` role installed                       |
| [cPVAL - Server Role - DHCP Servers](/docs/0a1bc9ec-0905-4070-894a-99c8527222fa)                  | DHCP Server                                     | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `DHCP Server`                                     | A group tailored for Windows Servers that have the `DHCP Server` role installed                                     |
| [cPVAL - Server Role - DNS Servers](/docs/98db2e18-5f75-429f-a714-170025450b63)                   | DNS Server                                      | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `DNS Server`                                      | A group tailored for Windows Servers that have the `DNS Server` role installed                                      |
| [cPVAL - Server Role - Fax Servers](/docs/20beea1d-11fc-45c4-a09f-26b7ae45f362)                   | Fax Server                                      | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Fax Server`                                      | A group tailored for Windows Servers that have the `Fax Server` role installed                                      |
| [cPVAL - Server Role - File Servers](/docs/58235f08-f095-4242-955f-d369947fb512)                  | File and Storage Services                       | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `File and Storage Services`                       | A group tailored for Windows Servers that have the `File and Storage Services` role installed                       |
| [cPVAL - Server Role - HGS Servers](/docs/4e0d2ac4-0cfd-4b77-8714-10d7e82d9f3f)                   | Host Guardian Service                           | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Host Guardian Service`                           | A group tailored for Windows Servers that have the `Host Guardian Service` role installed                           |
| [cPVAL - Server Role - Hyper-V Host](/docs/cf5d5ac8-bc9c-400d-a130-2e19866df942)                  | Hyper-V                                         | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Hyper-V`                                         | A group tailored for Windows Servers that have the `Hyper-V` role installed                                         |
| [cPVAL - Server Role - Hyper-V Cluster](/docs/83840fa9-72f2-4bd3-9f9f-353d606d9d3c)            | SharePoint Server                               | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Hyper-V Cluster`                               | A group tailored for Windows Servers that have the `Hyper-V Cluster` role installed                               |
| [cPVAL - Server Role - NPS Servers](/docs/d743519c-45d0-4adb-80c9-775e4b5273d2)                   | Network Policy and Access Services              | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Network Policy and Access Services`              | A group tailored for Windows Servers that have the `Network Policy and Access Services` role installed              |
| [cPVAL - Server Role - Print Servers](/docs/3dc58c7d-f2b2-42f1-9417-c075a8e268d7)                 | Print and Document Services                     | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Print and Document Services`                     | A group tailored for Windows Servers that have the `Print and Document Services` role installed                     |
| [cPVAL - Server Role - Remote Access Servers](/docs/ef8d1997-f627-4f48-84ad-4408821023bc)         | Remote Access                                   | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Remote Access`                                   | A group tailored for Windows Servers that have the `Remote Access` role installed                                   |
| [cPVAL - Server Role - RDS Servers](/docs/95fa08c8-b695-49ea-b966-ec19d35f1530)                   | Remote Desktop Services                         | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Remote Desktop Services`                         | A group tailored for Windows Servers that have the `Remote Desktop Services` role installed                         |
| [cPVAL - Server Role - Volume Activation Servers](/docs/77a5bf0c-9f6e-49ca-aec3-dc22671bc5ac)     | Volume Activation Services                      | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Volume Activation Services`                      | A group tailored for Windows Servers that have the `Volume Activation Services` role installed                      |
[cPVAL - Server Role - SMB1 Server](/docs/d57f8cfb-bb1e-4e9a-bf22-9bb24a35817f)  | SMB1 Server                           | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `SMB1 Server`                           | A group tailored for Windows Servers that have the `SMB1 Server` role installed   
| [cPVAL - Server Role - Web Servers](/docs/e06f0af4-33e6-4a5a-93eb-5e56e8b06e0d)                   | Web Server (IIS)                                | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Web Server (IIS)`                                | A group tailored for Windows Servers that have the `Web Server (IIS)` role installed                                |
| [cPVAL - Server Role - WDS Servers](/docs/97d48d7a-a94f-4fd8-bc43-e4b3b10c79c5)                   | Windows Deployment Services                     | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Windows Deployment Services`                     | A group tailored for Windows Servers that have the `Windows Deployment Services` role installed                     |
| [cPVAL - Server Role - Essentials Servers](/docs/be3e8ffa-2c72-44d0-ad0f-d540621297bd)            | Windows Server Essentials Experience            | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Windows Server Essentials Experience`            | A group tailored for Windows Servers that have the `Windows Server Essentials Experience` role installed            |
| [cPVAL - Server Role - WSUS Servers](/docs/421f9858-2a1c-4f38-b788-8b38e979095e)                  | Windows Server Update Services                  | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Windows Server Update Services`                  | A group tailored for Windows Servers that have the `Windows Server Update Services` role installed                  |
| [cPVAL - Server Role - MSSQL Servers](/docs/f54e6bdd-85a5-4f32-8dae-1f20874bd8c9)                 | MSSQL Server                                    | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `MSSQL Server`                                    | A group tailored for Windows Servers that have the `MSSQL Server` role installed                                    |
| [cPVAL - Server Role - Exchange Servers](/docs/adafb1f3-2479-4e1a-97cf-def85bf8d569)              | Exchange Server                                 | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Exchange Server`                                 | A group tailored for Windows Servers that have the `Exchange Server` role installed                                 |
| [cPVAL - Server Role - MySQL Servers](/docs/6775c1f0-69b0-42e7-bdec-1fb373c976a3)                 | MySQL Server                                    | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `MySQL Server`                                    | A group tailored for Windows Servers that have the `MySQL Server` role installed                                    |
| [cPVAL - Server Role - Veeam BDR](/docs/0a0787f3-c7e8-4cf2-8522-3253ec7d915b)                     | Veeam BDR                                       | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Veeam BDR`                                       | A group tailored for Windows Servers that have the `Veeam BDR` role installed                                       |
| [cPVAL - Server Role - SharePoint Servers](/docs/bd7972f7-1175-463f-8b6f-3cf1d5fdbf99)            | SharePoint Server                               | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `SharePoint Server`                               | A group tailored for Windows Servers that have the `SharePoint Server` role installed                               |
| [cPVAL - Server Role - FSMO - Schema Master](/docs/c5dffd43-67a3-47af-83ef-68e24c4e6c07)          | Schema Master                                   | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Schema Master`                                   | A group tailored for Windows Servers that have the `Schema Master` role installed                                   |
| [cPVAL - Server Role - FSMO - Domain Naming Master](/docs/61a7e090-eceb-475b-9080-16e288327411)   | Domain Naming Master                            | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Domain Naming Master`                            | A group tailored for Windows Servers that have the `Domain Naming Master` role installed                            |
| [cPVAL - Server Role - FSMO - PDC Emulator](/docs/4cccc5a2-14f6-4fb0-aa05-1697b09b71f3)           | PDC Emulator                                    | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `PDC Emulator`                                    | A group tailored for Windows Servers that have the `PDC Emulator` role installed                                    |
| [cPVAL - Server Role - FSMO - RID Master](/docs/06def974-103d-4c54-b227-08ac5c6f2b17)             | RID Master                                      | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `RID Master`                                      | A group tailored for Windows Servers that have the `RID Master` role installed                                      |
| [cPVAL - Server Role - FSMO - Infrastructure Master](/docs/2457d317-b37a-46e4-9f1d-c8687ed8ef62)  | Infrastructure Master                           | `Custom Field` [cPVAl Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) `Contains` `Infrastructure Master`                           | A group tailored for Windows Servers that have the `Infrastructure Master` role installed                           | 

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

- [cPVAL - Server Role - Certificate Authority Servers](/docs/2b5f6e75-c2d7-4c48-b147-dee2527d9922)
- [cPVAL - Server Role - Domain Controllers](/docs/8190880d-75c3-40cb-b6b0-4b417091fea3)
- [cPVAL - Server Role - Federation Servers](/docs/18b85f9f-084b-4862-a58c-3de6996ebf52)
- [cPVAL - Server Role - LDS Servers](/docs/4f82968d-8ba6-4548-a7c4-76df6e08fc1e)
- [cPVAL - Server Role - RMS Servers](/docs/89562472-df5d-4440-a6b8-fafb0a722276)
- [cPVAL - Server Role - Application Servers](/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1)
- [cPVAL - Server Role - Health Attestation Servers](/docs/017bdfd2-819f-4927-b932-0a9d901269fa)
- [cPVAL - Server Role - DHCP Servers](/docs/0a1bc9ec-0905-4070-894a-99c8527222fa)
- [cPVAL - Server Role - DNS Servers](/docs/98db2e18-5f75-429f-a714-170025450b63)
- [cPVAL - Server Role - Fax Servers](/docs/20beea1d-11fc-45c4-a09f-26b7ae45f362)
- [cPVAL - Server Role - File Servers](/docs/58235f08-f095-4242-955f-d369947fb512)
- [cPVAL - Server Role - HGS Servers](/docs/4e0d2ac4-0cfd-4b77-8714-10d7e82d9f3f)
- [cPVAL - Server Role - Hyper-V Host](/docs/cf5d5ac8-bc9c-400d-a130-2e19866df942)
- [cPVAL - Server Role - Hyper-V Cluster](/docs/83840fa9-72f2-4bd3-9f9f-353d606d9d3c)
- [cPVAL - Server Role - NPS Servers](/docs/d743519c-45d0-4adb-80c9-775e4b5273d2)
- [cPVAL - Server Role - Print Servers](/docs/3dc58c7d-f2b2-42f1-9417-c075a8e268d7)
- [cPVAL - Server Role - Remote Access Servers](/docs/ef8d1997-f627-4f48-84ad-4408821023bc)
- [cPVAL - Server Role - RDS Servers](/docs/95fa08c8-b695-49ea-b966-ec19d35f1530)
- [cPVAL - Server Role - Volume Activation Servers](/docs/77a5bf0c-9f6e-49ca-aec3-dc22671bc5ac)
- [cPVAL - Server Role - SMB1 Server](/docs/d57f8cfb-bb1e-4e9a-bf22-9bb24a35817f)
- [cPVAL - Server Role - Web Servers](/docs/e06f0af4-33e6-4a5a-93eb-5e56e8b06e0d)
- [cPVAL - Server Role - WDS Servers](/docs/97d48d7a-a94f-4fd8-bc43-e4b3b10c79c5)
- [cPVAL - Server Role - Essentials Servers](/docs/be3e8ffa-2c72-44d0-ad0f-d540621297bd)
- [cPVAL - Server Role - WSUS Servers](/docs/421f9858-2a1c-4f38-b788-8b38e979095e)
- [cPVAL - Server Role - MSSQL Servers](/docs/f54e6bdd-85a5-4f32-8dae-1f20874bd8c9)
- [cPVAL - Server Role - Exchange Servers](/docs/adafb1f3-2479-4e1a-97cf-def85bf8d569)
- [cPVAL - Server Role - MySQL Servers](/docs/6775c1f0-69b0-42e7-bdec-1fb373c976a3)
- [cPVAL - Server Role - Veeam BDR](/docs/0a0787f3-c7e8-4cf2-8522-3253ec7d915b)
- [cPVAL - Server Role - SharePoint Servers](/docs/bd7972f7-1175-463f-8b6f-3cf1d5fdbf99)
- [cPVAL - Server Role - FSMO - Schema Master](/docs/c5dffd43-67a3-47af-83ef-68e24c4e6c07)
- [cPVAL - Server Role - FSMO - Domain Naming Master](/docs/61a7e090-eceb-475b-9080-16e288327411)
- [cPVAL - Server Role - FSMO - PDC Emulator](/docs/4cccc5a2-14f6-4fb0-aa05-1697b09b71f3)
- [cPVAL - Server Role - FSMO - RID Master](/docs/06def974-103d-4c54-b227-08ac5c6f2b17)
- [cPVAL - Server Role - FSMO - Infrastructure Master](/docs/2457d317-b37a-46e4-9f1d-c8687ed8ef62)

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