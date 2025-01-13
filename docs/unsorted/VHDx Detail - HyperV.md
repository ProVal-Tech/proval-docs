---
id: 'vsa-hyperv-vhdx-audit'
title: 'Hyper-V VHDX Audit Script'
title_meta: 'Hyper-V VHDX Audit Script for Disk Information Collection'
keywords: ['hyper-v', 'vhdx', 'audit', 'disk', 'information']
description: 'This document provides an overview of a script designed to collect and store information about all vhdx type disks on a Hyper-V server. It details the script's process, variables, and output, making it a useful resource for administrators managing Hyper-V environments.'
tags: ['hyper-v', 'disk', 'audit', 'information', 'script', 'server']
draft: true
unlisted: true
---
## Summary

This script collects information on all vhdx type disk on a Hyper-V server, and stores this information to a scriptstate.

## Sample Run

![Sample Run](..\..\static\img\VHDx-Detail---HyperV\image_1.png)

## Dependencies

[HyperV Virtual Harddisk Audit](https://proval.itglue.com/DOC-5078775-10218220)

## Variables

| Name       | Description                               |
|------------|-------------------------------------------|
| vhddetail  | This contains the vhdx information of Hyper-V |

#### Script States

| Name                     | Example                         | Description                                      |
|--------------------------|---------------------------------|--------------------------------------------------|
| HyperV-VhdxAudit@loop@  | HyperV-VhdxAudit1,HyperV-VhdxAudit2.. | This contains the HyperV all vhdx drive information |

## Process

This script runs only on Hyper-V servers. It collects all vhdx information and stores it in the script state.

## Output

- Script log
- Script state
- Dataview



