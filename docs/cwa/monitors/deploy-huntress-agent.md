---
id: '8888ddb9-ea31-48cb-a88e-56ff970b0e6c'
slug: /8888ddb9-ea31-48cb-a88e-56ff970b0e6c
title: 'Deploy Huntress Agent'
title_meta: 'Deploy Huntress Agent'
keywords: ['monitor', 'huntress', 'agent', 'deployment', 'windows', 'macintosh']
description: 'This document outlines the purpose and functionality of the internal monitor designed to detect Windows and Macintosh machines that are missing the Huntress Agent and have deployment enabled. It includes details on dependencies, client-level, location-level, and computer-level EDFs, as well as the alert template for deploying the Huntress Agent.'
tags: ['deployment', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the internal monitor is to detect Windows and Macintosh machines that are missing the Huntress Agent and have deployment enabled.

## Dependencies

[SEC - Windows Protection - Script - Deploy Huntress Agent [Windows, Mac]](/docs/523b8882-2c51-4f70-ad7d-cb2b4baf7bbf)

## Client-Level EDF

| Name                          | Type      | Example | Section        | Required | Description                                          |
|-------------------------------|-----------|---------|----------------|----------|------------------------------------------------------|
| Huntress Agent Install - Enable | Check-Box | 0/1     | Security Tools | False    | Mark this EDF to enable auto deployment for the client |

## Location-Level EDF

| Name                          | Type      | Example | Section        | Required | Description                                      |
|-------------------------------|-----------|---------|----------------|----------|--------------------------------------------------|
| Huntress Agent Install - Exclude | Check-Box | 0/1     | Security Tools | False    | Mark this EDF to exclude the location.           |

## Computer-Level EDF

| Name                          | Type      | Example | Section        | Required | Description                                      |
|-------------------------------|-----------|---------|----------------|----------|--------------------------------------------------|
| Huntress Agent Install - Exclude | Check-Box | 0/1     | Security Tools | False    | Mark this EDF to exclude the computer.           |

## Target

Global

## Alert Template

**Name:** `△ Custom - Deploy Huntress Agent`