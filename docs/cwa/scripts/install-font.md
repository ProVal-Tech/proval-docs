---
id: 'c16a83d6-7845-4478-9b25-c4947aac8f5d'
slug: /c16a83d6-7845-4478-9b25-c4947aac8f5d
title: 'Install-Font'
title_meta: 'Install-Font'
keywords: ['font', 'installation', 'script', 'zip', 'extract']
description: 'This document outlines a wrapper script designed for installing fonts using an agnostic software installation method. It includes steps for preparing font files, running the script, and verifying the installation process.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script is a wrapper to install fonts using the agnostic [SWM - Software Install - Agnostic - Script - Install-Font](/docs/2520190e-2751-45f1-8d60-501027004938).

## Sample Run

- As a first step, please gather all desired font files and create a zip file containing those items.
- Place this file in the LTShare in the Transfer/FontFiles folder (create this folder if necessary) named `[ZipFileName].zip`.
- Import this script into the environment and run it against the desired targets.
- Set the `ZipFileName` to the zip file name you created, minus the `.zip`.

![Sample Run Image](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_1.webp)

## Dependencies

- [SWM - Software Install - Agnostic - Script - Install-Font](/docs/2520190e-2751-45f1-8d60-501027004938)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name        | Description                             |
|-------------|-----------------------------------------|
| Fontocation | Designated as `%windir%/Temp/Font`    |

#### User Parameters

| Name        | Example                                        | Required | Description                                                 |
|-------------|------------------------------------------------|----------|-------------------------------------------------------------|
| ZipFileName | The name of the zip file stored in the LTShare | True     | This is the name of the .zip file you created, minus the `.zip` |

## Process

1. Download the font .zip file to the endpoint.
2. Extract the file.
3. Verify the file was extracted.
4. Run the agnostic script.

## Output

- Script log