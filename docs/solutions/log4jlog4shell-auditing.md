---
id: 'a341f9a4-e07e-4417-84fb-06162d7fb52b'
slug: /a341f9a4-e07e-4417-84fb-06162d7fb52b
title: 'Log4JLog4Shell Auditing'
title_meta: 'Log4JLog4Shell Auditing'
keywords: ['log4shell', 'vulnerabilities', 'automate', 'agents', 'security']
description: 'This document provides an overview of potential Log4Shell vulnerabilities and the associated risks to Automate agents. It includes links to various resources such as custom tables, dataviews, and scripts that facilitate the identification and remediation of these vulnerabilities.'
tags: ['security', 'vulnerability']
draft: false
unlisted: false
---

## Purpose

To present information about possible Log4Shell vulnerabilities and attacks on Automate agents.

## Associated Content

| Content                                                                                                           | Type         | Function                                                                                                           |
|-------------------------------------------------------------------------------------------------------------------|--------------|--------------------------------------------------------------------------------------------------------------------|
| SEC - Endpoint Protection - Custom Table - plugin_proval_log4jsoftwarelist |
| [SEC - Endpoint Protection - Dataview - Log4J - Log4Shell - Possible Vulnerabilities](/docs/44ae65f5-ca26-409d-bdcc-ad294544fc90) | Dataview    | Displays possible discovered software that is vulnerable.                                                         |
| [SEC - Endpoint Protection - Script - Import Log4Shell Table](/docs/c3342117-53c8-48de-9831-27cd7da77c00) | Script       | Wraps the Import-Log4JTable agnostic script.                                                                     |
| SEC - Endpoint Protection - Agnostic - Import-Log4JTable and stores it in a custom table. |
| [SEC - Endpoint Protection - Script - Log4J (Log4Shell) File Scan](/docs/a8eab72d-3794-4808-9009-b01bf3c9bcba) | Script       | This script is used to scan for possible vulnerabilities in a target system, saving information to EDFs for reporting. |
| [SEC - Endpoint Protection - Dataview - Log4J - Log4Shell - Detections](/docs/59595d20-d1f8-4406-b574-58a4d32b0384) | Dataview    | Displays information about the EDFs filled by [SEC - Endpoint Protection - Script - Log4J (Log4Shell) File Scan](/docs/a8eab72d-3794-4808-9009-b01bf3c9bcba). These EDFs indicate vulnerability information about the Log4J/Log4Shell exploit. |
| [CWM - Automate - Script - Log4J Remediation Residue Removal](/docs/c18e0a86-ade5-405a-9fc4-46908a340cf8) | Script       | Removes the residuals left by the [Log4J (Log4Shell) File Scan](/docs/a8eab72d-3794-4808-9009-b01bf3c9bcba) script, including the `Everything` service. |


