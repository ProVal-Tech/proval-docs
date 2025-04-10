---
id: 'd2d35bf1-52bc-41da-9802-76699c5d29bd'
slug: /d2d35bf1-52bc-41da-9802-76699c5d29bd
title: 'Windows - Dell and HP Management Software Status'
title_meta: 'Windows - Dell and HP Management Software Status'
keywords: ['dell', 'hp', 'servers', 'management', 'software', 'dataview']
description: 'This document outlines a dataview that retrieves information about software installed on servers, specifically targeting Dell and HP server management software. It details the columns included in the dataview, such as client name, location, agent name, manufacturer, software status, software name, installation date, size, and version.'
tags: ['installation', 'report', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview pulls in the software installed on servers and looks for Dell or HP server management software.

## Dependencies

None

## Columns

| Column             | Description                                                                  |
|--------------------|------------------------------------------------------------------------------|
| Client Name        | Client Name                                                                  |
| Location Name      | Location Name                                                                |
| Agent Name         | Computer Name                                                                |
| Manufacturer       | Manufacturer of the computer                                                 |
| Software Status    | Shows: "Missing Dell OpenManage", "Missing HP Insight Manager", "Installed" |
| Software Name      | Shows the OpenManage or Insights installed on the machine                   |
| Software Location   | Shows the full path to the installed software                                |
| Date Installed      | Shows when the software was installed                                        |
| Size               | Shows the total size of the installed application                             |
| Version            | Shows the version of the management software installed on the machine        |


