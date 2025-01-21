---
id: '0cbc05b7-cba3-4dd8-a8e9-9a369237362b'
title: 'Audit TLS and SSL Settings in Internet Explorer'
title_meta: 'Audit TLS and SSL Settings in Internet Explorer'
keywords: ['tls', 'ssl', 'internet', 'explorer', 'audit', 'settings', 'security']
description: 'This document provides a detailed overview of the audit script that reflects the TLS and SSL settings enabled in Internet Explorer. It includes dependencies, a summary of the data view, and the columns used in the report.'
tags: ['report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This data view reflects the audit script, showing which versions of TLS and SSL settings are enabled in Internet Explorer.

## Dependencies

- @Internet Explorer Advanced SSL and TLS Settings [Param, DV] (Script)

## Columns

| Column                      | Description                                       |
|-----------------------------|---------------------------------------------------|
| Client Name                 | Client Name                                       |
| Location Name               | Location Name                                     |
| Computer Name               | Computer Name                                     |
| Operating System            | OS installed on the machine                       |
| Last Contact                | Last time the agent checked into Automate         |
| Contact                     | Computer's assigned Contact (if any)             |
| Contact Email               | Computer's assigned Contact Email (if any)       |
| IE Advanced Security Status  | Lists which versions of TLS and SSL are enabled   |

