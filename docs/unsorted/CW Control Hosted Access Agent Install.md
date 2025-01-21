---
id: '74015094-9d3e-49e8-9add-06dfe9c42b5f'
title: 'Install CW Control Agent Using Client Level EDF'
title_meta: 'Install CW Control Agent Using Client Level EDF'
keywords: ['install', 'cw', 'control', 'agent', 'edf', 'client', 'msi']
description: 'This document provides a detailed guide on using client level EDFs to download and install a ConnectWise Control agent on a system. It includes sample runs, dependencies, variables, and the process involved in the installation along with logging output.'
tags: ['connectwise', 'installation']
draft: true
unlisted: false
---

## Summary

This script will use the client level EDFs to download and install a CW Control agent on the system.

## Sample Run

![Sample Run](../../static/img/CW-Control-Hosted-Access-Agent-Install/image_1.png)

## Dependencies

**Client Level EDF**  
![Client Level EDF](../../static/img/CW-Control-Hosted-Access-Agent-Install/image_2.png)

**Agent Level EDF**  
![Agent Level EDF](../../static/img/CW-Control-Hosted-Access-Agent-Install/image_3.png)

## Variables

- `@Hosted_CW_Enabled@` - Client level EDF
- `@Hosted_CW_GUID@` - Client level EDF - contains the CWC GUID
- `@Hosted_CW_URL@` - Direct URL for the CWC MSI installer for the target instance. The URL will be a long string similar to:

[https://your.domain.com/Control/Bin/ConnectWiseControl.ClientSetup.msi?h=your.domain.com&p=8041&k=(long string of alphanumeric characters)&e=Access&y=Guest&t=&c=&c=&c=&c=&c=&c=&c=&c=](https://your.domain.com/Control/Bin/ConnectWiseControl.ClientSetup.msi?h=your.domain.com&p=8041&k=(long string of alphanumeric characters)&e=Access&y=Guest&t=&c=&c=&c=&c=&c=&c=&c=&c=)

You can get this string by pressing the ![button](../../static/img/CW-Control-Hosted-Access-Agent-Install/image_4.png) button and using these settings:

![Settings](../../static/img/CW-Control-Hosted-Access-Agent-Install/image_5.png)

## Process

- Uses the client EDF to download the CW Control install MSI.
- Installs the downloaded MSI.
- Then uses the client EDF to verify that the correct GUID was installed.

## Output

**Script Log**

