---
id: '0e33b1a2-5539-4451-b49d-2ba9b7f904dd'
slug: /0e33b1a2-5539-4451-b49d-2ba9b7f904dd
title: 'Install ConnectSecure Windows/Mac'
title_meta: 'Install ConnectSecure Windows/Mac'
keywords: ['cybercns', 'connectsecure', 'vulnerability', 'management']
description: 'This solution performs the ConnectSecure v4 installation for MAC/Windows.'
tags: ['vulnerability', 'security']
draft: true
unlisted: false
---

## Purpose

This solution performs the ConnectSecure v4 installation for MAC/Windows.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Script - CyberCNSv4 ConnectSecurev4 Windows - Install/Update](/docs/d22e3b29-76a2-4385-a013-d592f6c5ae6d)      | Script | Installs, repairs, or reinstalls the CyberCNS ConnectSecure agent on Windows targets using values sourced from NinjaRMM custom fields. |
| [Script - CyberCNS ConnectSecure Mac - Install/Update](/docs/19378af5-7ee0-43b4-8051-58b280467a6c) | Script | Install and Update the ConnectSecure v4 on Mac. |
| [cpval ConnectSecure CompanyID](/docs/c104e227-d5f3-432b-90fa-f31186536181) | Custom field | This stores the ConnectSecure deployment company ID. |
| [cpval ConnectSecure TenantID](/docs/3d1a16b3-688c-4911-a92d-835a578254a9) | Custom field | This stores the ConnectSecure deployment Tenant ID. |
| [cpval ConnectSecure Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf) | Custom field | This is required to be set for the compound condition to set the ConnectSecure deployment. |
| [Connect Secure Deployment - Windows Server](/docs/65db6f18-c505-4ced-ad51-2964ea516f6b) | Compound Condition | This is required for deploying the ConnectSecure to the Windows Workstations using automation |
| [Connect Secure Deployment - Mac](/docs/b5472dc9-11af-4739-af78-7ef7478f6eab) | Compound Condition | This is required for deploying the ConnectSecure to the Macintosh using automation |
| [Connect Secure Deployment - Windows Server](/docs/0ea70cbf-dc58-4d64-90f8-aff021079fc7) | Compound Condition | This is required for deploying the ConnectSecure to the Windows Servers using automation |

## Implementation

- Create the [Script - CyberCNSv4 ConnectSecurev4 Windows - Install/Update](/docs/d22e3b29-76a2-4385-a013-d592f6c5ae6d)
- Create the [Script - CyberCNS ConnectSecure Mac - Install/Update](/docs/19378af5-7ee0-43b4-8051-58b280467a6c)
- Create the [Custom field - cpval ConnectSecure CompanyID](/docs/c104e227-d5f3-432b-90fa-f31186536181)
- Create the [Custom field - cpval ConnectSecure TenantID](/docs/3d1a16b3-688c-4911-a92d-835a578254a9)
- Create the [Custom field - cpval ConnectSecure Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf)
- Create the [Compound Condition - Connect Secure Deployment - Windows Server](/docs/65db6f18-c505-4ced-ad51-2964ea516f6b)
- Create the [Compound Condition - Connect Secure Deployment - Mac](/docs/b5472dc9-11af-4739-af78-7ef7478f6eab)
- Create the [Compound Condition - Connect Secure Deployment - Windows Server](/docs/0ea70cbf-dc58-4d64-90f8-aff021079fc7)
- Select the options from the [Custom field - cpval ConnectSecure Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf)
options at the organization, site, and endpoint level so that the compound conditions will be activated at the MAC, Windows (Server/Workstations) level automatically to install/reinstall the latest ConnectSecure V4 on the endpoints of the organizations, sites, and endpoints where the companyid and tenantid is also provided at the [Custom field - cpval ConnectSecure CompanyID](/docs/c104e227-d5f3-432b-90fa-f31186536181) and [Custom field - cpval ConnectSecure TenantID](/docs/3d1a16b3-688c-4911-a92d-835a578254a9).