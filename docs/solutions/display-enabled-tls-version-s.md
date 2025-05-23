---
id: '9e4ece73-9d18-410d-9df9-6a9ebf4389c4'
slug: /9e4ece73-9d18-410d-9df9-6a9ebf4389c4
title: 'Display Enabled TLS Version(s)'
title_meta: 'Display Enabled TLS Version(s)'
keywords: ['tls', 'windows', 'monitor', 'security', 'configuration']
description: 'This document outlines the procedure to display the enabled TLS versions on Managed Windows computers within the environment. It includes associated content links for remote monitors and dataviews to facilitate the gathering and display of TLS client and server versions.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to display the enabled client and server (if applicable) TLS version(s) on the Managed Windows computers in the environment.

## Associated Content

| Content                                                                                                           | Type          | Function                                                       |
|-------------------------------------------------------------------------------------------------------------------|---------------|---------------------------------------------------------------|
| [EPM - Windows Configuration - Remote Monitor - TLS Version Check - Client](/docs/b0639ecd-38cd-4afd-a764-bcce13fd8ac7) | Remote Monitor | Gather a comma-separated list of enabled TLS client versions.  |
| [EPM - Windows Configuration - Remote Monitor - TLS Version Check - Server](/docs/0a19eb90-ba18-4097-ab12-a76efa8e4b83) | Remote Monitor | Gather a comma-separated list of enabled TLS server versions.  |
| [EPM - Windows Configuration - Dataview - Security - TLS Status](/docs/aa31f8b3-9d5e-4ad1-98cc-a6e1d329cb1f) | Dataview      | Display the data gathered by the remote monitors in a human-readable format. |

## Implementation

- Read all the solution and content-related documents carefully.
- Do not proceed without reviewing all the associated documents.
- Import both remote monitors to the applicable groups. (Follow the private articles linked to the remote monitor's documents).
- Import the dataview.
- Perform a group refresh or wait for 30 minutes to ensure that the dataview starts displaying the expected data.