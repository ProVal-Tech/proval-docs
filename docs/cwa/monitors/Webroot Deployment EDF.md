---
id: 'af1a3bc3-874e-41b8-ae7f-d1b11bb664cc'
title: 'Webroot Deployment EDF'
title_meta: 'Webroot Deployment EDF'
keywords: ['monitor', 'webroot', 'deployment', 'agent', 'edf']
description: 'This document outlines a monitor that checks for the online status of agents where the client EDF "Enable Webroot Deployment" is enabled, the "Exclude Webroot Deployment" location/computer EDF is set to false, and the agent is missing Webroot. It also includes dependencies and target specifications for effective monitoring.'
tags: ['webroot']
draft: false
unlisted: false
---

## Summary

This monitor checks the online status of agents where the client EDF "Enable Webroot Deployment" is enabled, the "Exclude Webroot Deployment" location/computer EDF is set to false, and the agent is missing Webroot.

## Dependencies

[EPM - Data Collection - Script - Install Webroot SecureAnywhere [EDF]](<../scripts/Install Webroot SecureAnywhere Autofix, EDF.md>)

- EDFs:
  - Enable Webroot Deployment - Client EDF
  - Exclude Webroot Deployment - Location EDF
  - Exclude Webroot Deployment - Computer EDF

## Target

- Global



