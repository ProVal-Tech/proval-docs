---
id: '52b6b460-b6bd-48cf-aab1-8484149578f0'
title: 'WiFi Configuration Script'
title_meta: 'WiFi Configuration Script'
keywords: ['wifi', 'configuration', 'ssid', 'profile', 'automation']
description: 'This document provides a detailed overview of a script that applies WiFi configuration for a specified SSID, including dependencies, user parameters, and the process involved. It highlights the time saved by automation and includes a sample run of the script.'
tags: ['networking', 'setup', 'software']
draft: false
unlisted: false
---
## Summary

The script applies the WiFi configuration for the desired SSID.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](../../../static/img/WiFi-Profile---Apply/image_1.png)

## Dependencies

- [WiFi Profile - Get](https://proval.itglue.com/DOC-5078775-8041474)
- @plugin_proval_wifi_profiles (Table)

## Variables

### User Parameters

| Name  | Example | Required | Description                                                                 |
|-------|---------|----------|-----------------------------------------------------------------------------|
| SSID  | MySSID  | True     | This should be the SSID (Service Set Identifier) of the desired WiFi profile.|

## Process

- The script should be used after the WiFi profile has been gathered by running the [WiFi Profile - Get](https://proval.itglue.com/DOC-5078775-8041474) script against a machine with the profile already set up.
- Gets the XML profile from the database based on the ClientID and SSID provided, writes the output to a file, and imports the profile onto the target machine.

## Output

- Script log











