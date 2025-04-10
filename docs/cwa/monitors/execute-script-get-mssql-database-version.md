---
id: 'd7ad7eb3-8f39-4798-a80c-f0a6cdae7213'
slug: /d7ad7eb3-8f39-4798-a80c-f0a6cdae7213
title: 'Execute Script - Get MSSQL Database Version'
title_meta: 'Execute Script - Get MSSQL Database Version'
keywords: ['mssql', 'monitor', 'database', 'version', 'script']
description: 'This document outlines the functionality of the internal monitor that executes a script to retrieve the MSSQL database version weekly. It details dependencies, target systems, and ticketing information.'
tags: ['database', 'mssql']
draft: false
unlisted: false
---

## Summary

The internal monitor executes the [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee) once per week against the MSSQL servers available in the environment.

## Dependencies

- [Custom Table - pvl_mssql_db_version](/docs/e0ec87f6-0624-40db-ac6b-1b7d823e6b37)
- [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee)

## Target

The internal monitor is explicitly limited to the `MSSQL Servers` present in the environment.

## Ticketing

**Name:** `△ Custom - Execute Script - Get MSSQL Database Version`


