---
id: fa3bbc1f-9ceb-4578-bf19-487a619536df
slug: /fa3bbc1f-9ceb-4578-bf19-487a619536df
title: 'Getting Started with StickySync'
title_meta: 'Getting Started with StickySync'
keywords: ['itglue', 'automation']
description: 'This document provides a step-by-step guide to setting up StickySync, including generating an API key, installing the plugin, and mapping clients to ITGlue organizations.'
tags: ['api', 'connectwise', 'database', 'setup']
draft: false
unlisted: false
---

## Getting Started

1. Generate an ITGlue API key from instruction in this [KB Article](https://support.itglue.com/hc/en-us/articles/360004938078-Getting-started-with-the-IT-Glue-API):
   1. Users with an Administrator role can navigate to Account > Settings.
   2. Click on API Keys > Custom API Keys.
   3. Enter a name for the key and click Generate API Key. You will not be able to view a key again after it has been generated.
   4. For security, an optional Password Access setting is provided for each API key. Password values can be accessed from the Passwords API only if this setting is enabled.
   5. To generate multiple API keys, click the plus sign icon.
      ![API Key Generation](/img/docs/fa3bbc1f-9ceb-4578-bf19-487a619536df/image_1.webp)

2. Install the StickySync.dll in the Plugin Manager of Automate.
3. Restart the Database agent.
4. Restart your Control Center.
5. Once your Control Center is back up, head over to Tools > StickySync.
6. Enter your API key and click "Apply".

   ![StickySync Configuration](/img/docs/fa3bbc1f-9ceb-4578-bf19-487a619536df/1.webp)

7. Once your API key is confirmed, you're ready to start mapping clients. Head over to the Org Mapping section and start mapping your Automate clients to your ITGlue organizations.

   ![Org Mapping](/img/docs/fa3bbc1f-9ceb-4578-bf19-487a619536df/image_2.webp)

8. Once that is complete, head over to the Passwords section.
   - You can Sync individual passwords from Automate to ITGlue here, or sync them en-masse with the "Sync All" button. Selecting the "AutoSync" checkbox for a password will ensure that the password in ITGlue is always the same as the password in Automate.
     - The "Sync All" button is contextual. If you are filtering the passwords list by a specific client, then the button will only "Sync All" passwords for that client.

   ![Passwords Sync](/img/docs/fa3bbc1f-9ceb-4578-bf19-487a619536df/image_3.webp)

## Tables

### plugin_stickysync_companymap

| Column    | Type | Example |
|-----------|------|---------|
| ClientID  | INT  | 123     |
| ITGOrgID  | INT  | 456     |

### plugin_stickysync_passwordautosync

| Column     | Type     | Example |
|------------|----------|---------|
| PasswordID | INT      | 1234    |
| AutoSync   | TINYINT  | 1       |

### plugin_stickysync_passwordmap

| Column        | Type     | Example              |
|---------------|----------|----------------------|
| PasswordID    | INT      | 1234                 |
| ITGPasswordID  | INT      | 5678                 |
| LastSync      | DATETIME | 2023-04-24 16:19:23  |

### plugin_stickysync_settings

| Column   | Type    | Example                  |
|----------|---------|--------------------------|
| APIKey   | VARCHAR | w1PqyjacT3jUBjQPQDdB4A== |