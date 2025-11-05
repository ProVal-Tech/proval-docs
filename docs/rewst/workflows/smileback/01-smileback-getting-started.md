---
id: '68b97a20-372e-4e59-bf1c-425a95bb971b'
slug: /68b97a20-372e-4e59-bf1c-425a95bb971b
title: 'SmileBack - Getting Started'
title_meta: 'SmileBack - Getting Started'
keywords: [ 'smileback', 'token', 'api', 'workflow' ]
description: 'Workflow to obtain an API token from SmileBack.'
tags: [ 'smileback' ]
draft: false
unlisted: false
---

To use these workflows, follow these steps:

1. Ensure you have access to a SmileBack account with the necessary permissions to view client id and client secret.
2. Configure the following organizational variables in your Rewst environment:
    - `smileback_client_id`: Your SmileBack client ID.
    - `smileback_client_secret`: Your SmileBack client secret.
    - `smileback_grant_type`: This must be set to `password`.
    - `smileback_scope`: This must be set to `read read_recent`.
    - `smileback_username`: Your SmileBack username (email).
    - `smileback_password`: Your SmileBack password.