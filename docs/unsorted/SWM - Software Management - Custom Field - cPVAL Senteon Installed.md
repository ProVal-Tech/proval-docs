---
id: 'cwa-senteon-agent-status'
title: 'Senteon Agent Installation Status'
title_meta: 'Senteon Agent Installation Status'
keywords: ['senteon', 'agent', 'installation', 'status', 'endpoint']
description: 'This document provides details on the custom field used to determine if the Senteon Agent is installed on an endpoint. It includes associated content, custom field names, types, and expected output values for the agent status.'
tags: ['custom-field', 'software', 'status', 'installation', 'endpoint']
draft: true
unlisted: true
---
## Summary

This custom field is used to determine if the Senteon Agent is installed on the endpoint or not.

## Associated Content

[SWM - Software Management - Solution - Senteon Agent](https://proval.itglue.com/DOC-5078775-16541168)

## Details

| Custom Field Name           | Custom Field Type | Description                                                  |
|-----------------------------|-------------------|--------------------------------------------------------------|
| cPVAL Senteon Installed     | String            | Displays the status of the Senteon agent on the endpoint.   |

## Output

| Custom Field Value | Description                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------|
| Installed          | The expected value when the application is detected and the service is running.                |
| Not_Running        | The expected value when the application was detected on the endpoint but the service was running.|
| Not_Present        | The expected value when the application is not detected.                                      |




