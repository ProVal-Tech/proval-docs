---
id: 'e413063b-7bce-4a4e-99ce-daea264d6ac6'
title: 'ESXi Invalid License Detected'
title_meta: 'ESXi Invalid License Detected'
keywords: ['esxi', 'monitoring', 'license', 'ticketing', 'alert']
description: 'This document outlines the monitor set designed to detect ESXi hosts with expired or trial version license keys. It includes dependencies, target scope, ticketing details, and alert template configuration for effective management of license compliance.'
tags: ['ticketing', 'vmware']
draft: false
unlisted: false
---

## Summary

The purpose of the monitor set is to detect ESXi hosts with expired or trial version license keys.

## Dependencies

[Script - Ticket Creation - VMWare ESXi Monitoring](<../scripts/Ticket Creation - VMWare ESXi Monitoring.md>)

## Target

Global

## Ticketing

**Subject:** `VM - ESXi - Invalid License Key Detected - \<ESXHostName>`

**Body:** `The ESXi Host @ESXHostName@ (Device ID: %result%) is reporting in Automate with an invalid license key and has been added to Automate for at least 14 days. Typically, ESXi hosts may be set up with a trial key early on but should be transitioned to a full license after onboarding. Please review the detected host and see if a license needs to be applied. The current license key is reporting: %fieldname%`

![Image](../../../static/img/ESXi-Invalid-License-Detected/image_1.png)

## Alert Template

**Name:** `△ Custom - Ticket Creation - ESXi Monitoring`

**The alert template should run the** [CWM - Automate - Script - Ticket Creation - VMWare ESXi Monitoring](<../scripts/Ticket Creation - VMWare ESXi Monitoring.md>) **script on failure.**



