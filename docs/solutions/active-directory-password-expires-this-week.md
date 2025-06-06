---
id: 'bd386818-0b93-4bf2-a094-ab09aa030ea5'
slug: /bd386818-0b93-4bf2-a094-ab09aa030ea5
title: 'Active Directory - Password Expires This Week'
title_meta: 'Active Directory - Password Expires This Week'
keywords: ['alert', 'domain', 'expiration', 'notification', 'password', 'user']
description: 'This document outlines the process of alerting domain users when their passwords are set to expire within the next 7 days. It includes associated content, implementation steps, and troubleshooting FAQs to ensure users receive timely notifications.'
tags: ['active-directory', 'software']
draft: false
unlisted: false
---

## Purpose

This document alerts domain users if their domain password is set to expire within the next 7 days.

## Associated Content

| Content                                                                                                                                                                      | Type             | Function                                                                                                                                                                                                                                                                                                 |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Password Expires This Week [G]](/docs/d002ff1b-cb8c-45db-af82-096e7912db2b)                                                                                                 | Internal Monitor | This Custom RAWSQL monitor detects the users whose passwords are going to expire within a week.                                                                                                                                                                                                          |
| [Active Directory - Alerting - Password Expires This Week [Global, Autofix]*](/docs/6ad5ccf5-0502-459c-a877-eaeafc0ad432) | Autofix script   | The script covers the alerting section of the [Password Expires This Week [G]](/docs/d002ff1b-cb8c-45db-af82-096e7912db2b) monitor set.                                                                                                                                                                  |
| △ Custom - Password Expiration Notification                                                                                                                                  | Alert Template   | The alert template is responsible for executing the [Active Directory - Alerting - Password Expires This Week [Global, Autofix]*](/docs/6ad5ccf5-0502-459c-a877-eaeafc0ad432) script for each detection of the [Password Expires This Week [G]](/docs/d002ff1b-cb8c-45db-af82-096e7912db2b) monitor set. |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Internal Monitor - Password Expires This Week [G]](/docs/d002ff1b-cb8c-45db-af82-096e7912db2b)
   - [Script - Active Directory - Alerting - Password Expires This Week [Global, Autofix]*](/docs/d002ff1b-cb8c-45db-af82-096e7912db2b)
   - Alert Template - △ Custom - Password Expiration Notification

2. Reload the system cache:
   ![Reload the system cache](../../static/img/docs/bd386818-0b93-4bf2-a094-ab09aa030ea5/image_1.webp)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Password Expires This Week [G]](/docs/d002ff1b-cb8c-45db-af82-096e7912db2b)
       - Alert Template: `△ Custom - Password Expiration Notification`
       - Right-click and select "Run Now" to start the monitor.

## FAQ

**Q: Users are not receiving emails?**  
A: Ensure that the user has an email address set for their Active Directory account, the script's global variables are set correctly, and lastly, check that the emails are not failing from Automate.