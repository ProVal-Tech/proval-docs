---
id: '2e21d3a9-d6c7-4279-895b-ad029fab84b7'
title: 'VSA_API_ARGS'
title_meta: 'VSA_API_ARGS'
keywords: ['vsa', 'api', 'arguments', 'vsatoolbox', 'parameters']
description: 'This document outlines the necessary parameters required for using VSAToolbox, a set of tools designed to interact with a Kaseya VSA server API. It includes details on dependencies, example data, and the correct format for API arguments.'
tags: ['networking', 'security', 'setup', 'software']
draft: false
unlisted: false
---

<div class='text-section scrollable'>
VSA_API_ARGS are the necessary parameters required for using VSAToolbox, a set of tools to interact with a Kaseya VSA server's API.

## Dependencies

<div class='text-section scrollable'>
What VSA content relies on this Managed Variable?  
[VSAToolbox](https://proval.itglue.com/5078775/docs/15281068)

## Example Data

<div class='text-section scrollable'>
### ![Image](../../../static/img/VSA_API_ARGS/image_1.png)

![Image](../../../static/img/VSA_API_ARGS/image_2.png)  

Please note that the arguments have changed in VSAToolbox from previously used procedures. Ensure the arguments have been updated to match those seen below. Verify that there are two hyphens `--` before each argument.

```
--baseurl 'https://subdomain.server.com' --username 'EXAMPLEUSER' --pat '00000000-0000-0000-0000-000000000000'
```

`--baseurl 'https://subdomain.server.com'`  
The base URL that the VSA API can be accessed from. It should be in the format 'https://subdomain.server.com'.

`--username 'EXAMPLEUSER'`  
The username to use for VSA API authentication.

`--pat '00000000-0000-0000-0000-000000000000'`  
The personal access token to use for VSA REST API authentication.
</div>
</div>
</div>



