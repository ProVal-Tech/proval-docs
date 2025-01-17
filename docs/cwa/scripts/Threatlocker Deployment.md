---
id: '0298665b-0c3d-41de-83ee-bbf3b9d5cd8e'
title: 'Install ThreatLocker Application'
title_meta: 'Install ThreatLocker Application for Windows and Mac'
keywords: ['threatlocker', 'installation', 'windows', 'mac', 'groupkey']
description: 'This document provides a comprehensive guide on installing the ThreatLocker application on both Windows and Mac operating systems, including necessary group key information and global parameters required for the installation.'
tags: ['installation', 'security', 'software', 'windows']
draft: false
unlisted: false
---
## Summary

This script will install the ThreatLocker application on both Windows and Mac operating systems.

## Sample Run

You will need to enter your ThreatLocker group key here for Windows operating systems  
![Image](../../../static/img/Threatlocker-Deployment/image_1.png)

For Mac deployment, you will need to follow the following steps:

- Follow the instructions to get the group key for the desired machine. [MAC Agent Group Key Location | ThreatLocker Help Center (kb.help)](https://threatlocker.kb.help/mac-agent-group-key-location/)
- Copy that group key and set this EDF for the client  

![Image](../../../static/img/Threatlocker-Deployment/image_2.png)

Then run the script  
![Image](../../../static/img/Threatlocker-Deployment/image_3.png)

#### Global Parameters

| Name                     | Example                          | Required | Description                              |
|--------------------------|----------------------------------|----------|------------------------------------------|
| ThreatLockerAuthKey      | gfjhdsiopghg-nfdo;hgdf-jdskfl; | True     | The assigned ThreatLocker authorization key. |

## Output

- Script log











