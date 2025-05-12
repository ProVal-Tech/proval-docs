---
id: 'bea56cbb-3761-452a-9493-08a88bc6dbab'
slug: /bea56cbb-3761-452a-9493-08a88bc6dbab
title: 'pvl_outlook_pst_ost_audit'
title_meta: 'pvl_outlook_pst_ost_audit'
keywords: ['custom', 'table', 'microsoft', 'outlook', 'audit']
description: 'This document outlines the purpose and structure of a custom table designed to store data collected by the EPM - Data Collection script for Microsoft Outlook OST/PST audits. It details the dependencies and the specific columns included in the table, providing a comprehensive overview for users and developers.'
tags: ['database', 'report', 'software', 'windows']
draft: false
unlisted: false
---

## Purpose

The custom table stores the data gathered by the [EPM - Data Collection - Script - Microsoft Outlook - OST/PST - Audit](/docs/2029ecbe-c5f8-431e-9643-7aed63bec6d8) script.

## Dependencies

[EPM - Data Collection - Script - Microsoft Outlook - OST/PST - Audit](/docs/2029ecbe-c5f8-431e-9643-7aed63bec6d8)

## Tables

#### pvl_outlook_pst_ost_audit

| Column              | Type     | Description                                 |
|---------------------|----------|---------------------------------------------|
| Computerid          | Int      | Computer ID (Hidden)                       |
| Path                | Varchar  | Path to the OST/PST file                   |
| Size                | Double   | Size of the file in Megabytes              |
| ModificationTime    | DateTime | Most recent modification time of the file   |
| DataCollectionTime  | DateTime | Data Collection Time                        |