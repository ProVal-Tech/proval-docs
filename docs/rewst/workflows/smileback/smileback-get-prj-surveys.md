---
id: '3cafc77b-92e4-4b81-88ef-370a2107e445'
slug: /3cafc77b-92e4-4b81-88ef-370a2107e445
title: 'SmileBack - Get Project Surveys'
title_meta: 'SmileBack - Get Project Surveys'
keywords: [ 'smileback', 'surveys', 'projects', 'api', 'workflow' ]
description: 'Workflow to retrieve project surveys from SmileBack.'
tags: [ 'smileback' ]
draft: false
unlisted: false
---

# Summary
This workflow is designed to retrieve project surveys from SmileBack, a customer feedback platform. It automates the process of fetching surveys associated with specific projects using the SmileBack API, allowing users to easily access and analyze survey data for their projects.

# Usage
The workflow requires an API token to authenticate requests to the SmileBack API. This is done using the [SmileBack - Get Token](/docs/4a926fc2-c329-4873-988d-6d3206add240) workflow which is run as a sub-workflow.

# Returned Data
```json
{
  "data": [
    {
      "id": "1951a31d-488c-4abf-aa89-34a7807173a4",
      "name": "Test"
    }
  ]
}
```