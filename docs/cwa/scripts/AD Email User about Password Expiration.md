---
id: 'cwa-client-specific-script-pcm-monitor-ad-password-expires'
title: 'Client Specific Script for PCM - Monitor AD - Password Expires This Week'
title_meta: 'Client Specific Script for PCM - Monitor AD - Password Expires This Week'
keywords: ['client', 'script', 'monitor', 'ad', 'password', 'expires', 'email', 'notification']
description: 'This document outlines a client-specific script designed for monitoring Active Directory users whose passwords are set to expire within the week. The script automatically generates an email notification to inform users about their upcoming password expiration, ensuring timely action and compliance.'
tags: ['active-directory', 'notification', 'email', 'security']
draft: false
unlisted: false
---
## Summary

Client Specific Script for PCM  
Monitor - AD - Password Expires This Week monitor  
Autofix action assigned to his monitor calls this script  
Script takes the GUID for the user and populates an email to that user letting them know that their password is going to expire  

## Dependencies

- Client Specific Monitor AD - Password Expires This Week monitor
- Client Specific alert template - ~Autofix - Email AD User

## Variables

| Name        | Description                                        |
|-------------|----------------------------------------------------|
| MSPWebsite  | used in the email body holds the MSP's Website     |
| MSPName     | used in the email body holds the MSP's Name        |

## Process

1. Sets the user email address to variable
2. Sets the user account name to variable
3. Sets the user first name to variable
4. Determines if the user can be emailed
5. Either creates an email to the user or the MSP depending on what is available.

## Output

N/A - No output present


