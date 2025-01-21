---
id: '875584f2-bc8a-44f8-8878-ced46cad6ca4'
title: 'Internal Development Ticketing Script'
title_meta: 'Internal Development Ticketing Script for Autotask'
keywords: ['ticketing', 'autotask', 'development', 'subscripts', 'environment']
description: 'This document outlines a client script designed for internal development environments that creates tickets in the Autotask portal based on modified subscripts within the last 12 hours. It includes details on scheduling, output, and ticketing instructions for support teams.'
tags: ['autotask', 'ticketing']
draft: false
unlisted: false
---

## Summary

This client script is exclusively built for our internal development environment. It creates a ticket in our Autotask portal with the data of the subscripts that have been modified in the last 12 hours.

**Note:** Do not import this script into other Automate environments.

## Sample Run

It is scheduled in our internal Automate environment to run twice per day.  
![Sample Run](../../../static/img/Internal-Environment-Sub-Script-Modification-Notification/image_1.png)

## Output

- Autotask ticket  
![Output](../../../static/img/Internal-Environment-Sub-Script-Modification-Notification/image_2.png)

## Ticketing

**Subject:** `Subscripts Modified in Internal Development Automate Environment`

**Body:**  

`Instructions for Support and NOC Team:`

- Edit the ticket.  
- Set the `Ticket Category` to `Development`.  
- Set the `Ticket Type` to `Incident`.  
- Set the `Priority` to `Medium`.  

`For Development Engineer:`  

`@variableX@`  

**Sample Ticket:**  
![Sample Ticket](../../../static/img/Internal-Environment-Sub-Script-Modification-Notification/image_3.png)
