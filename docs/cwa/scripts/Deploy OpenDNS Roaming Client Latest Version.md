---
id: 'cwa-cisco-roaming-client-installation'
title: 'Cisco Roaming Client Installation Script'
title_meta: 'Cisco Roaming Client Installation Script'
keywords: ['cisco', 'roaming', 'client', 'installation', 'update', 'mac', 'windows']
description: 'This document provides a comprehensive guide on a script that queries Cisco for the latest roaming client installation media and installs the software on target mac or windows devices. It includes implementation steps, dependencies, variables, and specific considerations for both operating systems.'
tags: ['installation', 'update', 'windows', 'mac', 'software', 'networking']
draft: false
unlisted: false
---
## Summary

This Script will query Cisco directly to obtain the newest roaming client installation media and install that software, if necessary, on a target mac or windows device.

The script will push an update to the windows device if an out-of-date version is installed. However, for MAC OS it's just a basic installation script.

## Implementation

- Set up the client EDF values as necessary per client.

![Image](../../../static/img/Deploy-OpenDNS-Roaming-Client-Latest-Version/image_1.png)

- Set any location level exclusions here.

![Image](../../../static/img/Deploy-OpenDNS-Roaming-Client-Latest-Version/image_2.png)

- Set any computer level exclusions here.

![Image](../../../static/img/Deploy-OpenDNS-Roaming-Client-Latest-Version/image_3.png)

- Import and run the new script.

![Image](../../../static/img/Deploy-OpenDNS-Roaming-Client-Latest-Version/image_4.png)

## Dependencies

- Cisco must continue to support and update their .Json [file](https://disthost.umbrella.com/roaming/upgrade/win/production/manifest.json)

## Variables

| Name                     | Description                                                                                         |
|--------------------------|-----------------------------------------------------------------------------------------------------|
| MacVersion               | This variable is specific to MacOS devices, it holds the current MacOS Version for the target machine. |
| VersionRequirementMet     | This variable is specific to MacOS devices, it will be true if the current target os version meets the minimum required version, if it does not it will be False. |
| IsVirtual                | This variable will be true if the target machine is a virtual machine, if it's not it will be false. |
| IsARM                    | This variable will be true if the target machine processor architecture is ARM, if it's not it will be false. |
| DotNetRequirementSatisfied | This variable will be true if the minimum .net version of 4.6.2 is met, if it is not, it will be false. |
| opendns_yesno           | This variable is the same variable used by the official solution. It is meant to gather the edf data to verify if the client should have Opendns. |
| OrgID                    | This variable stores the orgID edf value for use in the script.                                   |
| userId                   | This variable stores the userID edf value for use in this script.                                 |
| FingerPrint              | This variable stores the fingerprint edf value for use in this script.                             |
| CurrentAvailableVersion   | This variable stores the current available opendns version.                                       |
| LatestVersionUrl         | This variable stores the current full url to the application download.                             |
| URC_YesNo               | This holds the extradata value for the exclude opendns urc install on the current target machine or location. |
| ServiceloopCounter       | Variable used to loop for a set amount of time looking for the service to start.                  |
| FinishStatus             | This variable is used when checking basic powershell for common powershell issues, ie. incorrect version, missing modules etc. |
| Message                  | Holds the final log message in the event that we finish the install and need to verify.           |



