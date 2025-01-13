---
id: 'cwa_ssl_cert_expiration_monitor'
title: 'SSL Certificate Expiration Monitor'
title_meta: 'SSL Certificate Expiration Monitor'
keywords: ['ssl', 'certificate', 'monitor', 'expiration', 'alert']
description: 'This document outlines a monitor that checks the proval_plugin_certs table for SSL certificates that are expiring in fewer than 30 days. It provides implementation details, dependencies, and ticketing information to ensure timely renewals of SSL certificates.'
tags: ['alert', 'monitoring', 'ticketing', 'ssl', 'network']
draft: false
unlisted: false
---
## Summary

This monitor looks at the proval_plugin_certs table (Generated through the [Import SSL Certificates into CWA [Custom Table]](https://proval.itglue.com/DOC-5078775) Script) for any SSL certs that have an expiration date of fewer than 30 days. This solution is good to catch the machines that may have been missed and do not have active reminders in place for certificate renewals. Also, the difference between the certification add and expiration should be at least 30 days to get an alert.

Alert Template: △ Custom - Ticket Creation - Computer

## Implementation

To exclude the self-signed, Microsoft-generated, and any certificate with a GUID in Subject, uncomment the following lines in the Additional Condition. But before adding any exclusions, it is suggested to review the [EPM - Network - Dataview - SSL Certificate Audit](https://proval.itglue.com/5078775/docs/9382198) dataview to ensure that enabling these exclusions is not going to exclude any important certificate.

![Image](..\..\..\static\img\Certificate-Expiration--30-Days\image_1.png)

## Dependencies

This monitor is dependent on the following items:
- [EPM - Network - Script - Certificate - Windows - Certificates (My) - Local Machine - Audit](https://proval.itglue.com/DOC-5078775-9256568)  
- [EPM - Network - Custom Table - plugin_proval_certs](https://proval.itglue.com/DOC-5078775-9262931)  
- [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) (Not needed, but creates more detailed tickets)

## Target

Global

## Ticketing

**Subject:**  
```
SSL Cert Expiration < 30 Days - %computername%
```

**Message on Failure:**  
```
The SSL Cert found on %CLIENTNAME%\%COMPUTERNAME% at %LOCATIONNAME% is currently approaching its expiration date and should be renewed. The SSL Certificate Information is listed below:

%FIELDNAME%
```

**Message on Success:**  
```
The SSL Cert found on %CLIENTNAME%\%COMPUTERNAME% at %LOCATIONNAME% is no longer reporting any issues with Expiration. Closing ticket.
```

**%FIELDNAME% Example:**  
```
Subject: CN=remote.something.com
Expiration: 2023-04-20 19:59:59
```

## Example Ticket

![Image](..\..\..\static\img\Certificate-Expiration--30-Days\image_2.png)


