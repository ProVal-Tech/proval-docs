---
id: 'd801eb05-05a3-4271-aa8c-a8ea4941f4eb'
title: 'Internal Monitors for Microsoft Outlook OST/PST Audit'
title_meta: 'Internal Monitors for Microsoft Outlook OST/PST Audit'
keywords: ['monitoring', 'outlook', 'audit', 'windows', 'script']
description: 'This document outlines the setup and dependencies for running internal monitors that execute the Microsoft Outlook OST/PST Audit script weekly on Windows workstations with Outlook installed. It includes information on the alert template and the target scope of the monitoring.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The internal monitors run the [Microsoft Outlook - OST/PST - Audit](<../scripts/Microsoft Outlook - OSTPST - Audit.md>) script on a weekly basis for Windows workstations with Outlook installed.

## Dependencies

[EPM - Data Collection - Script - Microsoft Outlook - OST/PST - Audit](<../scripts/Microsoft Outlook - OSTPST - Audit.md>)

## Target

Global

## Alert Template

`△ Custom - Execute Script - Microsoft Outlook - OST/PST - Audit`
