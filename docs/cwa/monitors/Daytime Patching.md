---
id: 'cwa-internal-monitor-detects-patching'
title: 'Internal Monitor for Daytime Patching'
title_meta: 'Internal Monitor for Daytime Patching'
keywords: ['monitor', 'patching', 'detection', 'computers', 'installation']
description: 'This document provides an overview of the internal monitor that detects computers with daytime patching enabled and identifies available patches for installation. It includes dependencies, target scope, and alert template details.'
tags: ['alert', 'configuration', 'patching', 'detection', 'software']
draft: false
unlisted: false
---
## Summary

The internal monitor detects computers where daytime patching is enabled and one or more patches are available for installation.

## Dependencies

[EPM - Windows Configuration - Script - Install All Approved Patches [With Prompt]](https://proval.itglue.com/DOC-5078775-11257931)

## Target

Global

## Alert Template

`△ Custom - Execute Script - Install All Approved Patches [With Prompt]`



