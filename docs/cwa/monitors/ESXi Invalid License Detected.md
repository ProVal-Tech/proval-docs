---
id: 'cwa-esxi-invalid-license-key-monitor'
title: 'ESXi Invalid License Key Monitoring'
title_meta: 'ESXi Invalid License Key Monitoring'
keywords: ['esxi', 'monitoring', 'license', 'ticketing', 'alert']
description: 'This document outlines the monitor set designed to detect ESXi hosts with expired or trial version license keys. It includes dependencies, target scope, ticketing details, and alert template configuration for effective management of license compliance.'
tags: ['monitoring', 'license', 'ticketing', 'alert', 'vmware']
draft: false
unlisted: false
---
## Summary

The purpose of the monitor set is to detect the ESXi hosts with expired/trial version license key.

## Dependencies

[Script - Ticket Creation - VMWare ESXi Monitoring](https://proval.itglue.com/DOC-5078775-10689215)

## Target

Global

## Ticketing

**Subject:** `VM - ESXi - Invalid License Key Detected - <ESXHostName>`

**Body:** `The ESXi Host @ESXHostName@ (Device ID: %result%) is reporting in Automate with an invalid license key and has been added to Automate for at least 14 days. Typically ESXi hosts may be setup with a trial key early on but should be transitioned to a full license after onboarding. Please review the detected host and see if a license needs to be applied. The current license key is reporting: %fieldname%`

![Image](5078775/docs/13433276/images/19446762)

## Alert Template

**Name:** `△ Custom - Ticket Creation - ESXi Monitoring`

**The alert template should run the** [CWM - Automate - Script - Ticket Creation - VMWare ESXi Monitoring](https://proval.itglue.com/DOC-5078775-10689215) **script on failure.**

