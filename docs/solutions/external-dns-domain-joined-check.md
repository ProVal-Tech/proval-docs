---
id: '324645f2-c11e-4ca8-80b4-4ba1f53bd602'
slug: /324645f2-c11e-4ca8-80b4-4ba1f53bd602
title: 'External DNS - Domain Joined - Check'
title_meta: 'External DNS - Domain Joined - Check'
keywords: ['endpoints', 'domain', 'dns', 'report', 'custom', 'agent', 'procedure']
description: 'This document outlines a procedure to check if endpoints are domain-joined and reports on the detection of external DNS. It includes associated content for custom fields and agent procedures that facilitate this check.'
tags: ['dns', 'report', 'security', 'software']
draft: false
unlisted: false
---

## Purpose

This document checks endpoints to determine if they are domain-joined and reports on whether external DNS is detected.

## Associated Content

| Content                                                                 | Type            | Function                                             |
|-------------------------------------------------------------------------|-----------------|-----------------------------------------------------|
| [Custom Field for External DNS Results](/docs/34694743-10f7-4bfa-8a38-79ccf5c68c90) | Custom Field    | Custom field to label external DNS results          |
| [Agent Procedure for Domain Join Detection](/docs/34694743-10f7-4bfa-8a38-79ccf5c68c90) | Agent Procedure  | Procedure to determine domain-joined machines with external DNS. |

## Implementation

The Agent Procedure requires the Custom Field to be created beforehand.