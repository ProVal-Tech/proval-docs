---
id: '71437aaf-ed94-4950-a746-02b6bf6eb867'
slug: /71437aaf-ed94-4950-a746-02b6bf6eb867
title: 'Invoke-IISCrypto'
title_meta: 'Invoke-IISCrypto'
keywords: ['cipher','ssl']
description: 'Retrieves and/or applies IISCrypto current details on the system'
tags: ['auditing','iis','networking','security']
draft: false
unlisted: false
---

## Description
Retrieves and/or applies IISCrypto current details on the system based on the arguments passed. 
Please note that when using the audit functionality of this script, any field that has not been set by IISCrypto or through registry keys will have a value of null. This indicates that no configuration changes have been made for these fields and the Windows defaults are still applied. 

## Requirements
If attempting to apply a template, the script requires the URL to where the template is being hosted. Information on prebuilt and custom templates can be found in the 'Custom Templates' section of this web page: https://www.nartac.com/Products/IISCrypto

## Usage
To retrieve current IISCrypto configuration:

```powershell
.\Invoke-IISCrypto.ps1 -Audit
```

To apply the template that is hosted at the template URL:

```powershell
.\Invoke-IISCrypto.ps1 -ApplyTemplate -TemplateURL "templateurl.com/template.ictpl"
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                                            |
| ----------------- | ----- | --------- | --------- | --------- | ------------------------------------------------------ |
| `Audit`           |       | False     |           | Switch    | Retrieves IISCrypto Audit information if specified     |
| `ApplyTemplate`   |       | False     |           | Switch    | Applies IISCrypto template if specified                |
| `TemplateURL`     |       | False     |           | String    | Specifies what URL to pull the IISCrypto template from |

## Output
Location of output for log, result, and error files.

    .\Invoke-IISCrypto-log.txt
    .\Invoke-IISCrypto-error.txt
