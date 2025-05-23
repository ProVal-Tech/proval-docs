---
id: '46775a5d-7e55-4aec-ad17-aeb43e63b202'
slug: /46775a5d-7e55-4aec-ad17-aeb43e63b202
title: 'Patching - Stage Details'
title_meta: 'Patching - Stage Details'
keywords: ['patching', 'data', 'view', 'endpoint', 'client', 'location']
description: 'This document provides an overview of a data view that displays the patching stage assigned to a machine. It outlines the relevant columns, including client name, location name, machine name, and the current patching stage, while noting that the data is only applicable if the stage delay feature is active.'
tags: ['report', 'software']
draft: false
unlisted: false
---

## Summary

This data view shows the patching stage assigned to a machine. Note that this data is not relevant if the stage delay feature is not active.

## Dependencies

None

## Columns

| Column          | Description                                         |
|------------------|-----------------------------------------------------|
| Client name      | The name of the client                              |
| Location name    | The name of the location                            |
| Machine name     | The name of the endpoint                            |
| Patching Stage   | The patching stage of the endpoint (Production | Pilot | Test) |