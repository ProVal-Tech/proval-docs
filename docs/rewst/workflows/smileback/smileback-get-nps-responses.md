---
id: 'dd44d574-c323-4ca2-b045-b4061a86106c'
slug: /dd44d574-c323-4ca2-b045-b4061a86106c
title: 'SmileBack - Get NPS Responses'
title_meta: 'SmileBack - Get NPS Responses'
keywords: [ 'smileback', 'nps', 'responses', 'api', 'workflow' ]
description: 'Workflow to retrieve NPS responses from SmileBack.'
tags: [ 'smileback' ]
draft: false
unlisted: false
---

# Summary
This workflow is designed to retrieve NPS (Net Promoter Score) responses from SmileBack, a customer feedback platform. It automates the process of fetching NPS responses using the SmileBack API, allowing users to easily access and analyze customer feedback related to their NPS surveys.

# Usage
The workflow requires an API token to authenticate requests to the SmileBack API. This is done using the [SmileBack - Get Token](/docs/4a926fc2-c329-4873-988d-6d3206add240) workflow which is run as a sub-workflow.

**Input Parameters**:
    - `created_since` (optional): Filter responses created after this date (ISO 8601 format).
    - `campaign_name` (optional): Filter responses by campaign name.
    - `score_gt` (optional): Filter responses with a score greater than this value.
    - `score_lt` (optional): Filter responses with a score less than this value.
    - `score_exact` (optional): Filter responses with an exact score.

# Returned Data
```json
{
  "data": [
    {
      "id": 0,
      "score": 2147483647,
      "comment": "string",
      "has_marketing_permission": true,
      "contact": {
        "id": 0,
        "first_name": "string",
        "last_name": "string",
        "email": "user@example.com",
        "company": "string",
        "title": "string",
        "location": "string"
      },
      "contact_remote_id": "string",
      "campaign_name": "string",
      "created_at": "2025-11-05T19:05:23.637Z"
    }
  ]
}
```