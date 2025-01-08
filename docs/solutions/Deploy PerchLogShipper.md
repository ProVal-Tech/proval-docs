---
id: 'cwa-deploy-perch-log-shipper'
title: 'Deploying Perch Log Shipper on Windows Machines'
title_meta: 'Deploying Perch Log Shipper on Windows Machines'
keywords: ['perch', 'log', 'shipper', 'windows', 'deployment', 'monitor']
description: 'This document outlines the steps to deploy Perch Log Shipper on Windows machines, detailing associated scripts and monitors needed for effective implementation.'
tags: ['deployment', 'windows', 'monitor', 'script', 'software']
draft: false
unlisted: false
---
## Purpose

The goal of this solution is to deploy PerchLogShipper on windows machines.

## Associated Content

### Core Content

| Content                                                                 | Type         | Function                                                                     |
|-------------------------------------------------------------------------|--------------|------------------------------------------------------------------------------|
| [Script - Deploy Perch Log Shipper](https://proval.itglue.com/DOC-5078775-14986108) | Script       | Deploys Perch Log Shipper on Windows machines where it's not already installed |
| [Internal Monitor - Deploy Perch Log Shipper](https://proval.itglue.com/DOC-5078775-14986404) | Internal Monitor | Detects Windows machines missing Perch Log Shipper on them.                  |
| `△ Custom -  Execute Script - Deploy Perch Log Shipper`               | Alert Template | This will execute the [Script - Deploy Perch Log Shipper](https://proval.itglue.com/DOC-5078775-14986108) |

### Other Content

| Content                                                                 | Type           | Function                                                                                           |
|-------------------------------------------------------------------------|----------------|----------------------------------------------------------------------------------------------------|
| [Agnostic Script - Install - PerchLogShipper](https://proval.itglue.com/DOC-5078775-14959900) | Agnostic Script | Agnostic Script used to deploy PerchLogShipper in [SWM - Software Install - Script - Deploy PerchLogShipper](https://proval.itglue.com/DOC-5078775-14986108) script |

## Implementation

Read the associated documents carefully. 

- Import - [Script - Deploy Perch Log Shipper](https://proval.itglue.com/DOC-5078775-14986108) 
- Import - [Internal Monitor - Agents Missing Perch Log Shipper](https://proval.itglue.com/DOC-5078775-14986404) 
- Import - Alert Template - `△ Custom -  Execute Script - Deploy PerchLogShipper`
- Make sure [Script - Deploy Perch Log Shipper](https://proval.itglue.com/DOC-5078775-14986108) script is bonded to the `△ Custom -  Execute Script - Deploy Perch Log Shipper` Alert template.
- Make sure `△ Custom -  Execute Script - Deploy PerchLogShipper` Alert template is being used with [Internal Monitor - Agents Missing Perch Log Shipper](https://proval.itglue.com/DOC-5078775-14986404)
- Right-Click + Run Now to Enable [Internal Monitor - Agents Missing Perch Log Shipper](https://proval.itglue.com/DOC-5078775-14986404) to start deploying Perch Log Shipper on required machines.


