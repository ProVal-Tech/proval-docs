---
id: '99139303-0c18-4915-8141-6a9c2850fc85'
slug: /99139303-0c18-4915-8141-6a9c2850fc85
title: 'Manage Browser Session Restore'
title_meta: 'Manage Browser Session Restore'
keywords: ['session', 'browsers', 'configuration', 'restore', 'manage']
description: 'This script configures browser session restore settings.  It enables, disables, or removes the browser session restore configuration for supported browsers Google Chrome, Microsoft Edge, Brave and Mozilla Firefox.'
tags: ['chrome', 'edge', 'firefox', 'setup']
draft: false
unlisted: false 
last_update:
  date: 2026-10-09
---

## Overview

This script configures browser session restore settings.  It enables, disables, or removes the browser session restore configuration for supported browsers Google Chrome, Microsoft Edge, Brave and Mozilla Firefox.

## Implementation  

1. Download the component from the [`datto-rmm` repository](https://github.com/ProVal-Tech/datto-rmm):
   [Manage Browser Session Restore](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/manage-browser-session-restore.cpt)

2. After downloading the file, click on the `Import` button in the Datto RMM interface.

3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

4. After Importing the component to the Datto RMM, make sure to add the component to the `PVAL` Group always.  
    - Steps to Add the component under `PVAL` Group.  
    i. Click on `Drop Down Icon`.  
    ii. Click on `Add to Group`.  
    ![Image 4](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/Image1.webp)  
    iii. Select the group as `PVAL`  
    ![Image 5](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/Image2.webp)


## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Manage Browser Session Restore` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. ![Image 4](../../../static/img/docs/99139303-0c18-4915-8141-6a9c2850fc85/image1.webp)  


## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| Action | String | - | Specify the action to perform. Valid options are `Enable`, `Disable`, and `Remove`. <ul><li>Enable – Configures the browser to restore the previous session when it starts.</li><li>Disable – Configures the browser to start a new session instead of restoring the previous session.</li><li>Remove – Removes the managed browser session restore policy, allowing the browser's default behavior or other applicable policies to take effect.</li></ul> |
| Browser | String | - | Specify the browser or browsers to configure. Supported values: <ul><li>Chrome</li><li>Edge</li><li>Brave</li><li>Firefox</li></ul>Multiple browsers can be specified as a comma-separated list (e.g., Chrome,Edge,Firefox). |

## Output

- stdOut  
- stdError  

## Attachments  

- [<Component Name>](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/manage-browser-session-restore.cpt)

## Changelog
 
### 2026-10-09
 
- Initial version of the document
