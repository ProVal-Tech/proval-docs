---
id: 'cwa-bitlocker-key-monitor'
title: 'Bitlocker Key Monitoring for Windows Agents'
title_meta: 'Bitlocker Key Monitoring for Windows Agents'
keywords: ['bitlocker', 'monitoring', 'windows', 'encryption', 'security']
description: 'This document outlines a monitor designed to track Windows agents with Bitlocker enabled, specifically focusing on those where key data has not been gathered for over 30 days. It includes dependencies for script execution and custom table integration for effective key retrieval.'
tags: ['encryption', 'security', 'windows', 'monitoring']
draft: false
unlisted: false
---
## Summary

This monitor will look for agents where Bitlocker is enabled and data about the keys has not been gathered for 30 days.

## Dependencies

[SEC - Encryption - Script - Bitlocker - Key Retrieval](https://proval.itglue.com/DOC-5078775-8009806)  
This script should be run as an autofix.  

[SEC - Encryption - Custom Table - plugin_proval_bitlocker](https://proval.itglue.com/DOC-5078775-8038616)  

## Target

Windows Machine




