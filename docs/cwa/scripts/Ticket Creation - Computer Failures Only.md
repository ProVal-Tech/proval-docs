---
id: 'cwa-ticket-creation-computer-failures-only'
title: 'Ticket Creation for Computer Failures Only'
title_meta: 'Ticket Creation for Computer Failures Only'
keywords: ['ticket', 'creation', 'computer', 'failures', 'alert']
description: 'This document details a script designed for creating tickets specifically for computer failures, avoiding execution for monitors with SUCCESS or WARNING statuses. It is intended to be run from an alert template, specifically the Custom - Ticket Creation Computer - Failures Only template.'
tags: ['alert', 'ticket', 'monitor', 'failures', 'status']
draft: false
unlisted: false
---
## Summary

It is an exact copy of the [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) script with the exception that it now refrains from executing actions for monitors with `SUCCESS` or `WARNING` statuses.

Should be executed from an alert template only. Currently, it's implemented in the `△ Custom - Ticket Creation Computer - Failures Only` alert template.



