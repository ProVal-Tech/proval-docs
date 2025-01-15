---
id: 'bd386818-0b93-4bf2-a094-ab09aa030ea5'
title: 'Password Expiration Notification for Domain Users'
title_meta: 'Password Expiration Notification for Domain Users'
keywords: ['alert', 'domain', 'expiration', 'notification', 'password', 'user']
description: 'This document outlines the process of alerting domain users when their passwords are set to expire within the next 7 days. It includes associated content, implementation steps, and troubleshooting FAQs to ensure users receive timely notifications.'
tags: ['active-directory', 'alert', 'configuration', 'notification', 'software']
draft: false
unlisted: false
---
## Purpose

Alerts the domain user if their domain password is set to expire within the next 7 days.

## Associated Content

| Content                                                                                          | Type               | Function                                                                                                         |
|--------------------------------------------------------------------------------------------------|--------------------|------------------------------------------------------------------------------------------------------------------|
| [Password Expires This Week [G]](https://proval.itglue.com/DOC-5078775-8041377)                | Internal Monitor    | This Custom RAWSQL monitor detects the users whose password is going to expire within a week.                  |
| [Active Directory - Alerting - Password Expires This Week [Global,Autofix]*](https://proval.itglue.com/DOC-5078775-11713518) | Autofix script      | The script covers the alerting section of the [Password Expires This Week [G]](https://proval.itglue.com/DOC-5078775-8041377) monitor set. |
| △ Custom - Password Expiration Notification                                                      | Alert Template      | The Alert template is responsible for executing the [Active Directory - Alerting - Password Expires This Week [Global,Autofix]*](https://proval.itglue.com/DOC-5078775-11713518) script each detection of the [Password Expires This Week [G]](https://proval.itglue.com/DOC-5078775-8041377) monitor set. |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Internal Monitor - Password Expires This Week [G]](https://proval.itglue.com/DOC-5078775-8041377)
   - [Script - Active Directory - Alerting - Password Expires This Week [Global,Autofix]*](https://proval.itglue.com/DOC-5078775-11713518)
   - Alert Template - △ Custom - Password Expiration Notification

2. Reload the system cache:
   ![Reload the system cache](../../static/img/Active-Directory---Password-Expires-This-Week/image_1.png)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:
     - [Internal Monitor - Password Expires This Week [G]](https://proval.itglue.com/DOC-5078775-8041377)
       - Alert Template: `△ Custom - Password Expiration Notification`
       - Right-click and Run Now to start the monitor.

## FAQ

**Q: Users are not receiving emails?**  
A: Ensure that the user has an email address set for their active directory account, Script's global variables are set correctly, and lastly the emails are not failing from Automate.






