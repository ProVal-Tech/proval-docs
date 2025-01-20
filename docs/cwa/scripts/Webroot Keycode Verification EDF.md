---
id: '2e7517b7-3d3c-47b0-a885-bb8293c55263'
title: 'Webroot Keycode Check Script'
title_meta: 'Webroot Keycode Check Script for License Verification'
keywords: ['webroot', 'keycode', 'license', 'monitor', 'edf']
description: 'This document outlines a script that collects the machine-level Webroot hashed keycode and compares it with the keycode set in the client EDF "Webroot Site Keycode". It includes instructions on reviewing results using dataviews or generating tickets for mismatched license keys.'
tags: ['webroot']
draft: false
unlisted: false
---
## Summary

This script collects the machine's Webroot hashed keycode and matches it with the keycode set up in the client EDF "Webroot Site Keycode". The results of this can be reviewed using the dataview or tickets can be automatically generated for mismatched license keys with the [Internal Monitor - Wrong Webroot KeyCode Detected [EDF]](https://proval.itglue.com/DOC-5078775-14989291) where the ticket category is set.

## Sample Run

![Sample Run](../../../static/img/Webroot-Keycode-Verification-EDF/image_2.png)

## Dependencies

[SEC - Endpoint Protection - Monitor - Wrong Webroot KeyCode Detected [EDF]](https://proval.itglue.com/DOC-5078775-14989291)

## EDFs

| Name                                   | Level    | Required | Description                                                                                                      |
|----------------------------------------|----------|----------|------------------------------------------------------------------------------------------------------------------|
| Webroot Encrypted KeyCode              | Computer | True     | Stores keycode grabbed from computer                                                                             |
| Webroot KeyCode Status                 | Computer | True     | It stores the keycode's status as either `KeyCode Matched` or `KeyCode Not Matched`                           |
| Webroot Site KeyCode                   | Client   | True     | This stores the site keycode which is available at the portal. Follow the below document on how to get the keycode: [Webroot Site KeyCode](<./Webroot Site KeyCode.md>) |

## Output

- Script log
- EDF
- Dataview












