---
id: 'bc1c7f2d-8eb4-41a3-bb12-8150cdeb0241'
slug: /bc1c7f2d-8eb4-41a3-bb12-8150cdeb0241
title: 'cPVAL Senteon Installed'
title_meta: 'cPVAL Senteon Installed'
keywords: ['senteon', 'agent', 'installation', 'status', 'endpoint']
description: 'This document provides details on the custom field used to determine if the Senteon Agent is installed on an endpoint. It includes associated content, custom field names, types, and expected output values for the agent status.'
tags: ['installation', 'software']
draft: false
unlisted: false
---

## Summary

This custom field is used to determine if the Senteon Agent is installed on the endpoint.

## Associated Content

[SWM - Software Management - Solution - Senteon Agent](/docs/5cc5165d-4314-499b-9357-299f3b04f402)

## Details

| Custom Field Name           | Custom Field Type | Description                                                  |
|-----------------------------|-------------------|--------------------------------------------------------------|
| cPVAL Senteon Installed     | String            | Displays the status of the Senteon agent on the endpoint.   |

## Output

| Custom Field Value | Description                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------|
| Installed          | The expected value when the application is detected and the service is running.                |
| Not_Running        | The expected value when the application was detected on the endpoint but the service was not running. |
| Not_Present        | The expected value when the application is not detected.                                      |


