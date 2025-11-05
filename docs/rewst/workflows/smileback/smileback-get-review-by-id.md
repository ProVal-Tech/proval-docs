---
id: '952cc4aa-ba40-4457-982e-56f4bb5f0dc4'
slug: /952cc4aa-ba40-4457-982e-56f4bb5f0dc4
title: 'SmileBack - Get Review By ID'
title_meta: 'SmileBack - Get Review By ID'
keywords: [ 'smileback' ]
description: 'Workflow to get a review by its ID from SmileBack.'
tags: [ 'smileback' ]
draft: false
unlisted: false
---

# Summary
This workflow retrieves a specific review from SmileBack using its unique review ID. It is useful for accessing detailed feedback provided by customers.

# Usage
The workflow requires an API token to authenticate requests to the SmileBack API. This is done using the [SmileBack - Get Token](/docs/4a926fc2-c329-4873-988d-6d3206add240) workflow which is run as a sub-workflow.

**Input Parameters**:
   - `review_id`: The unique identifier of the review you want to retrieve.

# Returned Data
```json
{
  "data": {
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
      "closed_on": "2025-11-05T13:41:35.733Z"
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
    "viewed_on": "2025-11-05T13:41:35.733Z",
    "rated_on": "2025-11-05T13:41:35.733Z",
    "permalink": "string",
    "last_modified": "2025-11-05T13:41:35.733Z"
  }
}
```