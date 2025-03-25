---
id: '2ed11d29-387b-4b8e-8a8b-b77891fe2b87'
slug: /2ed11d29-387b-4b8e-8a8b-b77891fe2b87
title: 'Execute Script - Click-to-Run - Update'
title_meta: 'Execute Script - Click-to-Run - Update'
keywords: ['office365', 'update', 'monitor', 'script', 'execution']
description: 'This document outlines an internal monitor designed to execute the Microsoft Office Click-to-Run Update script on online machines with Microsoft Office 365 installed. It ensures the update script runs regularly, executing after hours if not run in 15 days and during the day if not run in 30 days.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor executes the "Microsoft Office - Click-to-Run - Update (ScriptState)" script on online machines with Microsoft Office 365 installed. The purpose of this solution is to ensure that the Office 365 Update script runs regularly on all machines. If the script is not executed on a machine for more than 15 days, it will run the script after hours. If the script is not executed on a machine within 30 days, it will execute the script during the daytime.

Additionally, the "Microsoft Office - Click-to-Run - Update (ScriptState)" is a version of the [SWM - Script - Microsoft Office - Click-to-Run - Update](<../scripts/Microsoft Office - Click-to-Run - Update.md>) script, which saves the script state used in this monitor.

## Dependencies

The ["Microsoft Office - Click-to-Run - Update (ScriptState)" script](<../scripts/WebP Vulnerability Report.md>) is a version of the [SWM - Script - Microsoft Office - Click-to-Run - Update](<../scripts/Microsoft Office - Click-to-Run - Update.md>) script.

## Target

Windows Workstations

## Alert Template

**Name:** `△ Custom - Execute Script - Microsoft Office - Click-to-Run - Update (ScriptState)`

The alert template should execute the "Microsoft Office - Click-to-Run - Update (ScriptState)" script.



