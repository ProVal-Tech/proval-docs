---
id: '80410725-55db-498c-8079-8340d4b86aa4'
slug: /80410725-55db-498c-8079-8340d4b86aa4
title: 'SmileBack - Get Recent Reviews'
title_meta: 'SmileBack - Get Recent Reviews'
keywords: [ 'smileback', 'reviews', 'recent', 'api', 'workflow' ]
description: 'Workflow to retrieve recent customer reviews from SmileBack.'
tags: [ 'smileback' ]
draft: false
unlisted: false
---

# Summary
This workflow is designed to retrieve recent customer reviews from SmileBack, a customer feedback platform. It automates the process of fetching the latest reviews using the SmileBack API, allowing users to easily access and analyze recent customer feedback for their services or products.

# Usage
The workflow requires an API token to authenticate requests to the SmileBack API. This is done using the [SmileBack - Get Token](/docs/4a926fc2-c329-4873-988d-6d3206add240) workflow which is run as a sub-workflow.

# Returned Data
```json
{
  "data": [
    {
      "id": 0,
      "rating": "string",
      "comment": "string",
      "ticket": {
        "id": "string",
        "title": "string",
        "segment": {
          "id": "string",
          "name": "string"
        },
        "agents": [
          "string"
        ],
        "closed_on": "2025-11-05T14:04:10.135Z"
      },
      "contact": {
        "id": "string",
        "name": "string",
        "email": "string"
      },
      "company": {
        "id": "string",
        "name": "string",
        "territory_name": "string",
        "territory_remote_id": "string",
        "market_name": "string",
        "market_remote_id": "string"
      },
      "status": "open",
      "tags": [
        "string"
      ],
      "has_marketing_permission": true,
      "viewed_on": "2025-11-05T14:04:10.135Z",
      "rated_on": "2025-11-05T14:04:10.135Z",
      "permalink": "string",
      "last_modified": "2025-11-05T14:04:10.135Z"
    }
  ]
}
  ```