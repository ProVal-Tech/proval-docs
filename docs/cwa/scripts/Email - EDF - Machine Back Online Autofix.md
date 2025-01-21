---
id: 'c32c5921-0bd1-4e4a-b605-baa0e958fbc0'
title: 'CWM - Automate - Internal Monitor - Email Notification for Machine Back Online'
title_meta: 'CWM - Automate - Internal Monitor - Email Notification for Machine Back Online'
keywords: ['email', 'alert', 'monitor', 'notification', 'machine']
description: 'This document outlines the functionality of a script designed to send email notifications when a monitored machine comes back online. It integrates with the CWM - Automate - Internal Monitor for effective monitoring and alerting.'
tags: ['email']
draft: false
unlisted: false
---

## Summary

This script is intended to be used with the [CWM - Automate - Internal Monitor - ProVal - Development - Agent - E-Mail - Machine Back Online](<../monitors/Agent - E-Mail - Machine Back Online.md>) monitor. It will send an email to the addresses mentioned in the computer-level EDF "Online Alert E-mail."

## Sample Run

To be executed as an Autofix script only. The `△ Custom - E-Mail - Machine Back Online` alert template calls the script.

## Dependencies

[CWM - Automate - Internal Monitor - ProVal - Development - Agent - E-Mail - Machine Back Online](<../monitors/Agent - E-Mail - Machine Back Online.md>)

## Variables

| Name    | Description                                         |
|---------|-----------------------------------------------------|
| Status  | Success/Failed status returned by the monitor set.  |
| Email   | Email addresses saved in the `Online Alert E-mail` EDF. |
| Subject | Email Subject.                                     |
| Body    | Email Body                                         |

## Process

- Set the variables
- Send the Email

## Output

- Email  
  Sample Email:  
  ![Sample Email](../../../static/img/Email---EDF---Machine-Back-Online-Autofix/image_1.png)
