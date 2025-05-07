---
id: '85f52c7c-84bc-488f-a4de-d3122fec1f42'
slug: /85f52c7c-84bc-488f-a4de-d3122fec1f42
title: 'plugin_proval_ad_gpolinks'
title_meta: 'plugin_proval_ad_gpolinks'
keywords: ['gpo', 'links', 'audit', 'information', 'proval']
description: 'This document provides detailed information about Group Policy Object (GPO) links as retrieved from the Group Policy Audit script. It outlines the dependencies, table structure, and the meaning of each column in the data output.'
tags: ['database', 'gpo']
draft: false
unlisted: false
---

## Purpose

This document displays detailed information about the GPO links per GPO from the script @Group Policy Audit.

## Dependencies

- [Group Policy Audit](/docs/2e5f5f2b-7c81-4aec-a76a-623a465f959a)

## Table

#### plugin_proval_ad_gpolinks

| Column       | Type    | Explanation                                                        |
|--------------|---------|--------------------------------------------------------------------|
| GPOGUID      | VARCHAR | The GUID of the GPO associated with the link.                     |
| ComputerID   | INT     | The Automate ComputerID of the supplying domain controller.       |
| Path         | VARCHAR | The OU path of the link.                                          |
| Enforced      | VARCHAR | True or False depending on whether the link is being enforced.   |
| LinkEnabled   | VARCHAR | True or False depending on whether the link is enabled.          |

