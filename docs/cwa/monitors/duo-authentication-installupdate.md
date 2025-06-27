---
id: '4e62e216-7a5f-4b35-8ac8-eca9a38bd440'
slug: /4e62e216-7a5f-4b35-8ac8-eca9a38bd440
title: 'DUO Authentication - InstallUpdate'
title_meta: 'DUO Authentication - InstallUpdate'
keywords: ['duo', 'authentication', 'windows', 'monitor', 'agent', 'edf', 'exclusion']
description: 'This document outlines a monitor designed to detect online Windows agents with outdated DUO Authentication for Windows Logon. It also identifies agents with specific client EDF settings and exclusions not applied at the location or computer level.'
tags: ['security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor detects online Windows agents where outdated DUO Authentication for Windows Logon is installed. It also identifies agents whose client EDFs are set with specific values and those where the exclusion EDF "DUO Agent Exclusion" is not checked at the location or computer level.

### Client EDFs:

![Client EDFs](../../../static/img/docs/4e62e216-7a5f-4b35-8ac8-eca9a38bd440/image_1.webp)

### Client Exclusion EDF:  
**![Client Exclusion EDF](../../../static/img/docs/4e62e216-7a5f-4b35-8ac8-eca9a38bd440/image_2.webp)**  

### Location Exclusion EDFs:

![Location Exclusion EDFs](../../../static/img/docs/4e62e216-7a5f-4b35-8ac8-eca9a38bd440/image_3.webp)

### Computer Exclusion EDFs:

![Computer Exclusion EDFs](../../../static/img/docs/4e62e216-7a5f-4b35-8ac8-eca9a38bd440/image_4.webp)

### Script EDFs:

![Computer-Level EDF](../../../static/img/docs/99a31695-f399-4982-989b-5fbc3aada8c6/image8.webp)  


## Dependencies

[Script - DUO Install/Upgrade - Latest Version](/docs/99a31695-f399-4982-989b-5fbc3aada8c6)

## Target

Windows OS

## Ticketing

---

**Subject:**  
DUO Authentication Install/Update Failed on %ComputerName% at %ClientName%

---

**Body**

**When installation fails:**  
Failed to install the @ApplicationVersion@ of DUO Authentication for Windows Logon. Here's the result of the installation command: %ShellResult%

**When an argument is missing:**  
Arguments required to install DUO Authentication for Windows Logon are not set.