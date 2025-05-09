---
id: '86cf6cf1-58cc-404d-ab7a-a80658e7b91f'
slug: /86cf6cf1-58cc-404d-ab7a-a80658e7b91f
title: 'Automate - Less Than 10 Licenses Remaining'
title_meta: 'Automate - Less Than 10 Licenses Remaining'
keywords: ['automate', 'alert', 'licenses', 'monitor', 'ticket']
description: 'This document provides details on setting up an alert monitor for Automate licenses. It will trigger notifications when the number of remaining licenses drops below ten, facilitating timely responses to license management needs. The guide includes important notes for both on-prem and hosted partners regarding ticket generation and client identification.'
tags: []
draft: false
unlisted: false
---

## Summary

This monitor will alert if there are fewer than 10 Automate licenses remaining.

The suggested alert template is **Default Create Automate Ticket**.

## Important Notes

For on-prem partners, tickets will be generated for the Automate server.  
For hosted partners, it will be the minimum `computerid` of `Clientid 1`. If `Clientid 1` is not the primary client for a hosted partner, then the `clientid` should be updated in the Additional Field:  

![Image](../../../static/img/docs/86cf6cf1-58cc-404d-ab7a-a80658e7b91f/image_1.webp)

## Target

Global - Should be run without explicitly defined targets.