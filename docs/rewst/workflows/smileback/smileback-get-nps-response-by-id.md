---
id: '26d729c7-5641-4d0b-a9a3-f63ac4e1b3a7'
slug: /26d729c7-5641-4d0b-a9a3-f63ac4e1b3a7
title: 'SmileBack - Get NPS Response by ID'
title_meta: 'SmileBack - Get NPS Response by ID'
keywords: [ 'smileback', 'nps', 'response', 'id', 'api', 'workflow' ]
description: 'Workflow to retrieve a specific NPS response from SmileBack by its ID.'
tags: [ 'smileback' ]
draft: false
unlisted: false
---

# Summary
This workflow retrieves a specific NPS (Net Promoter Score) response from SmileBack using its unique response ID. It is useful for accessing detailed feedback provided by customers in relation to NPS surveys.

# Usage
1. **Input Parameters**:
   - `response_id`: The unique identifier of the NPS response you want to retrieve.

# Returned Data
```json
{
  "data": {
    "id": "string",
    "rating": 0,
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
    "nps_score": 0
  }
}
```