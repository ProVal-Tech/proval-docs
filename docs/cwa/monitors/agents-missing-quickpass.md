---
id: 'b96aee11-a990-4b23-9ba8-afc420225bac'
slug: /b96aee11-a990-4b23-9ba8-afc420225bac
title: 'Agents Missing QuickPass'
title_meta: 'Agents Missing QuickPass'
keywords: ['quickpass', 'agent', 'installation', 'windows', 'deployment']
description: 'This document provides a comprehensive guide on installing the QuickPass Agent on Windows machines, detailing the necessary prerequisites, parameters, and configuration settings required for a successful installation.'
tags: ['installation', 'security', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-10-27
---

## Summary

Detects machines where `QuickPass Agent (64-bit)` is not installed and deployment is enabled. 

## Dependencies

- [Script - Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198)
- [Solution - QuickPass Deployment](/docs/65d0dbb6-29c1-4242-841c-1da9b92edab6)


## Target

Global

## Alert Template

`△ Custom - Execute Script - Deploy QuickPass Agent`

## Ticket Creation

- Set the `TicketCategory` inside the Alerts of the monitor to allow the script to create ticket.
![Sample Run](../../../static/img/docs/ab838395-dc94-4ceb-986e-99d00b005198/image10.webp)

## Changelog

### 2026-03-06

- Adjusted the monitor to make it constrained and have it shorten by removing unnecessary joins.
- Added the check for the "QuickPass Agent ID" EDFs inside the monitor, if it is missing at the location or client-level then ignore agents.

### 2025-10-27

- Initial version of the document
  


