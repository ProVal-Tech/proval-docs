---
id: '6a855fe6-df02-4668-81c3-8cd392595c31'
title: 'CWM - Automate - Automate - Unsynced Ticket Content'
title_meta: 'CWM - Automate - Automate - Unsynced Ticket Content'
keywords: ['monitor', 'tickets', 'alerts', 'synchronization', 'cwmanage']
description: 'This document outlines the setup and dependencies for the Unsynced Ticket Comments Monitor, which alerts partners about any ticket comments that have not been synchronized with CW Manage. It includes details on required plugins and configuration steps to ensure alerts are sent correctly.'
tags: ['cwmanage', 'email']
draft: false
unlisted: false
---

## Summary

This monitor intends to alert partners of any **unsynced** ticket comments for a ticket that has already been synchronized to CW Manage.

## Dependencies

- [Email RAWSQL Monitor Set Failures* [Autofix]](<../scripts/Email Creation - Computer Failure Only.md>)  
- CW Manage Plugin  

Use the "△ Email RAWSQL Monitor set results to the Partner" alert template along with the monitor set.

**Note:** The script will send an email to the alert template user/contact. This field must be modified manually after importing the template or while enabling the monitor. The alert template will default to the location contact, and you must set the contact/user that you wish to receive the alerts.

![Image](../../../static/img/CWM---Automate---Automate---Unsynced-Ticket-Content/image_1.png)

## Target

Global



