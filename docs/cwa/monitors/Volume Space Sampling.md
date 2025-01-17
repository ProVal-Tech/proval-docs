---
id: '95cbe6d6-162e-47e6-a8c9-33cacc0c73e3'
title: 'Volume Free Space Monitor'
title_meta: 'Volume Free Space Monitor'
keywords: ['monitor', 'volume', 'free', 'space', 'threshold']
description: 'This document describes the Volume Free Space Monitor, which is dynamically generated from the Volume Free Space - Monitor Creation script. It is designed to gather data points for optional regression-based threshold generation, running at an interval of one hour on Windows machines.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---
## Summary

This monitor is dynamically generated from the script [Volume Free Space - Monitor Creation](https://proval.itglue.com/DOC-5078775). It is used to gather data points for the optional regression-based threshold generation. The monitors are generated to have an interval of one hour.

## Details

**Suggested "Limit to"**: N/A  
**Suggested Alert Style**: N/A  
**Suggested Alert Template**: Default - Do Nothing  

This monitor has no properties and will only run the script [Get-VolumeThresholds](https://proval.itglue.com/DOC-5078775-9647494) to generate data points.

## Dependencies

N/A

## Target

Windows Machines - Should be run on all Windows machines












