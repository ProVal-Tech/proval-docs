---
id: 'a1c93182-7219-44d6-b7b9-59be568c1f4c'
slug: /a1c93182-7219-44d6-b7b9-59be568c1f4c
title: 'SmileBack - Get NPS Campaigns'
title_meta: 'SmileBack - Get NPS Campaigns'
keywords: [ 'smileback', 'nps', 'campaigns', 'api', 'workflow' ]
description: 'Workflow to retrieve NPS campaigns from SmileBack.'
tags: [ 'smileback' ]
draft: false
unlisted: false
---

# Summary
This workflow is designed to retrieve NPS (Net Promoter Score) campaigns from SmileBack, a customer feedback platform. It automates the process of fetching NPS campaign data using the SmileBack API, allowing users to easily access and analyze campaign information.

# Usage
The workflow requires an API token to authenticate requests to the SmileBack API. This is done using the [SmileBack - Get Token](/docs/4a926fc2-c329-4873-988d-6d3206add240) workflow which is run as a sub-workflow.

# Returned Data
```json
{
  "data": [
    {
      "id": "string",
      "name": "string"
    }
  ]
}
```