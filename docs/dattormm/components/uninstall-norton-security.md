---
id: 'f52085c9-32e5-4a20-af8e-6e555cb94b34'
slug: /f52085c9-32e5-4a20-af8e-6e555cb94b34
title: 'Uninstall Norton Security'
title_meta: 'Uninstall Norton Security'
keywords: ['norton', 'antivirus', 'security']
description: 'This script downloads and runs the Norton 360 Remover tool to uninstall the Norton Security application.'
tags: ['antivirus', 'security']
draft: false
unlisted: false
---

## Overview
This script downloads and runs the [Norton 360 Remover tool](https://www.norton.com/nortonremover) to uninstall the Norton Security application.

## Implementation  

1. Download the [Uninstall Norton Security](../../../static/attachments/uninstall-nortonsecurity.cpt) component from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the [Uninstall Norton Security](../../../static/attachments/uninstall-nortonsecurity.cpt) component and click on `Select`.  

    ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. Click on `Run`  
![Sample Run](../../../static/img/docs/63b4d59e-484c-4fbc-8412-5deb33b5b25c/image.webp)


## Output

- stdOut  
- stdError  

## Attachments

[Uninstall Norton Security](../../../static/attachments/uninstall-nortonsecurity.cpt)