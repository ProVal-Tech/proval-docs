---
id: 'cwa-email-machine-back-online'
title: 'CWM - Automate - Internal Monitor - Email Notification for Machine Back Online'
title_meta: 'CWM - Automate - Internal Monitor - Email Notification for Machine Back Online'
keywords: ['email', 'alert', 'monitor', 'notification', 'machine']
description: 'This document outlines the functionality of a script designed to send email notifications when a monitored machine comes back online. It integrates with the CWM - Automate - Internal Monitor for effective monitoring and alerting.'
tags: ['notification', 'email', 'monitor', 'alert', 'online']
draft: false
unlisted: false
---
## Summary

This script is intended to be used with the [CWM - Automate - Internal Monitor - ProVal - Development - Agent - E-Mail - Machine Back Online](https://proval.itglue.com/DOC-5078775-11753157) monitor. It will send an e-mail to the e-mail addresses mentioned in the computer-level EDF "Online Alert E-mail".

## Sample Run

To be executed as an Autofix script only. The `△ Custom - E-Mail - Machine Back Online` alert template calls the script.

## Dependencies

[CWM - Automate - Internal Monitor - ProVal - Development - Agent - E-Mail - Machine Back Online](https://proval.itglue.com/DOC-5078775-11753157)

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
  ![Sample Email](5078775/docs/11753156/images/16462862)

