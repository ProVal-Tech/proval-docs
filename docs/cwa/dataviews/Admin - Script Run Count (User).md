---
id: 'ad731eb0-1e15-41dc-b23b-10876dd22543'
title: 'Admin - Script Run Count (User)'
title_meta: 'Admin - Script Run Count (User)'
keywords: ['dataview', 'scripts', 'usage', 'rmm', 'monitoring']
description: 'This document provides a comprehensive overview of a dataview designed to display data related to the frequency of script execution by users within a remote monitoring and management environment. It aims to assess whether technicians are actively utilizing scripts or primarily providing remote support.'
tags: ['performance', 'report', 'usage', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview displays data related to how often scripts are being run by users in the environment. The goal of this dataview is to show if technicians are using scripts or are just providing remote support without utilizing the RMM.

## Dependencies

None

## Columns

| Column        | Description                                                                                      |
|---------------|--------------------------------------------------------------------------------------------------|
| Script Name   | The name of the script that was run                                                              |
| Run by User   | The user that ran the script                                                                     |
| ScriptID      | The numerical value of the script                                                                 |
| Times Run     | A count of the number of times the script was run by this user in the last 30 days              |
| Last Run      | The last time the script was run by the user                                                    |



