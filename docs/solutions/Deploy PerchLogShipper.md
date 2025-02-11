---
id: '0b20cd24-d35c-47c9-a35d-cd1f2a5ac2e8'
title: 'Deploy PerchLogShipper'
title_meta: 'Deploy PerchLogShipper'
keywords: ['perch', 'log', 'shipper', 'windows', 'deployment', 'monitor']
description: 'This document outlines the steps to deploy Perch Log Shipper on Windows machines, detailing associated scripts and monitors needed for effective implementation.'
tags: ['deployment', 'software', 'windows']
draft: false
unlisted: false
---

## Purpose

The goal of this solution is to deploy Perch Log Shipper on Windows machines.

## Associated Content

### Core Content

| Content                                                                 | Type           | Function                                                                     |
|-------------------------------------------------------------------------|----------------|------------------------------------------------------------------------------|
| [Script - Deploy Perch Log Shipper](<../cwa/scripts/Deploy Perch Log Shipper.md>) | Script         | Deploys Perch Log Shipper on Windows machines where it's not already installed |
| [Internal Monitor - Deploy Perch Log Shipper](<../cwa/monitors/Deploy Perch Log Shipper.md>) | Internal Monitor | Detects Windows machines missing Perch Log Shipper.                          |
| `△ Custom - Execute Script - Deploy Perch Log Shipper`               | Alert Template  | This will execute the [Script - Deploy Perch Log Shipper](<../cwa/scripts/Deploy Perch Log Shipper.md>) |

### Other Content

| Content                                                                 | Type           | Function                                                                                           |
|-------------------------------------------------------------------------|----------------|----------------------------------------------------------------------------------------------------|
| [Agnostic Script - Install - Perch Log Shipper](https://proval.itglue.com/DOC-5078775-14959900) | Agnostic Script | Agnostic Script used to deploy Perch Log Shipper in [SWM - Software Install - Script - Deploy Perch Log Shipper](<../cwa/scripts/Deploy Perch Log Shipper.md>) script |

## Implementation

Read the associated documents carefully.

- Import - [Script - Deploy Perch Log Shipper](<../cwa/scripts/Deploy Perch Log Shipper.md>)
- Import - [Internal Monitor - Agents Missing Perch Log Shipper](<../cwa/monitors/Deploy Perch Log Shipper.md>)
- Import - Alert Template - `△ Custom - Execute Script - Deploy Perch Log Shipper`
- Ensure the [Script - Deploy Perch Log Shipper](<../cwa/scripts/Deploy Perch Log Shipper.md>) script is bonded to the `△ Custom - Execute Script - Deploy Perch Log Shipper` Alert Template.
- Ensure the `△ Custom - Execute Script - Deploy Perch Log Shipper` Alert Template is being used with [Internal Monitor - Agents Missing Perch Log Shipper](<../cwa/monitors/Deploy Perch Log Shipper.md>).
- Right-click and select "Run Now" to enable [Internal Monitor - Agents Missing Perch Log Shipper](<../cwa/monitors/Deploy Perch Log Shipper.md>) to start deploying Perch Log Shipper on the required machines.




