---
id: '6b829669-89a3-4d68-aec7-c7fba9ad8450'
title: 'Hyper-V VHDX Audit Script'
title_meta: 'Hyper-V VHDX Audit Script for Disk Information Collection'
keywords: ['hyper-v', 'vhdx', 'audit', 'disk', 'information']
description: 'This document provides an overview of a script designed to collect and store information about all VHDX type disks on a Hyper-V server. It details the script process, variables, and output, making it a useful resource for administrators managing Hyper-V environments.'
tags: ['disk', 'hyper-v']
draft: true
unlisted: false
---

## Summary

This script collects information on all VHDX type disks on a Hyper-V server and stores this information in a script state.

## Sample Run

![Sample Run](../../static/img/VHDx-Detail---HyperV/image_1.png)

## Dependencies

[Hyper-V Virtual Harddisk Audit](https://proval.itglue.com/DOC-5078775-10218220)

## Variables

| Name       | Description                               |
|------------|-------------------------------------------|
| vhddetail  | This contains the VHDX information of Hyper-V |

#### Script States

| Name                     | Example                         | Description                                      |
|--------------------------|---------------------------------|--------------------------------------------------|
| HyperV-VhdxAudit@loop@  | HyperV-VhdxAudit1, HyperV-VhdxAudit2... | This contains all VHDX drive information from Hyper-V |

## Process

This script runs only on Hyper-V servers. It collects all VHDX information and stores it in the script state.

## Output

- Script log
- Script state
- Data view
