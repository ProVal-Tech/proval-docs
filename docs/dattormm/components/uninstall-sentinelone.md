---
id: '90197a4e-1c00-4922-90b5-317d44cb26b4'
slug: /90197a4e-1c00-4922-90b5-317d44cb26b4
title: 'Uninstall SentinelOne'
title_meta: 'Uninstall SentinelOne'
keywords: ['remove', 'sentinelone', 'uninstall', 'security']
description: 'This Datto RMM component script downloads and invokes the ''Remove-SentinelOne'' agnostic PowerShell script from a central repository, and performs post-run log verification. The agnostic script uninstalls the SentinelOne agent, detects Anti-Tamper protection, and — if required — uses a passphrase to complete the uninstall. This Datto wrapper handles working directory setup, TLS policy adjustments, download, and execution on Windows systems.'
tags: ['security', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Overview

This Datto RMM component script downloads and invokes the [Remove-SentinelOne](/docs/c64c47e7-8da3-46c6-9765-29da85addc2f) agnostic PowerShell script from a central repository, and performs post-run log verification. The agnostic script uninstalls the SentinelOne agent, detects Anti-Tamper protection, and — if required — uses a passphrase to complete the uninstall. This Datto wrapper handles working directory setup, TLS policy adjustments, download, and execution on Windows systems.

## Dependencies

- [Remove-SentinelOne](/docs/c64c47e7-8da3-46c6-9765-29da85addc2f)

## Implementation  

1. Download the component [Uninstall SentinelOne](../../../static/attachments/uninstall-sentinelone.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Uninstall SentinelOne` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4.
    - Example 1: With PassPhrase (Tamper protection is not disabled)
        ![Image1](../../../static/img/docs/90197a4e-1c00-4922-90b5-317d44cb26b4/image1.webp)

    - Example 2: Without PassPhrase (Tamper protection is disabled)
        ![Image2](../../../static/img/docs/90197a4e-1c00-4922-90b5-317d44cb26b4/image2.webp)

## Datto Variables

| Variable Name | Type | Default | Required | Description |
| ------------- | ---- | ------- | -------- | ----------- |
| PassPhrase    | String | | Partially | The passphrase used for uninstalling the SentinelOne agent when Anti-Tamper protection is enabled. If not provided, the script assumes that Anti-Tamper protection is disabled. |

## Output

- StdOut
- StdErr
- C:\ProgramData\_Automation\Script\Remove-SentinelOne\Remove-SentinelOne-log.txt
- C:\ProgramData\_Automation\Script\Remove-SentinelOne\Remove-SentinelOne-error.txt

## Attachments

[Uninstall SentinelOne](../../../static/attachments/uninstall-sentinelone.cpt)
