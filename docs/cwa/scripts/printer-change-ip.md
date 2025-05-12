---
id: '631186de-253a-4bd7-8197-958cb1ed7b68'
slug: /631186de-253a-4bd7-8197-958cb1ed7b68
title: 'Printer Change IP'
title_meta: 'Printer Change IP'
keywords: ['printer', 'ip', 'change', 'networking']
description: 'This document outlines a script that changes the IP address of a printer from an old IP address to a new one, detailing the process, variables, and user parameters involved in the operation.'
tags: ['networking']
draft: false
unlisted: false
---

## Summary

This document describes how to change the printer's IP address from `@OldIP@` to `@NewIP@`.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/631186de-253a-4bd7-8197-958cb1ed7b68/image_1.webp)

## Variables

| Variable      | Description                          |
|---------------|--------------------------------------|
| PrinterChange | Output of the PowerShell script.     |

### User Parameters

| Name   | Example        | Required     | Description                              |
|--------|----------------|--------------|------------------------------------------|
| NewIP  | 192.168.1.168  | True         | The IP address to assign to the printer.|
| OldIP  | 192.168.1.16   | True/False   | The target IP address of the printer to modify. |

## Process

- The script will perform all necessary verifications first.
- It will check if `OldIP` is provided and whether it is valid.
  - If `OldIP` is valid, the script will replace the printer's current IP address from `OldIP` to `NewIP`.

## Output

- Script log