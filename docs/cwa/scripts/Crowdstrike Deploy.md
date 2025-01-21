---
id: '96774e0b-8ce1-4fc6-a465-103b0e478e2c'
title: 'Install Crowdstrike on Agent'
title_meta: 'Install Crowdstrike on Agent - Step-by-Step Guide'
keywords: ['crowdstrike', 'agent', 'installation', 'edf', 'script']
description: 'This document provides a detailed guide on how to install Crowdstrike on an agent using a script. It covers requirements, variables, global parameters, the installation process, and expected output logs.'
tags: ['installation', 'security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script will install Crowdstrike on an agent.

## Requirements

1. The client-level 'Crowdstrike CID' EDF must be filled in.

## Sample Run

![Sample Run](../../../static/img/Crowdstrike-Deploy/image_1.png)

## Variables

| Name | Description |
|------|-------------|
| CID  | Stores the Crowdstrike CID key from the EDF "CrowdStrike CID" |

#### Global Parameters

| Name          | Example   | Required | Description                      |
|---------------|-----------|----------|----------------------------------|
| TicketCreation| 0 or 1   | False    | 1 - Create ticket, 0 - No Ticket |
| URL_Download  | https:// | True     | WindowsSensor.exe package        |

## Process

This script will install Crowdstrike on an agent using the CID key provided in the Client EDF "Crowdstrike CID" and the installer package. It checks for Crowdstrike; if it's not present, it then checks whether the key and URL are provided. If any part is missing, the script will exit. If all parts are confirmed, it will attempt to install Crowdstrike and verify its progress.

## Output

- Script log

