---
id: '8ed6ff40-38c6-4e23-b6ea-2627ed9d49a8'
slug: /8ed6ff40-38c6-4e23-b6ea-2627ed9d49a8
title: 'AD Email User about Password Expiration'
title_meta: 'AD Email User about Password Expiration'
keywords: ['client', 'script', 'monitor', 'ad', 'password', 'expires', 'email', 'notification']
description: 'This document outlines a client-specific script designed for monitoring Active Directory users whose passwords are set to expire within the week. The script automatically generates an email notification to inform users about their upcoming password expiration, ensuring timely action and compliance.'
tags: ['active-directory', 'email', 'security']
draft: false
unlisted: false
---

## Summary

Client Specific Script for PCM  
Monitor - AD - Password Expires This Week monitor  
Autofix action assigned to this monitor calls this script.  
The script takes the GUID for the user and populates an email to that user, letting them know that their password is going to expire.  

## Dependencies

- Client Specific Monitor AD - Password Expires This Week monitor
- Client Specific alert template - ~Autofix - Email AD User

## Variables

| Name        | Description                                        |
|-------------|----------------------------------------------------|
| MSPWebsite  | Used in the email body to hold the MSP's Website   |
| MSPName     | Used in the email body to hold the MSP's Name      |

## Process

1. Sets the user email address to a variable.
2. Sets the user account name to a variable.
3. Sets the user first name to a variable.
4. Determines if the user can be emailed.
5. Either creates an email to the user or the MSP, depending on what is available.

## Output

N/A - No output present


