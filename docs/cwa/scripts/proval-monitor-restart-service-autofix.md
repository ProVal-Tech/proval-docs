---
id: '30356d75-6212-4a23-b373-d08aa8f548e0'
slug: /30356d75-6212-4a23-b373-d08aa8f548e0
title: 'ProVal - Monitor Restart Service Autofix'
title_meta: 'ProVal - Monitor Restart Service Autofix'
keywords: ['service', 'restart', 'autofix', 'monitor', 'labtech']
description: 'This document describes a script designed to be executed by the "~Autofix Kill stuck service and restart" alert template. It attempts to restart a failed service, and if that fails, it kills the service and tries to start it again using various commands. The script requires a parameter for the service name and is intended for use in auto-fix scenarios within Service Monitors.'
tags: []
draft: false
unlisted: false
---

## Summary

This script is intended to be called by the "~Autofix Kill stuck service and restart" alert template. When run, the script will attempt to restart the failed service. If the attempt to restart the service is successful, the script will exit. However, if the first attempt fails, it will attempt to kill the service first and then try to start the service using the default Labtech Command as well as shell commands. The script requires an input parameter named `@fieldname@` containing the name of the service to be restarted.

**Time Saved by Automation:** 5 Minutes

## Sample Run

This script is intended to run only as an auto-fix script, as the `@fieldname@` will be passed by the monitor.

## Dependencies

Should be run as an auto-fix script on the Service Monitors.

## Variables

| **Variable Name**               | **Description**                                             |
|----------------------------------|-----------------------------------------------------------|
| DisableAutofixes                 | This variable stores the EDF (Disable Autofixes) value.   |
| DisableRestartService            | This variable stores the EDF (Disable Autofix Restart Services) value. |

## Process

This script is intended to be called by the "~Autofix Kill stuck service and restart" alert template. When run, the script will attempt to restart the failed service. If the attempt to restart the service is successful, the script will exit. However, if the first attempt fails, it will attempt to kill the service first and then try to start the service using the default Labtech Command as well as shell commands. The script requires an input parameter named `@fieldname@` containing the name of the service to be restarted.

## Output

- Script log
