---
id: 'b22f954e-6a02-46f4-81d3-3f5d18d4991c'
slug: /b22f954e-6a02-46f4-81d3-3f5d18d4991c
title: 'ProVal - Production - Install Windows Apps'
title_meta: 'ProVal - Production - Install Windows Apps'
keywords: ['windows', 'application', 'windows app']
description: 'This monitor is built to install the Windows App on the computers where the deployment EDFs are checked.'
tags: ['windows', 'application', 'software']
draft: false
unlisted: false
---

## Summary

This monitor is built to install the Windows App on the computers where the deployment EDFs are checked.
It is recommended to set this monitor alert frequency at every 30 days.

## Dependencies

- [Script - Install Windows App](/docs/dd28b731-7fbc-4345-8d0b-6875df1d5658)
- Alert Template `△ Custom - Execute Script - Install Windows App`
- [Solution - Install Windows App](/docs/0d8c4619-b666-44ec-93b1-2d00e4632865)

## Target

- Windows OS

## Implementation

- Import the [Script - Install Windows App](/docs/dd28b731-7fbc-4345-8d0b-6875df1d5658) 
- Import the monitor
- Import the Alert Template `△ Custom - Execute Script - Install Windows App`
- Apply the alert template to the monitor.
- Run now and reset the monitor  
  ![Sample Run](../../../static/img/docs/e076294e-fe39-44be-9e03-d620431744a3/image6.webp)
- Enable the EDFs to start deployment.