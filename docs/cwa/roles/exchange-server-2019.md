---
id: '0dd8faef-185c-4bb7-a0cf-27fff2f0838a'
slug: /0dd8faef-185c-4bb7-a0cf-27fff2f0838a
title: 'Exchange Server 2019'
title_meta: 'Exchange Server 2019'
keywords: ['exchange', 'server', 'detection', 'installation', 'windows']
description: 'This document outlines the detection method for verifying if Exchange Server 2019 is installed on a Windows system. It includes the detection string, comparator, result, and applicable operating system for accurate identification.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes the method to detect if Exchange Server 2019 is installed.

## Settings

| Detection String                                                                                                                                         | Comparator | Result | Applicable OS |
|---------------------------------------------------------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| \{%_and|\{%_eq|\{%-HKLM//Software//Microsoft//ExchangeServer//v15//Setup:MsiProductMajor-%}|15_%}|\{%_eq|\{%-HKLM//Software//Microsoft//ExchangeServer//v15//Setup:MsiProductMinor-%}|2_%}_%} | Equals     | 1      | Windows        |


