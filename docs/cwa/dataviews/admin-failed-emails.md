---
id: '525e89d1-335a-4664-920b-0428b827a7ad'
slug: /525e89d1-335a-4664-920b-0428b827a7ad
title: 'Admin - Failed Emails'
title_meta: 'Admin - Failed Emails'
keywords: ['failed', 'emails', 'dataview', 'automate', 'error']
description: 'This document provides a summary of the Failed Emails DataView in ConnectWise Automate, detailing the columns and their descriptions that are displayed from the failedemails table, including information such as the email addresses involved, subject, body, failure date, and error messages.'
tags: ['database', 'report']
draft: false
unlisted: false
---

## Summary

This DataView displays the data from the `failedemails` table in Automate.

## Dependencies

None

## Columns

| Column    | Description                                                                                     |
|-----------|-------------------------------------------------------------------------------------------------|
| To        | The email address where Automate attempted to send the email                                   |
| From      | The email address that Automate tried to send the email from                                   |
| CC        | Lists any email addresses in the "CC" section of the email                                     |
| Subject   | The subject of the email                                                                        |
| Body      | The body of the email                                                                           |
| FailDate  | The date the email failed to send                                                               |
| ErrorMsg  | The error message gathered by Automate when the email failed to send                           |
