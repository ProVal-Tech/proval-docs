---
id: '890b376d-8ff4-4f5a-9cec-b98cbd84aeb9'
slug: /890b376d-8ff4-4f5a-9cec-b98cbd84aeb9
title: 'SmileBack - Get Project Responses'
title_meta: 'SmileBack - Get Project Responses'
keywords: [ 'smileback', 'responses', 'projects', 'api', 'workflow' ]
description: 'Workflow to retrieve project responses from SmileBack.'
tags: [ 'smileback' ]
draft: false
unlisted: false
---

# Summary
This workflow is designed to retrieve project responses from SmileBack, a customer feedback platform. It automates the process of fetching responses associated with specific projects using the SmileBack API, allowing users to easily access and analyze response data for their projects.

# Usage
The workflow requires an API token to authenticate requests to the SmileBack API. This is done using the [SmileBack - Get Token](/docs/4a926fc2-c329-4873-988d-6d3206add240) workflow which is run as a sub-workflow.

# Returned Data
```json
{
  "data": [
    {
      "response": {
        "id": "6e848f65-40b5-4e5c-8a9d-606b7c5c7f47",
        "ratings": [
          {
            "question": "Budget management",
            "rating": 5,
            "seq_number": 1
          }
        ],
        "comment": null,
        "survey_name": "Test",
        "is_published": false,
        "has_marketing_permissions": false,
        "has_google_redirect": false,
        "project_name": "test",
        "project_company": "Alex's Car Wash",
        "project_phase": null,
        "date": "2025-11-05T18:39:31.950763+00:00",
        "project_status": "1. New",
        "project_phase_status": null
      },
      "contact": {
        "first_name": "Stephen",
        "last_name": "Nix",
        "email": "stephen.nix@provaltech.com",
        "remote_id": ""
      }
    }
  ]
}
```