---
id: '74015094-9d3e-49e8-9add-06dfe9c42b5f'
slug: /74015094-9d3e-49e8-9add-06dfe9c42b5f
title: 'CW Control Hosted Access Agent Install'
title_meta: 'CW Control Hosted Access Agent Install'
keywords: ['install', 'cw', 'control', 'agent', 'edf', 'client', 'msi']
description: 'This document provides a detailed guide on using client level EDFs to download and install a ConnectWise Control agent on a system. It includes sample runs, dependencies, variables, and the process involved in the installation along with logging output.'
tags: ['connectwise', 'installation']
draft: false
unlisted: false
---

## Summary

This script will use the client level EDFs to download and install a CW Control agent on the system.

## Sample Run

![Sample Run](../../../static/img/docs/74015094-9d3e-49e8-9add-06dfe9c42b5f/image_1.webp)

## Dependencies

**Client Level EDF**  
![Client Level EDF](../../../static/img/docs/74015094-9d3e-49e8-9add-06dfe9c42b5f/image_2.webp)

**Agent Level EDF**  
![Agent Level EDF](../../../static/img/docs/74015094-9d3e-49e8-9add-06dfe9c42b5f/image_3.webp)

## Variables

- `@Hosted_CW_Enabled@` - Client level EDF
- `@Hosted_CW_GUID@` - Client level EDF - contains the CWC GUID
- `@Hosted_CW_URL@` - Direct URL for the CWC MSI installer for the target instance. The URL will be a long string similar to:

[https://your.domain.com/Control/Bin/ConnectWiseControl.ClientSetup.msi?h=your.domain.com&p=8041&k=(long string of alphanumeric characters)&e=Access&y=Guest&t=&c=&c=&c=&c=&c=&c=&c=&c=](https://your.domain.com/Control/Bin/ConnectWiseControl.ClientSetup.msi?h=your.domain.com&p=8041&k=(long string of alphanumeric characters)&e=Access&y=Guest&t=&c=&c=&c=&c=&c=&c=&c=&c=)

You can get this string by pressing the ![button](../../../static/img/docs/74015094-9d3e-49e8-9add-06dfe9c42b5f/image_4.webp) button and using these settings:

![Settings](../../../static/img/docs/74015094-9d3e-49e8-9add-06dfe9c42b5f/image_5.webp)

## Process

- Uses the client EDF to download the CW Control install MSI.
- Installs the downloaded MSI.
- Then uses the client EDF to verify that the correct GUID was installed.

## Output

**Script Log**