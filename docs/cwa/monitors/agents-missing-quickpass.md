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
---

## Summary

Detects machines where `QuickPass Agent (64-bit)` is not installed and deployment is enabled. 

## Dependencies

- [Script - Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198)
- [Solution - QuickPass Deployment](/docs/65d0dbb6-29c1-4242-841c-1da9b92edab6)

## Extra Data Fields

| EDF Name                              | Level    | Type      | Section | Description                                                                                                    |
|---------------------------------------|----------|-----------|----------|------------------------------------------------------------------------------------------------------|
| QuickPass                             | Client   | CheckBox  | QuickPass Deployment | Check it if you would like to enable the client for QuickPass Deployment                                      |
| Exclude from QuickPass Deployment     | Location | CheckBox  | Exclusions | Check it if you would like to exclude a location from QuickPass Deployment                                     |
| Exclude from QuickPass Deployment     | Computer | CheckBox  | Exclusions | Check it if you would like to exclude a computer from QuickPass Deployment                                     |

## Target

Global

## Alert Template

`△ Custom - Execute Script - Deploy QuickPass Agent`
