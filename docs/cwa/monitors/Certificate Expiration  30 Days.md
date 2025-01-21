---
id: 'a7dad4d0-d2dc-44b2-972b-0893d7814f8c'
title: 'SSL Certificate Expiration Monitor'
title_meta: 'SSL Certificate Expiration Monitor'
keywords: ['ssl', 'certificate', 'monitor', 'expiration', 'alert']
description: 'This document outlines a monitor that checks the proval_plugin_certs table for SSL certificates that are expiring in fewer than 30 days. It provides implementation details, dependencies, and ticketing information to ensure timely renewals of SSL certificates.'
tags: ['ticketing']
draft: false
unlisted: false
---

## Summary

This monitor looks at the proval_plugin_certs table (generated through the [Import SSL Certificates into CWA [Custom Table]](https://proval.itglue.com/DOC-5078775) script) for any SSL certificates that have an expiration date of fewer than 30 days. This solution is effective for catching machines that may have been missed and do not have active reminders in place for certificate renewals. Additionally, the difference between the certification addition and expiration should be at least 30 days to trigger an alert.

**Alert Template:** △ Custom - Ticket Creation - Computer

## Implementation

To exclude self-signed, Microsoft-generated certificates, and any certificate with a GUID in the Subject, uncomment the following lines in the Additional Condition. Before adding any exclusions, it is recommended to review the [EPM - Network - Dataview - SSL Certificate Audit](https://proval.itglue.com/5078775/docs/9382198) dataview to ensure that enabling these exclusions will not omit any important certificates.

![Image](../../../static/img/Certificate-Expiration--30-Days/image_1.png)

## Dependencies

This monitor is dependent on the following items:
- [EPM - Network - Script - Certificate - Windows - Certificates (My) - Local Machine - Audit](<../scripts/Windows - Certificates (My) - Local Machine - Audit.md>)  
- [EPM - Network - Custom Table - plugin_proval_certs](<../tables/plugin_proval_certs.md>)  
- [CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>) (not required, but creates more detailed tickets)

## Target

Global

## Ticketing

**Subject:**  
```
SSL Cert Expiration < 30 Days - %computername%
```

**Message on Failure:**  
```
The SSL Cert found on %CLIENTNAME%/%COMPUTERNAME% at %LOCATIONNAME% is currently approaching its expiration date and should be renewed. The SSL Certificate Information is listed below:

%FIELDNAME%
```

**Message on Success:**  
```
The SSL Cert found on %CLIENTNAME%/%COMPUTERNAME% at %LOCATIONNAME% is no longer reporting any issues with expiration. Closing ticket.
```

**%FIELDNAME% Example:**  
```
Subject: CN=remote.something.com
Expiration: 2023-04-20 19:59:59
```

## Example Ticket

![Image](../../../static/img/Certificate-Expiration--30-Days/image_2.png)
