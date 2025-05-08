---
id: '49b92505-90cb-4c10-9d25-6ec311341f65'
slug: /49b92505-90cb-4c10-9d25-6ec311341f65
title: 'LanSweeper - Install'
title_meta: 'LanSweeper - Install'
keywords: ['lansweeper', 'agent', 'installation', 'scanning', 'server']
description: 'This document provides a detailed guide on how to install the LanSweeper agent, including dependencies, user parameters, and expected output. The installation process is outlined with examples and links to additional resources for successful deployment.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

Installs the LanSweeper agent.  
[Download LanSweeper Agent](https://www.lansweeper.com/download/lsagent/)

## Sample Run

![Sample Run](../../../static/img/docs/49b92505-90cb-4c10-9d25-6ec311341f65/image_1.webp)

## Dependencies

[Download LanSweeper Agent](https://www.lansweeper.com/download/lsagent/)

#### User Parameters

| Name            | Example                     | Required | Description                                           |
|-----------------|-----------------------------|----------|-------------------------------------------------------|
| ScanningServer   | FQDN, NetBIOS, or IP       | False    | The FQDN, NetBIOS, or IP of the scanning server      |
| ListeningPort    | 9524                        | False    | Listening port configured for the scanning server     |
| RelayAuthKey     | Key                         | False    | Cloud Relay Authentication Key                         |

## Process

[Silently Installing LanSweeper Agent](https://www.lansweeper.com/knowledgebase/silently-installing-lsagent-on-a-windows-linux-or-mac-computer/)  
The installation depends on three parameters to complete successfully:  
![Process Image](../../../static/img/docs/49b92505-90cb-4c10-9d25-6ec311341f65/image_2.webp)  

Once the values are provided during script execution, the LsAgent will be successfully installed.

## Output

- Script log
