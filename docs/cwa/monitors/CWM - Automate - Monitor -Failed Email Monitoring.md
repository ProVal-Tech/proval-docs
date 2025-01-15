---
id: 'f1a15d3d-85d7-4d72-9c08-ad4ca6a7dfbb'
title: 'Automate Failed Email Report'
title_meta: 'Automate Failed Email Report'
keywords: ['email', 'ticket', 'monitor', 'failure', 'notification']
description: 'This document outlines a monitor that reports any failed email occurrences that are not related to specific exclusions. It generates a ticket detailing the failed emails every hour, providing crucial information for troubleshooting and resolution.'
tags: ['notification', 'report', 'security', 'configuration', 'setup']
draft: false
unlisted: false
---
## Summary

This Monitor reports any failed email that is not related to 'google authenticator', 'Testing Email Flow', or 'Authentication Token' that has occurred within the last hour.

Each hour, a ticket with the details of all the failed emails from the previous hour will be generated.

**Ticket Subject:** Automate Failed Email detected

**Sample Ticket Body:**

The number of Failed Emails: 2

Below is the information of all the emails that failed in the last 1 hour:

- **To:** [antohe@failed.vom](mailto:antohe@failed.vom)  
  **From:** something@Someone  
  **Subject:** Something else  
  **Body:**  
  **Error Message:** Error  
  **Failure Date:** 2022-07-01 10:05:05  

- **To:** [noone@fakeemail.com](mailto:noone@fakeemail.com)  
  **From:** [doesntmatter@email.com](mailto:doesntmatter@email.com)  
  **Subject:** Stuff  
  **Body:** Things  
  **Error Message:** Bad stuff  
  **Failure Date:** 2022-07-01 10:03:20  

## Important Notes

For the on-prem partners, tickets will be generated for the Automate server.  
For the hosted partners, it will be the minimum computerid of Clientid 1. If Clientid 1 is not the primary client for a hosted partner then the clientid should be updated in the following location:  
![Image](../../../static/img/CWM---Automate---Monitor--Failed-Email-Monitoring/image_1.png)

## Dependencies

[Ticket Creation - Without Computer Information And Failures Only [Autofix]*](https://proval.itglue.com/DOC-5078775-10390934)

"△ Custom - Ticket Creation - Without Computer Details" Alert template should be applied to the monitor set.

## Target

Global - Should be run without explicitly defined targets.






