---
id: 'cwa-change-printer-ip'
title: 'Change Printer IP Address'
title_meta: 'Change Printer IP Address'
keywords: ['printer', 'ip', 'change', 'networking']
description: 'This document outlines a script that changes the IP address of a printer from an old IP address to a new one, detailing the process, variables, and user parameters involved in the operation.'
tags: ['networking', 'printer', 'ip', 'configuration']
draft: false
unlisted: false
---
## Summary

Changes the printer with IP Address @OldIP@ to the IP address @NewIP@.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\Printer-Change-IP\image_1.png)

## Variables

| Variable      | Description                          |
|---------------|--------------------------------------|
| PrinterChange | Output of the PowerShell script.     |

### User Parameters

| Name   | Example        | Required     | Description                              |
|--------|----------------|--------------|------------------------------------------|
| NewIP  | 192.168.1.168  | True         | The IP to assign to the printer.        |
| OldIP  | 192.168.1.16   | True/False   | The target IP address of the printer to modify. |

## Process

- This script will do all the verification first.
- If OldIP is provided and if it is valid or not.
  - If OldIP is valid, it will replace the printer with the current IP address of OldIP with NewIP.

## Output

- Script log



