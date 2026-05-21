---
id: '4fc95e6d-95b1-4c83-a5b2-c181dca0c2ee'
slug: /4fc95e6d-95b1-4c83-a5b2-c181dca0c2ee
title: 'Slack Install - macOS'
title_meta: 'Slack Install - macOS'
keywords: ['slack', 'installation', 'software' ]
description: 'This script verifies whether the Slack application is installed on a Mac. If Slack is missing, it automatically downloads and installs it, then confirms that the installation was completed successfully.'
tags: ['installation', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-05-20
---

## Summary

This script verifies whether the Slack application is installed on a Mac. If Slack is missing, it automatically downloads and installs it, then confirms that the installation was completed successfully.

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.  
Name: `Slack Install - macOS`  
![Image 1](../../../static/img/docs/4fc95e6d-95b1-4c83-a5b2-c181dca0c2ee/1.webp)   
The export will download the necessary XML file.

2. Import this XML file into the partner's VSA RMM instance.  
![Image 2](../../../static/img/docs/4fc95e6d-95b1-4c83-a5b2-c181dca0c2ee/2.webp)

3. To `Execute`, select the agent procedure and click on run now and then submit.
![Image 3](../../../static/img/docs/4fc95e6d-95b1-4c83-a5b2-c181dca0c2ee/3.webp)

## Output

- Agent Procedure Log

## Changelog

### 2026-05-20

- Initial version of the document