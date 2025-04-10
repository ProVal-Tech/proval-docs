---
id: '0b20cd24-d35c-47c9-a35d-cd1f2a5ac2e8'
slug: /0b20cd24-d35c-47c9-a35d-cd1f2a5ac2e8
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
| [Script - Deploy Perch Log Shipper](/docs/6587bacd-7587-466e-b31d-7291cf11a401) | Script         | Deploys Perch Log Shipper on Windows machines where it's not already installed |
| [Internal Monitor - Deploy Perch Log Shipper](/docs/bc410117-b7b7-4345-967c-965f15acdf07) | Internal Monitor | Detects Windows machines missing Perch Log Shipper.                          |
| `△ Custom - Execute Script - Deploy Perch Log Shipper`               | Alert Template  | This will execute the [Script - Deploy Perch Log Shipper](/docs/6587bacd-7587-466e-b31d-7291cf11a401) |

### Other Content

| Content                                                                 | Type           | Function                                                                                           |
|-------------------------------------------------------------------------|----------------|----------------------------------------------------------------------------------------------------|
| [Agnostic Script - Install - Perch Log Shipper](/docs/41fd7a2b-4604-4ef1-bd74-c7a4325da37e) | Agnostic Script | Agnostic Script used to deploy Perch Log Shipper in [SWM - Software Install - Script - Deploy Perch Log Shipper](/docs/6587bacd-7587-466e-b31d-7291cf11a401) script |

## Implementation

Read the associated documents carefully.

- Import - [Script - Deploy Perch Log Shipper](/docs/6587bacd-7587-466e-b31d-7291cf11a401)
- Import - [Internal Monitor - Agents Missing Perch Log Shipper](/docs/bc410117-b7b7-4345-967c-965f15acdf07)
- Import - Alert Template - `△ Custom - Execute Script - Deploy Perch Log Shipper`
- Ensure the [Script - Deploy Perch Log Shipper](/docs/6587bacd-7587-466e-b31d-7291cf11a401) script is bonded to the `△ Custom - Execute Script - Deploy Perch Log Shipper` Alert Template.
- Ensure the `△ Custom - Execute Script - Deploy Perch Log Shipper` Alert Template is being used with [Internal Monitor - Agents Missing Perch Log Shipper](/docs/bc410117-b7b7-4345-967c-965f15acdf07).
- Right-click and select "Run Now" to enable [Internal Monitor - Agents Missing Perch Log Shipper](/docs/bc410117-b7b7-4345-967c-965f15acdf07) to start deploying Perch Log Shipper on the required machines.



