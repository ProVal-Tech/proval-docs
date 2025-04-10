---
id: 'e14bf501-f10d-44d7-a19a-2284fd5c5cc9'
slug: /e14bf501-f10d-44d7-a19a-2284fd5c5cc9
title: 'Ticket Creation - Computer Failures Only'
title_meta: 'Ticket Creation - Computer Failures Only'
keywords: ['ticket', 'creation', 'computer', 'failures', 'alert']
description: 'This document details a script designed for creating tickets specifically for computer failures, avoiding execution for monitors with SUCCESS or WARNING statuses. It is intended to be run from an alert template, specifically the Custom - Ticket Creation Computer - Failures Only template.'
tags: []
draft: false
unlisted: false
---

## Summary

This document is an exact copy of the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script, with the exception that it refrains from executing actions for monitors with `SUCCESS` or `WARNING` statuses.

It should only be executed from an alert template. Currently, it is implemented in the `△ Custom - Ticket Creation Computer - Failures Only` alert template.


