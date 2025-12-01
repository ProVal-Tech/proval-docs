---
id: 'c88b9f5e-25c2-417f-a325-6124fc710047'
slug: /c88b9f5e-25c2-417f-a325-6124fc710047
title: 'Uninstall Bitdefender Endpoint Security'
title_meta: 'Uninstall Bitdefender Endpoint Security'
keywords: ['bitdefender', 'security', 'endpoint', 'av', 'antivirus']
description: 'BitDefender Endpoint Security script downloads and runs the Remove-BitDefenderEndpointSecurity agnostic uninstaller.'
tags: ['antivirus', 'datto']
draft: false
unlisted: false
---

## Overview
BitDefender Endpoint Security script downloads and runs the [Agnostic-Remove-BitDefenderEndpointSecurity](/docs/3037688b-782b-468e-956a-292b3ef33534) uninstaller.

## Dependencies
[Agnostic-Remove-BitDefenderEndpointSecurity](/docs/3037688b-782b-468e-956a-292b3ef33534)

## Implementation  

1. Download the component [Uninstall Bitdefender Endpoint Security](../../../static/attachments/Bitdefender%20Endpoint%20Security%20Uninstall.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Uninstall Bitdefender Endpoint Security` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. This parameter allows you to enter an uninstall password/key in plaintext or encoded in base64 UTF-8. If the key is not required then run the script as shown below: ![Sample Run 1](../../../static/img/docs/06535f73-49cd-410f-ba6b-f71e39220385/image.webp)

5. If the key is not required then run the script as shown below: ![Sample Run 2](../../../static/img/docs/06535f73-49cd-410f-ba6b-f71e39220385/image1.webp)


## Datto Variables

| Variable Name | Type | Default | Required | Description |
| ------------- | ---- | ------- | -------- | ----------- |
| Key           | String |       | Partial  | This parameter allows you to enter an uninstall password/key in plaintext or encoded in base64 UTF-8 |

## Output

- stdOut  
- stdError 

## Attachments

- [Uninstall Bitdefender Endpoint Security](../../../static/attachments/Bitdefender%20Endpoint%20Security%20Uninstall.cpt)
