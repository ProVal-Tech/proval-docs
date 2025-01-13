---
id: 'cwa-deploy-automate-agent-gpo'
title: 'Deploy Automate Agent GPO'
title_meta: 'Deploy Automate Agent GPO'
keywords: ['gpo', 'automate', 'deployment', 'network', 'agent', 'domain', 'probe']
description: 'This document outlines a script that creates a Group Policy Object (GPO) for deploying the Automate Agent on a domain controller with a network probe configured. It details the process, dependencies, user parameters, and expected outputs, aiming to streamline the deployment process.'
tags: ['gpo', 'automation', 'network', 'windows', 'setup']
draft: false
unlisted: false
---
## Summary

This script runs against a domain controller in a location with a network probe configured. Builds a GPO that deploys the Automate Agent. The script can be run to either link or not link the GPO to the root domain.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/GPO---Automate-Agent-Deployment-GPO---Create/image_1.png)

## Dependencies

- Network Probe setup on DC

## Variables

- `@Credentials@` - For verification of location credentials
- `@powershellresult@` - Used for verification of PowerShell 2.0 on the machine
- `@LTSilentEXEURL@` - Used for verification of probe machine.

#### User Parameters

| Name                        | Example | Required | Description                                                                 |
|-----------------------------|---------|----------|-----------------------------------------------------------------------------|
| Apply to entire domain      | yes     | True     | Here you can define whether you want to enforce the GPO to the entire domain or not |

## Process

- Verifies the admin creds set on the location
- Verifies whether the PowerShell version on the machine is greater than 2.0
- Retrieve the URL to download the location-specific silent EXE from the probe system
- Download: GPO Backup, Exe, Startup script
- Store the exe and backup in `C:/Windows/SYSVOL/domain/scripts/`
- Edit migration table for GPO
- Import GPO using an edited migration table

## Output

- Script log



