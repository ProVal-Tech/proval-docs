---
id: 'cwa-webroot-keycode-check'
title: 'Webroot Keycode Check Script'
title_meta: 'Webroot Keycode Check Script for License Verification'
keywords: ['webroot', 'keycode', 'license', 'monitor', 'edf']
description: 'This document outlines a script that collects the machine\'s Webroot hashed keycode and compares it with the keycode set in the client EDF "Webroot Site Keycode". It includes instructions on reviewing results using dataviews or generating tickets for mismatched license keys.'
tags: ['webroot', 'edf', 'monitor', 'license', 'status']
draft: false
unlisted: false
---
## Summary

This script collects the machine's Webroot hashed keycode and matches it with the keycode set up in the client EDF "Webroot Site Keycode". The results of this can be reviewed using the dataview or tickets can be automatically generated for mismatched license keys with the [Internal Monitor - Wrong Webroot KeyCode Detected [EDF]](https://proval.itglue.com/DOC-5078775-14989291) where the ticket category is set.

## Sample Run

![Sample Run](5078775/docs/14989420/images/21699973)

## Dependencies

[SEC - Endpoint Protection - Monitor - Wrong Webroot KeyCode Detected [EDF]](https://proval.itglue.com/DOC-5078775-14989291)

## EDFs

| Name                                   | Level    | Required | Description                                                                                                      |
|----------------------------------------|----------|----------|------------------------------------------------------------------------------------------------------------------|
| Webroot Encrypted KeyCode              | Computer | True     | Stores keycode grabbed from computer                                                                             |
| Webroot KeyCode Status                 | Computer | True     | It stores the keycode's status as either `KeyCode Matched` or `KeyCode Not Matched`                           |
| Webroot Site KeyCode                   | Client   | True     | This stores the site keycode which is available at the portal. Follow the below document on how to get the keycode: [Webroot Site KeyCode](https://proval.itglue.com/DOC-5078775-14989313) |

## Output

- Script log
- EDF
- Dataview

