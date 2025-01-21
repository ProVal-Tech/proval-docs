---
id: '0b82bc57-e8d3-47bf-8e9e-45ca2078499d'
title: 'WinSAT Scores'
title_meta: 'WinSAT Scores'
keywords: ['winsat', 'custom', 'fields', 'scores', 'endpoint']
description: 'This document outlines a solution to update custom fields with WinSAT scores for endpoints using an agent procedure. It includes associated content and implementation steps for setting up the necessary custom fields.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution is designed to use an agent procedure to update custom fields to display the WinSAT scores of an endpoint.

## Associated Content

| Content                                                                                     | Type              | Function                                               |
|---------------------------------------------------------------------------------------------|-------------------|--------------------------------------------------------|
| [Agent Procedure](https://proval.itglue.com/DOC-5078775-13118704)                        | Agent Procedure    | Runs WinSAT to determine the scores of the endpoint.  |
| [Custom Field](https://proval.itglue.com/DOC-5078775-13118706)                           | Custom Field       | Stores the scores from the procedure in custom fields. |

## Implementation

Custom fields need to be created prior to running the agent procedure.



