---
id: 'bc410117-b7b7-4345-967c-965f15acdf07'
title: 'Deploy Perch Log Shipper'
title_meta: 'Deploy Perch Log Shipper'
keywords: ['monitor', 'perch', 'log', 'shipper', 'deployment', 'windows']
description: 'This document outlines a monitor designed to detect Windows machines that are missing the Perch Log Shipper. It details the necessary client-level EDF settings required to initiate the installation on targeted machines, including the deployment and installation codes needed for successful implementation.'
tags: ['deployment', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor detects Windows machines that are missing the Perch Log Shipper. To initiate the installation on targeted client machines, the client-level EDF `Deploy Perch Log Shipper` must be checked, and either the client-level EDF `Perch Client Install Code` or the location-level EDF `Perch Location Install Code` must be populated with the installation code at the client level.

## Dependencies

- [SWM - Software Install - Script - Deploy Perch Log Shipper](<../scripts/Deploy Perch Log Shipper.md>)  
- Client-Level EDFs to select Perch Log Shipper Deployment and to populate the installation token  
  ![image](../../../static/img/Deploy-Perch-Log-Shipper/image_1.png)  
- Location-level EDF to exclude a location from Perch Log Shipper Deployment and to populate the installation token  
  ![image](../../../static/img/Deploy-Perch-Log-Shipper/image_2.png)  
- Computer-level EDF to exclude a computer from Perch Log Shipper Deployment  
  ![image](../../../static/img/Deploy-Perch-Log-Shipper/image_3.png)  

## Target

Windows Machines

## Alert Template

- `△ Custom - Execute Script - Deploy Perch Log Shipper`




