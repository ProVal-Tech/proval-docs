---
id: '14ecb842-00fc-40c3-a2b4-01a8939e38c5'
slug: /14ecb842-00fc-40c3-a2b4-01a8939e38c5
title: 'Stale Bitlocker Data'
title_meta: 'Stale Bitlocker Data'
keywords: ['bitlocker', 'monitoring', 'windows', 'encryption', 'security']
description: 'This document outlines a monitor designed to track Windows agents with Bitlocker enabled, specifically focusing on those where key data has not been gathered for over 30 days. It includes dependencies for script execution and custom table integration for effective key retrieval.'
tags: ['encryption', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor will look for agents where Bitlocker is enabled and data about the keys has not been gathered for 30 days.

## Dependencies

[SEC - Encryption - Script - Bitlocker - Key Retrieval](/docs/bc22877d-262a-47f7-8d2f-7e69f07c92e5)  
This script should be run as an autofix.  

[SEC - Encryption - Custom Table - plugin_proval_bitlocker](/docs/dfddb88b-37c2-4d42-b8a0-bb7ebe4da6d0)  

## Target

Windows Machine
