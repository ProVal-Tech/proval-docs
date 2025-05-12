---
id: 'bef71b31-db27-419c-aa73-3431b77959f2'
slug: /bef71b31-db27-419c-aa73-3431b77959f2
title: 'Disk Space lower than 15% Workstations'
title_meta: 'Disk Space lower than 15% Workstations'
keywords: ['machines', 'drive', 'space', 'low', 'monitoring']
description: 'This document provides a summary of a dataview that displays all machines with 15% or less drive space remaining. It outlines the columns included in the dataview and their descriptions, helping users monitor drive space effectively.'
tags: ['database', 'performance', 'report']
draft: false
unlisted: false
---

## Summary

This dataview displays all machines with 15% or less drive space remaining.

## Dependencies

None

## Columns

| Column                    | Description                                      |
|---------------------------|--------------------------------------------------|
| Client                    | Client Name                                      |
| Location                  | Location Name                                    |
| Computer Name             | Computer Name                                    |
| Drive Free Space          | Free space on the drive (rounded to the GB)     |
| Drive Size                | Total drive size (rounded to the GB)            |
| Drive Free Percent        | Drive space free percentage                      |
| Drive FileSystem          | Type of drive (NTFS, FAT, etc.)                 |
| Drive Type                | Type of drive (virtual drive, physical)         |
| Operating System          | OS of the machine                                |
| Agent Last Contact Date   | Last time the agent checked into Automate        |