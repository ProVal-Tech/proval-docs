---
id: 'New GUID'
slug: /New GUID
title: 'Filename'
title_meta: 'Filename'
keywords: []
description: ''
tags: []
draft: true
unlisted: false 
last_update:
  date: 20xx-xx-xx
---

## Overview


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
   [<Component Name>](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/<filename>.cpt)

2. After downloading the file, click on the `Import` button in the Datto RMM interface.

3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

4. After Importing the component to the Datto RMM, make sure to add the component to the `Proval` Group always.  
    - Steps to Add the component under `Proval` Group.  
    i. Click on `Drop Down Icon`.  
    ii. Click on `Add to Group`.  
    ![Image 4](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/Image1.webp)  
    iii. Select the group as `Proval`  
    ![Image 5](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/Image2.webp)


## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `<Name of the Component>` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. `<Screenshot of Sample run with variable details and example>`


## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |

## Output


## Attachments  

- [<Component Name>](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/<filename>.cpt)

## Changelog
 
### 20xx-xx-xx
 
- Initial version of the document
