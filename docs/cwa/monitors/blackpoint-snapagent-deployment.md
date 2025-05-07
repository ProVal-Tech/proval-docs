---
id: '8dad86ab-7d59-43ef-b148-f4ab7df0b8f0'
slug: /8dad86ab-7d59-43ef-b148-f4ab7df0b8f0
title: 'BlackPoint SnapAgent Deployment'
title_meta: 'BlackPoint SnapAgent Deployment'
keywords: ['monitor', 'snapagent', 'installation', 'deployment', 'windows']
description: 'This document outlines a monitor designed to detect online Windows agents where the SnapAgent is not installed. It includes dependencies on specific EDFs for installation confirmation and exclusion criteria, as well as ticketing control through the SnapAgent Installer script.'
tags: ['deployment', 'ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor detects online Windows agents where the SnapAgent is not installed.

It also depends on the following EDFs:
- **BlackPoint SNAP URL**: The Client EDF should contain the URL of the installer package downloader.
- **BlackPoint SnapAgent Deploy**: The Client EDF should be checked for deployment confirmation.
- **BlackPoint SnapAgent Deploy Exclude**: The location EDF should not be checked for deployment; otherwise, agents from those locations will be excluded.
- **BlackPoint SnapAgent Exclude**: The computer EDF should not be checked for deployment; otherwise, the agent will be excluded.

## Dependencies

[CWA - Script - SnapAgent Installer](/docs/202e2dde-5865-4035-8410-37dc6cb92a60)

## Target

Global

## Ticketing

- The ticket is controlled by the script "SnapAgent Installer."
- To enable the ticketing feature, it is mandatory to set the ticket category at the monitor level, as shown below:

![Ticket Category](../../../static/img/docs/8dad86ab-7d59-43ef-b148-f4ab7df0b8f0/image_1.webp)
