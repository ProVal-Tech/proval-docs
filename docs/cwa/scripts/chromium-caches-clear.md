---
id: '1edcec5e-4e2d-4edf-b670-1bb81643b4e3'
slug: /1edcec5e-4e2d-4edf-b670-1bb81643b4e3
title: 'Chromium Caches - Clear'
title_meta: 'Chromium Caches - Clear'
keywords: ['automate', 'chromium', 'cache', 'configuration', 'script']
description: 'This document provides an overview of the Automate implementation of the agnostic script for clearing the Chromium cache. It includes user parameters, sample run images, and output details for effective software configuration management.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

This is the Automate implementation of the agnostic script [SWM - Software Configuration - Script - Clear-ChromiumCache](/docs/b9e7f45e-b830-44b0-b296-121905ec770f).

## Sample Run

![Sample Run](../../../static/img/docs/1edcec5e-4e2d-4edf-b670-1bb81643b4e3/image_1.webp)

#### User Parameters

| Name   | Example | Required | Description                                                                                                                                                     |
|--------|---------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Force  | 1       | False    | Browser instances will be terminated if the `Force` parameter is set to `1` and they are holding a handle to target cache files.                             |

## Output

- Script log