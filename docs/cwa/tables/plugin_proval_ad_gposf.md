---
id: '8fa8c78e-04a4-4495-8cfe-44aef7b48035'
slug: /8fa8c78e-04a4-4495-8cfe-44aef7b48035
title: 'plugin_proval_ad_gposf'
title_meta: 'plugin_proval_ad_gposf'
keywords: ['gpo', 'security', 'filtering', 'audit', 'trustee']
description: 'This document provides detailed information about the Group Policy Object (GPO) security filtering for each GPO utilized in the Group Policy Audit script. It outlines the necessary dependencies and presents a table that describes the structure and components involved in the security filtering process.'
tags: ['gpo', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

This document displays detailed information about the GPO security filtering of each GPO from the script @Group Policy Audit.

## Dependencies

- [Group Policy Audit](../scripts/group-policy-audit.md)

## Table

#### plugin_proval_ad_gposf

| Column      | Type     | Explanation                                                                 |
|-------------|----------|-----------------------------------------------------------------------------|
| GPOGUID     | VARCHAR  | The GUID of the GPO associated with the trustee.                           |
| ComputerID  | INT      | The Automate ComputerID of the supplying domain controller.                |
| Trustee     | VARCHAR  | The name of the user or group that the security filter is applying to.     |
| TrusteeType | VARCHAR  | The type of trustee (User, Group, WellKnownGroup, etc.)                   |


