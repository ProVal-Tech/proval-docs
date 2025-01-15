---
id: '9e4ece73-9d18-410d-9df9-6a9ebf4389c4'
title: 'TLS Version Check for Managed Windows Computers'
title_meta: 'TLS Version Check for Managed Windows Computers'
keywords: ['tls', 'windows', 'monitor', 'security', 'configuration']
description: 'This document outlines the procedure to display the enabled TLS versions on Managed Windows computers within the environment. It includes associated content links for remote monitors and dataviews to facilitate the gathering and display of TLS client and server versions.'
tags: ['security', 'configuration', 'monitoring', 'windows']
draft: false
unlisted: false
---
## Purpose

The purpose of the solution is to display the Enabled Client and Server (if applicable) TLS version(s) on the Managed Windows computers in the environment.

## Associated Content

| Content                                                                                                           | Type          | Function                                                       |
|-------------------------------------------------------------------------------------------------------------------|---------------|---------------------------------------------------------------|
| [EPM - Windows Configuration - Remote Monitor - TLS Version Check - Client](https://proval.itglue.com/DOC-5078775-13217933) | Remote Monitor | Gather Comma Separated List of enabled TLS Client Versions    |
| [EPM - Windows Configuration - Remote Monitor - TLS Version Check - Server](https://proval.itglue.com/DOC-5078775-13217931) | Remote Monitor | Gather Comma Separated List of enabled TLS Server Versions    |
| [EPM - Windows Configuration - Dataview - Security - TLS Status](https://proval.itglue.com/DOC-5078775-7974498) | Dataview      | Display the data gathered by the remote monitors in human-readable format. |

## Implementation

- Read all the solution and content-related documents carefully.
- Do Not Proceed without going through all the associated documents.
- Import both remote monitors to the applicable groups. (Follow the private articles linked to the remote monitor's documents).
- Import the dataview.
- Do group Refresh or wait for 30 minutes and ensure that the dataview starts displaying the expected data.







