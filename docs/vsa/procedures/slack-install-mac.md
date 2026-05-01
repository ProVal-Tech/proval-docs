---
id: '4fc95e6d-95b1-4c83-a5b2-c181dca0c2ee'
slug: /4fc95e6d-95b1-4c83-a5b2-c181dca0c2ee
title: 'Slack Install MAC'
title_meta: 'Slack Install MAC'
keywords: ['slack', 'installation', 'software' ]
description: 'This script is used to check the status of the slack on the mac machine and  if its not available, then it will install it on the mac machine and will validate after the installation.'
tags: ['installation', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-05-01
---

## Summary

This script is used to check the status of the slack application on the mac machine and  if its not available, then it will install it on the mac machine and will validate after the installation.

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.  
Name: `Slack Install MAC`
![Image 1](../../../static/img/docs/4fc95e6d-95b1-4c83-a5b2-c181dca0c2ee/1.webp)   
The export will download the necessary XML file.

2. Import this XML file into the partner's VSA RMM instance.  
![Image 2](../../../static/img/docs/4fc95e6d-95b1-4c83-a5b2-c181dca0c2ee/2.webp)

3. To `Execute`, select the agent procedure and click on run now and then submit.
![Image 3](../../../static/img/docs/4fc95e6d-95b1-4c83-a5b2-c181dca0c2ee/3.webp)

## Output

- Agent Procedure Log

## Changelog

### 2026-05-01

- Initial version of the document