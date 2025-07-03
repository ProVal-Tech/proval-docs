---
id: 'fde98082-d74b-44ca-87e6-a0773fc3981c'
slug: /fde98082-d74b-44ca-87e6-a0773fc3981c
title: 'System Restore Point - Auto Purge after x thresholds'
title_meta: 'System Restore Point - Auto Purge after x thresholds'
keywords: ['datto','restore','system']
description: 'This PowerShell script automates the creation of a system restore point by first enabling System Restore on all valid internal NTFS drives and ensuring the required services are running. It then creates a restore point labeled Automated Restore Point.The script intelligently filters out invalid or external drives and optionally performs cleanup of older shadow copies based on a configurable threshold, helping to manage disk space efficiently.It supports environment-based input for drive letters and threshold values, making it highly adaptable for deployment via RMM platforms. This solution is ideal for pre-update safety, rollback readiness, and compliance-driven environments.'
tags: ['backup', 'windows', 'cleanup', 'cleanup']
draft: false
unlisted: false
---

## Overview  


This PowerShell script automates the creation of a system restore point by first enabling System Restore on all valid internal NTFS drives and ensuring the required services are running. It then creates a restore point labeled Automated Restore Point.

The script intelligently filters out invalid or external drives and optionally performs cleanup of older shadow copies based on a configurable threshold, helping to manage disk space efficiently.

It supports environment-based input for drive letters and threshold values, making it highly adaptable for deployment via RMM platforms. This solution is ideal for pre-update safety, rollback readiness, and compliance-driven environments.

## Implementation
1. Import the `component` [System Restore Point - Auto Purge after x thresholds](../../../static/attachments/System%20Restore%20Point%20-%20Auto%20Purge%20after%20x%20thresholds.cpt)  

2. After downloading the attached file > Click on the`Import` button > Select the component to add to the Datto RMM interface. 
![Image 1](../../../static/img/docs/fde98082-d74b-44ca-87e6-a0773fc3981c/snapshot1.webp)

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  

![Image 2](../../../static/img/docs/fde98082-d74b-44ca-87e6-a0773fc3981c/snapshot2.webp)  

3. Select the respective `component` from the list of available `components`.  

![Image 3](../../../static/img/docs/fde98082-d74b-44ca-87e6-a0773fc3981c/snapshot3.webp)  

4. After selecting the `componenet`, you'll be able to see 3 fields : `DriveLetters`, `Threshold`, and `Force` checkbox.  

![Image 4](../../../static/img/docs/fde98082-d74b-44ca-87e6-a0773fc3981c/snapshot4.webp)  

### Example 1  

- `DriveLetters`: This field is used to specify the drive letters that you want to enable system restore pont upon. You can enter multiple drive letters separated by a comma. For example, `C,D,E`. If you do not provide any specific driver letter, the `component` by default will create a restore over the `System Drive`.  

![Image 5](../../../static/img/docs/fde98082-d74b-44ca-87e6-a0773fc3981c/snapshot5.webp)  


### Example 2  

- `Threshold`: Limits how many restore points are kept. Older ones are deleted if the limit is exceeded.  

![Image 6](../../../static/img/docs/fde98082-d74b-44ca-87e6-a0773fc3981c/snapshot6.webp)  
Note:- Now `2` as `Threshold` is given, so componenet will create a new restore point and will only keep latest 2 restore points rest all will get deleted. 


### Example 3  

- `Force`: This is a checkbox that you can use to force the creation of a restore point. This can be helpful when you do not want to delete any older restore point then by enabling `Force` option, the `component` will create a new restore point without purging any older ones.  

![Image 7](../../../static/img/docs/fde98082-d74b-44ca-87e6-a0773fc3981c/snapshot7.webp)  



## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
|DriveLetters|String|`if no letter given, restore point will create on System Drive`|Comma-separated drive letters to enable System Restore on (e.g., C, D, E). Leave blank for system drive only.|
|Threshold|String|`set a value`|Limits how many restore points are kept. Older ones are deleted if the limit is exceeded|
|Force|Boolean|`False`|Use `True` to bypass threshold if it's not set. Allows restore point creation without cleanup.|
## Output

- stdOut  
- stdError  

## Attachments

[System Restore Point - Auto Purge after x thresholds](../../../static/attachments/System%20Restore%20Point%20-%20Auto%20Purge%20after%20x%20thresholds.cpt)
