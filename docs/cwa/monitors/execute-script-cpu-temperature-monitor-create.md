---
id: 'd1cd1622-27ec-4bbd-9297-1b4b7b2d65b2'
slug: /d1cd1622-27ec-4bbd-9297-1b4b7b2d65b2
title: 'Execute Script - CPU Temperature Monitor - Create'
title_meta: 'Execute Script - CPU Temperature Monitor - Create'
keywords: ['cpu', 'temperature', 'monitor', 'windows', 'sensors']
description: 'This document provides a detailed overview of setting up a CPU Temperature Monitor on Windows machines using the EPM - Sensors - Script - CPU Temperature Monitor - Create script. It explains how to enable or disable monitoring through system properties and EDFs, along with the necessary alert template configurations.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The monitor set runs the [EPM - Sensors - Script - CPU Temperature Monitor - Create](/docs/7519f655-224b-4c95-b716-773f59cb7314) script once a week on Windows machines where CPU temperature monitoring is enabled. Monitoring can be turned on or off using the system properties and the EDFs, as explained in the [script’s](/docs/7519f655-224b-4c95-b716-773f59cb7314) documentation.

## Dependencies

[EPM - Sensors - Script - CPU Temperature Monitor - Create](/docs/7519f655-224b-4c95-b716-773f59cb7314)

## Target

Global

## Alert Template

**Name:** △ CUSTOM - Execute Script - CPU Temperature Monitor - Create

**The alert template should run the** [EPM - Sensors - Script - CPU Temperature Monitor - Create](/docs/7519f655-224b-4c95-b716-773f59cb7314) **script for `Error`.**

![Image 1](../../../static/img/docs/d1cd1622-27ec-4bbd-9297-1b4b7b2d65b2/image_1.webp)  
![Image 2](../../../static/img/docs/d1cd1622-27ec-4bbd-9297-1b4b7b2d65b2/image_2.webp)