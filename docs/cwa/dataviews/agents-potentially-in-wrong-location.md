---
id: 'dc8790d6-6784-4646-b763-f7eebe78a0b1'
slug: /dc8790d6-6784-4646-b763-f7eebe78a0b1
title: 'Agents Potentially in Wrong Location'
title_meta: 'Agents Potentially in Wrong Location'
keywords: ['dataview', 'machines', 'location', 'router', 'ip']
description: 'This document provides a detailed overview of a Dataview that displays machines incorrectly placed in locations based on router addresses. It outlines the necessary columns and their descriptions to help identify misplacements and ensure accurate location tracking.'
tags: ['networking', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This Dataview displays the machines that are placed in the wrong location. The location is verified based on the router address. The router IP for each location must be defined in the locations tab.

## Columns

| Column                     | Description                                                        |
|---------------------------|--------------------------------------------------------------------|
| Computer ID               | Computer ID                                                       |
| Agent Name                | Machine Name                                                     |
| Current Client ID         | Client ID of the client the machine currently belongs to          |
| Current Client Name       | Client Name the machine currently belongs to                      |
| Current Location ID       | Location ID of the location the machine currently belongs to      |
| Current Location Name     | Location Name the machine currently belongs to                    |
| Machine Router Address     | Machine's Router Address                                          |
| New Location Router Address| Matching location's Router Address                                 |
| New Location ID           | Matching Location's Location ID                                    |
| New Location Name         | Matching Location's Name                                          |
| New Client ID             | Matching Client's Client ID                                       |
| New Client Name           | Matching Client's Name                                            |