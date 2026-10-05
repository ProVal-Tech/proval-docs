---
id: '718fecda-c514-4cc5-9f3c-badb25c07fc3'
slug: /718fecda-c514-4cc5-9f3c-badb25c07fc3
title: 'Windows Updates - Install Out-of-Band Patch - MSU'
title_meta: 'Windows Updates - Install Out-of-Band Patch - MSU'
keywords: ['windows-update', 'OOB-patches', 'MSU']
description: 'This script is used to install an out-of-band patch given a URL or a local path.'
tags: ['windows', 'update', 'installation', 'patching']
draft: false
unlisted: false 
last_update:
  date: 2026-10-05
---

## Overview

This script is used to install an out-of-band patch given a URL or a local path.

## Dependencies

> 📝 **Document Author Workflow (Read Before Proceeding)**
> 
> **Do not upload `.cpt` files directly to this public documentation repository.** 
> To keep our public documentation clean and our components secure, all `.cpt` files must be hosted in our central private repository.
> 
> 1. **Author & Export:** Build and export your component from the Datto RMM interface as a `.cpt` file.
> 2. **Commit to Repository:** Push the finalized `.cpt` file to the **[`datto-rmm` repository](https://github.com/ProVal-Tech/datto-rmm)**.
> 3. **Directory Structure & Naming:** Save the file inside the `components/` directory. The filename **must** be in strict `kebab-case` and exactly match the slug/filename of this markdown document (without the `.md` extension). 
>    * *Example Path:* `components/<this-document-slug>.cpt`
> 4. **Link in Document:** Replace the placeholder links in the "Implementation" and "Attachments" sections below with the permanent GitHub URL pointing to your committed `.cpt` file.

## Implementation  

1. Download the component from the [`datto-rmm` repository](https://github.com/ProVal-Tech/datto-rmm):
   [Windows Updates - Install Out-of-Band Patch - MSU](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/windows-updates-install-out-of-band-patch-msu.cpt)

2. After downloading the file, click on the `Import` button in the Datto RMM interface.

3. Select the component just downloaded and add it to the Datto RMM interface.  

   ![Image 1](../../../static/img/docs/718fecda-c514-4cc5-9f3c-badb25c07fc3/Import.webp)  

4. After Importing the component to the Datto RMM, make sure to add the component to the `PVAL` Group always.  
    - Steps to Add the component under `PVAL` Group.  
    i. Click on `Drop Down Icon`.  
    ii. Click on `Add to Group`.  

     ![Image 4](../../../static/img/docs/718fecda-c514-4cc5-9f3c-badb25c07fc3/group.webp)  

    iii. Select the group as `PVAL`  

    ![Image 5](../../../static/img/docs/718fecda-c514-4cc5-9f3c-badb25c07fc3/PVAL.webp)


## Sample Run

To execute the `Windows Updates - Install Out-of-Band Patch - MSU` over a specific machine, follow these steps:  

1. Select the machine you want to run the `Windows Updates - Install Out-of-Band Patch - MSU` on from the Datto RMM.  

2. Click on the `Quick Job` button.  

   ![Image 2](../../../static/img/docs/718fecda-c514-4cc5-9f3c-badb25c07fc3/quickjob.webp)  

3. Search the component `Windows Updates - Install Out-of-Band Patch - MSU` and click on `Select`

    ![Image 3](../../../static/img/docs/718fecda-c514-4cc5-9f3c-badb25c07fc3/find.webp)

4. Sample Run

    ![Image 3](../../../static/img/docs/718fecda-c514-4cc5-9f3c-badb25c07fc3/sample-run.webp)


## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| `urlOrLocalPathToMsu` | `String` | -- | URL or local file path to the MSU patch|
| `forceReboot` | `Boolean` | `False` | Set to true to force reboot after patch install |

## Output

- Activity Logs

## Attachments  

- [Windows Updates - Install Out-of-Band Patch - MSU](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/windows-updates-install-out-of-band-patch-msu.cpt)

## Changelog
 
### 2026-10-05
 
- Initial version of the document
