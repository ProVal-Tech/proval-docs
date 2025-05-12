---
id: '770946a6-9399-4001-adc6-9d1eb9f203da'
slug: /770946a6-9399-4001-adc6-9d1eb9f203da
title: 'Browser - Homepage - Manage'
title_meta: 'Browser - Homepage - Manage'
keywords: ['homepage', 'browsers', 'configuration', 'set', 'remove', 'replace']
description: 'This document outlines a script that configures the homepage settings for Google Chrome, Microsoft Edge, and Mozilla Firefox. It provides detailed instructions on how to set, remove, or replace the homepage across these browsers, along with user parameters and sample runs to illustrate its functionality.'
tags: ['chrome', 'edge', 'firefox', 'setup']
draft: false
unlisted: false
---

## Summary

This script serves as a wrapper for configuring the homepage of three browsers: Google Chrome, Microsoft Edge, and Mozilla Firefox. It leverages the following scripts:

- [EPM - Software Configuration - Chromium Browsers - Homepage - Set](/docs/e5c01410-3731-4b1c-b166-235d637c44bb)
- [EPM - Software Configuration - Chromium Browsers - Homepage - Remove](/docs/8d741266-521f-4bdf-b921-9fe0c28a0648)
- [EPM - Software Configuration - Script - Mozilla Firefox - Homepage - Set](/docs/d86f7be6-b88d-4829-8f0e-9b2d6b9dc645)
- [EPM - Software Configuration - Script - Mozilla Firefox - Homepage - Remove](/docs/c09afc4e-2ed0-4e85-9beb-e8b54082568e)

The 'Action' parameter can be used to specify the desired action (Set/Remove/Replace), and the 'Browser' parameter indicates the target browser for the operation. If the 'Browser' parameter is left unspecified, the script will perform the specified action on all three browsers.

## Dependencies

Importing this script will also import the following scripts:

- [EPM - Software Configuration - Chromium Browsers - Homepage - Set](/docs/e5c01410-3731-4b1c-b166-235d637c44bb)
- [EPM - Software Configuration - Chromium Browsers - Homepage - Remove](/docs/8d741266-521f-4bdf-b921-9fe0c28a0648)
- [EPM - Software Configuration - Script - Mozilla Firefox - Homepage - Set](/docs/d86f7be6-b88d-4829-8f0e-9b2d6b9dc645)
- [EPM - Software Configuration - Script - Mozilla Firefox - Homepage - Remove](/docs/c09afc4e-2ed0-4e85-9beb-e8b54082568e)

## User Parameters

| Name                       | Example                               | Required | Description                                                                                                                                                                                                 |
|----------------------------|---------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Action                     | Set                                   | True     | The 'Action' parameter can be used to specify the desired action (Set/Remove). <ul><li>Set -> To set the Homepage</li><li>Remove -> To remove the Homepage</li><li>Replace -> To replace the current Homepage <ul><li>Use this to override previously configured settings (such as EnforceOnNewTab)</li></ul></li></ul> |
| Browser                    | Chrome                                | False    | The 'Browser' parameter specifies the browser for setting/removing the homepage. Only 'Chrome', 'Edge', and 'Firefox' are acceptable values. If unspecified, the script will perform the action on all three browsers. Each value should be separated by a comma without any additional spaces, e.g., chrome,firefox. |
| Homepage                   | [https://www.provaltech.com](https://www.provaltech.com) | True     | The string value of the homepage to set in the browser. Only useful with the `Set` and `Replace` actions.                                                                                                 |
| EnforceOnNewTab           | 1                                     | False    | Set to 1 to force the homepage on each new tab instead of the new tab page. Only useful with the `Set` and `Replace` actions and only works on Chromium Browsers (Chrome and Edge).                       |
| EnforceHomepageStartup     | 1                                     | False    | Set to 1 to force the homepage to be the only open tab at the startup of the browser. Only useful with the `Set` and `Replace` actions.                                                                   |

## Action

### Set:
The Set action can be used for setting a specific homepage for the concerned browser(s).

**Parameters Used:**  
![Set Parameters](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_1.webp)

**Output:**  
![Set Output](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_2.webp)

### Remove:
The Remove action can be used to remove the currently applied homepage from the concerned browser(s).

**Parameters Used:**  
![Remove Parameters](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_3.webp)

**Output:**  
**Google Chrome:**  
![Remove Chrome Output](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_4.webp)  
**Mozilla Firefox:**  
![Remove Firefox Output](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_5.webp)  
**Microsoft Edge:**  
![Remove Edge Output](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_6.webp)

### Replace:
The `Replace` action serves to substitute the existing homepage configuration in the specified browser(s) with a new one. This functionality proves useful when you intend to replace the current homepage with an alternative one. Another scenario where this action is beneficial is when a homepage has been erroneously configured with the `EnforceOnNewTab` option. In such cases, users can rectify the error by employing the `Replace` action in the script, leaving the `EnforceOnNewTab` parameter empty. This ensures a seamless correction of the previous misconfiguration.

**Parameters Used:**  
![Replace Parameters](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_7.webp)

**Output:**  
![Replace Output](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_8.webp)

## Sample Run

- Set the Homepage on a single browser.  
Example: Setting [https://www.provaltech.com](https://www.provaltech.com) to the homepage of Google Chrome:  
![Set Chrome Homepage](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_9.webp)

- Remove the Homepage from a single browser:  
Example: Removing the homepage from Mozilla Firefox:  
![Remove Firefox Homepage](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_10.webp)

- Replace the current homepage on a single browser.  
Example: Replacing the homepage on Microsoft Edge with [https://www.provaltech.com](https://www.provaltech.com):  
![Replace Edge Homepage](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_11.webp)

- Perform an action against multiple browsers:  
Example: Replacing the homepage with [https://www.provaltech.com](https://www.provaltech.com) for Google Chrome and Mozilla Firefox:  
![Replace Chrome and Firefox Homepage](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_12.webp)

- Perform an action against all browsers:  
Example: Removing the homepage from all three browsers (Google Chrome, Microsoft Edge, Mozilla Firefox):  
![Remove All Browsers Homepage](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_13.webp)

- Enforce the homepage on browser startup.  
Example: Configuring Google Chrome and Microsoft Edge to open [https://www.provaltech.com](https://www.provaltech.com) as the homepage upon startup and ensuring that this setting is enforced in both browsers.  
![Enforce Homepage on Startup](../../../static/img/docs/770946a6-9399-4001-adc6-9d1eb9f203da/image_14.webp)

## Output

- Script logs