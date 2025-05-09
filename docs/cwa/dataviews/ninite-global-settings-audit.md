---
id: '33deee73-0939-4830-b0a8-4bc0d547cdb8'
slug: /33deee73-0939-4830-b0a8-4bc0d547cdb8
title: 'Ninite Global Settings Audit'
title_meta: 'Ninite Global Settings Audit'
keywords: ['audit', 'ninite', 'plugin', 'configurations', 'settings', 'applications']
description: 'This document provides an audit of all locations that have different configurations from the global settings in the Ninite Plugin, detailing the discrepancies in application configurations for better management.'
tags: ['ninite', 'report', 'software']
draft: false
unlisted: false
---

## Summary

This document presents an audit of all locations that have configurations different from the global settings in the Ninite Plugin.

## Dependencies

- mp_niniteselections

## Columns

| Column                       | Description                                                       |
|------------------------------|-------------------------------------------------------------------|
| LocationID                   | Location ID of the location                                       |
| Location Name                | Name of the location                                             |
| ClientID                     | ID of the client                                                |
| Client Name                  | Name of the client                                              |
| Different App Configurations  | Applications that differ from global settings in Ninite         |
| Number of Different Apps      | Total count of applications that differ from global settings     |
