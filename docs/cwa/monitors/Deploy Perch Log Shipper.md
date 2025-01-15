---
id: 'bc410117-b7b7-4345-967c-965f15acdf07'
title: 'Deploy Perch Log Shipper Monitor'
title_meta: 'Deploy Perch Log Shipper Monitor for Windows Machines'
keywords: ['monitor', 'perch', 'log', 'shipper', 'deployment', 'windows']
description: 'This document outlines a monitor designed to detect Windows machines that are missing the Perch Log Shipper. It details the necessary client-level EDF settings required to initiate the installation on targeted machines, including the deployment and installation codes needed for successful implementation.'
tags: ['deployment', 'edf', 'windows', 'software', 'monitoring']
draft: false
unlisted: false
---
## Summary

This Monitor detects Windows machines missing Perch Log Shipper on them. To initiate the installation on targeted client machines, the client-level EDF `Deploy Perch Log Shipper` must be checked and client-level EDF `Perch Client Install Code` or location-level EDF `Perch Location Install Code` must be populated with installation code at the client level.

## Dependencies

- [SWM - Software Install - Script - Deploy PerchLogShipper](https://proval.itglue.com/DOC-5078775-14986108)  
- Client-Level EDF's to select Perch Log Shipper Deployment and to populate the installation token  
  ![image](../../../static/img/Deploy-Perch-Log-Shipper/image_1.png)  
-   
- Location-level EDF to Exclude a Location from Perch Log Shipper Deployment and to populate the installation token  
  ![image](../../../static/img/Deploy-Perch-Log-Shipper/image_2.png)  
- Computer-level EDF to Exclude a computer from Perch Log Shipper Deployment  
  ![image](../../../static/img/Deploy-Perch-Log-Shipper/image_3.png)  

## Target

Windows Machines

## Alert Template

- `△ Custom -  Execute Script - Deploy PerchLogShipper`






