---
id: '0c3523a9-e392-40f6-bc59-173a21001f0d'
title: 'Windows Duo Agent Exclusion Monitor'
title_meta: 'Windows Duo Agent Exclusion Monitor'
keywords: ['duo', 'monitor', 'windows', 'exclusion', 'agent']
description: 'This document outlines the purpose and dependencies of the Windows Duo Agent Exclusion Monitor, which is designed to detect Windows machines with Duo installed and manage exclusions based on client, location, or computer-level settings.'
tags: ['security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this monitor is to detect Windows machines with Duo installed on them, where the EDF `Duo Agent Exclusion` is opted at the client, location, or computer level.

**Note:** *The same EDFs are also being used in the [SWM - Software Install - DUO Install/Upgrade - Latest Version](<../scripts/DUO InstallUpgrade - Latest Version.md>). Selecting these EDFs will exclude the agent from DUO deployment and will also uninstall DUO from the machine if it is already installed.*

## Dependencies

| Name                    | Level    | Type     | Section     | Description                                                                                           |
|-------------------------|----------|----------|-------------|-------------------------------------------------------------------------------------------------------|
| DUO Agent Exclusion     | Client   | Checkbox | Exclusions  | Select this EDF to remove DUO from all machines under the Client. ![Image](../../../static/img/Uninstall-DUO/image_1.png) |
| DUO Agent Exclusion     | Location | Checkbox | Exclusions  | Select this EDF to remove DUO from all machines under the location. ![Image](../../../static/img/Uninstall-DUO/image_2.png) |
| DUO Agent Exclusion     | Computer | Checkbox | Exclusions  | Select this EDF to remove DUO from the selected machine only. ![Image](../../../static/img/Uninstall-DUO/image_3.png) |

## Target

Global

## Alert Template

△ Custom - Execute Script - Uninstall DUO

