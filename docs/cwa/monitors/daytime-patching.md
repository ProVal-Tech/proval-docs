---
id: '48293fc2-4e2f-4c1e-ae3d-b35c28583654'
slug: /48293fc2-4e2f-4c1e-ae3d-b35c28583654
title: 'Daytime Patching'
title_meta: 'Daytime Patching'
keywords: ['monitor', 'patching', 'detection', 'computers', 'installation']
description: 'This document provides an overview of the internal monitor that detects computers with daytime patching enabled and identifies available patches for installation. It includes dependencies, target scope, and alert template details.'
tags: ['patching', 'software']
draft: false
unlisted: false
last_update:
  date: 2025-05-09
---

## Summary

The internal monitor detects computers where daytime patching is enabled and one or more patches are available for installation.

## Dependencies

[EPM - Windows Configuration - Script - Install All Approved Patches [With Prompt]](/docs/f2a3feba-fc4b-4693-ba31-6b50f66bac15)

## Target

Global

## Alert Template

`△ Custom - Execute Script - Install All Approved Patches [With Prompt]`

## Changelog

### 2025-04-10

- Initial version of the document
