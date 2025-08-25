---
id: '39162f8f-057c-4dec-adf8-e68309cbec5b'
slug: /39162f8f-057c-4dec-adf8-e68309cbec5b
title: 'Install Evo Agent'
title_meta: 'Install Evo Agent'
keywords: ['evo-agent', 'evo-mfa-agent', 'evo', 'evo-credential-provider-installer', 'evo-credential-provider']
description: 'Detects windows machines where Evo Agent deployment is enabled and application is not installed.'
tags: ['software', 'installation', 'security']
draft: false
unlisted: false
---

## Summary

Detects windows machines where Evo Agent deployment is enabled and application is not installed.

## Dependencies

- [Install Evo Agent](/docs/b1089c56-7d18-11f0-8d05-92000234cfc2)
- [Evo Agent Deployment](/docs/8a0815ff-2351-4eb6-a199-b0682fb03564)

## Alert Template

`△ Custom - Execute Script - Install Evo Agent`

## Target

Global

## EDFs

| Name | Example | Level | Section | Type | Accepted Values | Required | Description |
|------|---------|-------|---------|------|----------------|----------|-------------|
| Install Evo Agent | Windows Servers and Workstations | Client | Evo Agent | DropDown | Windows Servers and Workstations, Windows Workstations, Windows Servers, Disabled | false | Select OS to enable Evo Agent auto installation. |
| Exclude - Install Evo Agent | | Location | Exclusions | Checkbox | | false | Flag to exclude the location from auto-deployment. |
| Exclude - Install Evo Agent | | Computer | Exclusions | Checkbox | | false | Flag to exclude the endpoint from auto-deployment. |