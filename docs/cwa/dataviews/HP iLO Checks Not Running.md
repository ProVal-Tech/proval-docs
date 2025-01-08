---
id: 'cwa-hp-ilo-health-check-issues'
title: 'HP iLO Health Check Issues'
title_meta: 'HP iLO Health Check Issues'
keywords: ['hp', 'ilo', 'health', 'check', 'issues', 'monitoring']
description: 'This document outlines the password entries for which the HP iLO Health Check automation is not functioning correctly. It includes dependencies, a summary of the issue, and a detailed table of relevant columns including client name, location, password entry title, last run time, and connection status.'
tags: ['monitoring', 'health', 'client', 'location', 'connection', 'status']
draft: false
unlisted: false
---
## Summary

List down the password entries for which the HP iLO Health Check automation is not running properly.

## Dependencies

- [EPM - Data Collection - Script - HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-10072559)
- [CWM - Automate - Internal Monitor - Execute Script - HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-12879037)

## Columns

| Column           | Description                                       |
|------------------|---------------------------------------------------|
| Client           | Client Name                                       |
| Location         | Location Name                                     |
| iLO              | Title of the Password Entry                       |
| PassLastRun      | Last time the check was performed if any         |
| ConnectionStatus  | Connection Status during the previous execution    |

