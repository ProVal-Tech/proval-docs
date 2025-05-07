---
id: '4664a942-cb4f-425a-ae16-4615d2b14cae'
slug: /4664a942-cb4f-425a-ae16-4615d2b14cae
title: 'Install Windows 11'
title_meta: 'Install Windows 11'
keywords: ['windows', 'installation', 'policy', 'upgrade', 'patching']
description: 'This document outlines the steps to create a policy that enables the installation of Windows 11 on Windows 10 machines, including navigation through the endpoints and configuring necessary settings.'
tags: ['patching', 'setup']
draft: false
unlisted: false
---

## Summary

Policy to enable Windows 11 installation for Windows 10 machines.

## Policy Creation

1. Navigate to `Endpoints` > `Policies`.  
   ![Image](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_14.webp)

2. Click the `Add Policy` button.  
   ![Image](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_15.webp)

3. This screen will appear.  
   ![Image](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_16.webp)

4. **Type:** `OS Patching Desktop`  
   **Name:** `Install Windows 11`  
   ![Image](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_17.webp)

5. ![Image](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_18.webp)

6. Enable the `OS Patching Automation`.  
   ![Image](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_19.webp)

7. Leave the other options in the `Patch Classifications` section set to `Do not deploy` and enable the `OS Upgrade` option.  
   ![Image](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_20.webp)

8. Make the necessary changes to the rest of the options as required by the partner.  
   ![Image](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_21.webp)

9. Click the `Save` button to save the policy.  
   ![Image](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_22.webp)

## Completed Policy

![Image](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_23.webp)

