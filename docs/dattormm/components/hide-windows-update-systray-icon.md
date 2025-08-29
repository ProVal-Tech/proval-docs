---
id: '387fca6b-053a-4833-8554-d6df3d4799d7'
slug: 387fca6b-053a-4833-8554-d6df3d4799d7
title: 'Hide - Windows Update Systray Icon'
title_meta: 'Hide - Windows Update Systray Icon'
keywords: ['Windows', 'Icon', 'Systray']
description: 'This script is used to hide windows update icon under the systray'
tags: ['Windows', 'Patching', 'Updae']
draft: false
unlisted: false
---

## Overview

This script is used to hide windows update icon under the systray.

## Dependencies

None

## Implementation  

1. Export the procedure from Datto Environment.

![Image 1](../../../static/img/docs/387fca6b-053a-4833-8554-d6df3d4799d7/import.webp)

![Image 2](../../../static/img/docs/387fca6b-053a-4833-8554-d6df3d4799d7/cptfile.webp)

2. After downloading the attached file, login into the client environment and go to `automation ---> Components` click on the `Import` button

![Image 3](../../../static/img/docs/387fca6b-053a-4833-8554-d6df3d4799d7/Export.webp)

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  

![Image 4](../../../static/img/docs/387fca6b-053a-4833-8554-d6df3d4799d7/quickjob.webp)  

3. Search the component `Hide - Windows Update Systray Icon` and click on `Select`

![Image 5](../../../static/img/docs/387fca6b-053a-4833-8554-d6df3d4799d7/run-procedure.webp)

## Output

![Image 6](../../../static/img/docs/387fca6b-053a-4833-8554-d6df3d4799d7/logs.webp)