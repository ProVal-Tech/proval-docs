---
id: '53d5de1f-d5b5-47a3-80a0-17603d673b72'
slug: /53d5de1f-d5b5-47a3-80a0-17603d673b72
title: 'CyberCNS Agent Deployment'
title_meta: 'CyberCNS Agent Deployment'
keywords: ['cybercns', 'agent', 'installation', 'client', 'edf']
description: 'This monitor detects the online Automate agent where the CyberCNS Company ID is provided, and attempts to deploy the CyberCNS agent on it.'
tags: ['installation', 'software']
draft: false
unlisted: false
---

## Summary

This monitor detects the online Automate agent where the CyberCNS Company ID is provided, and attempts to deploy the CyberCNS agent on it.

## Dependencies

- [Script - CyberCNS Agent Installation](/docs/15ecac3c-fe43-4d04-9e6c-82099bfa356b)
- [Solution - CyberCNS Agent](/docs/f68fc157-ae00-4c3f-bb05-b53cefab28ac)

## Target

- Global

## Implementation

- Import the monitor
- Import the alert template `△ Custom - Execute Script - CyberCNS Agent Install`
- Apply the alert template to the monitor
- Right click on monitor and then click the Run now and reset the monitor
 ![Run](../../../static/img/docs/15ecac3c-fe43-4d04-9e6c-82099bfa356b/image4.webp)

## TicketCreation

- To allow creating ticket for the failed attempt of the CyberCNS deployment please set the `Ticket Category` in the Alerting section of the monitor.
![Run](../../../static/img/docs/15ecac3c-fe43-4d04-9e6c-82099bfa356b/image5.webp)
  