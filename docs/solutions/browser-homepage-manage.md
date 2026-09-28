---
id: '3197b1ea-9250-4373-9d21-6124a0b72ec6'
slug: /3197b1ea-9250-4373-9d21-6124a0b72ec6
title: 'Browser - HomePage - Manage'
title_meta: 'Browser - HomePage - Manage'
keywords: ['homepage', 'browsers', 'configuration', 'set', 'remove', 'replace']
description: 'Manages homepage settings for supported browsers on Windows endpoints'
tags: ['chrome', 'edge', 'firefox', 'setup']
draft: false
unlisted: false
last_update:
  date: 2026-09-28
---

## Purpose

The Browser Homepage Management solution manages homepage settings for supported browsers on **Windows endpoints**. It allows administrators to centrally configure whether a browser homepage should be set, removed, or replaced, and which browsers should be targeted.

The solution supports the following browsers:

* **Google Chrome**
* **Microsoft Edge**
* **Brave**
* **Mozilla Firefox**

The solution uses **NinjaOne custom fields** to define the desired browser homepage configuration and deployment scope. The configuration is then applied through the **Automation : Browser - Homepage - Manage** automation using signed agnostic scripts.

### Key Capabilities

1. **Platform Support**

   The solution is designed for **Windows Workstations and Windows Servers**.

2. **Browser Selection**

   Specify which supported browsers should be managed. The supported values are **Chrome, Edge, Brave, and Firefox**.

3. **Homepage Actions**

   The solution supports three homepage management actions:

   * **Set** – Sets the specified homepage.
   * **Remove** – Removes the configured homepage.
   * **Replace** – Replaces the existing homepage with the specified homepage.

4. **Custom Homepage**

   A specific homepage URL can be configured for the **Set** and **Replace** actions.

5. **New Tab Enforcement**

   For Chromium-based browsers, the solution can enforce the configured homepage on each new tab instead of allowing the browser's default new tab page.

   This applies to:

   * Google Chrome
   * Microsoft Edge
   * Brave

6. **Startup Homepage Enforcement**

   The solution can force the configured homepage to be the only page opened when the browser starts.

7. **Centralized Configuration**

   Browser homepage settings are managed through Ninja RMM custom fields, allowing the desired configuration to be controlled centrally without modifying the automation or scripts.

### Important Caveats & Behavior

1. **Supported Platform**

   The solution is intended for **Windows Workstations and Windows Servers**. The deployment conditions determine whether the automation is triggered for a workstation or server.

2. **Supported Browsers**

   Only **Chrome, Edge, Brave, and Firefox** are supported. Browser names should be entered using the supported browser values.

3. **Chromium New Tab Enforcement**

   The **EnforceOnNewTab** setting applies only to Chromium-based browsers: **Chrome, Edge, and Brave**. It does not apply to Firefox.

4. **Homepage URL**

   The homepage value is required when using the **Set** or **Replace** actions. It is not required for the **Remove** action.

5. **Enablement**

   The solution only runs on endpoints that are enabled through the **cPVAL Enable Browser Manage** custom field.

## Associated Content

### Custom Fields 

| Content                                             | Purpose                                         |
|-----------------------------------------------------|-------------------------------------------------|
| [Custom Field - cPVAL Enable Browser Manage](/docs/d63f2f2f-d39d-4bcd-8eb5-c4bbbb67b750) | Custom Field to select the operating system to manage the Browser homepage for the machines. |
| [Custom Field - cPVAL Browser HomePage Action](/docs/9073ddaa-e5c0-478f-a893-e6b8c423fb3d)  | Custom Field to select the desired action to be performed on Browsers Homepage. Set -> To set the Homepage; Remove -> To remove the Homepage; Replace -> To replace the current Homepage. |
| [Custom Field - cPVAL Browser](/docs/117579a5-d7bf-43d5-97e1-ea77163cf7a2) | Custom Field to specify the browser for setting/removing the homepage. Only 'Chrome', 'Edge', 'Brave' and 'Firefox' are acceptable values. |
| [Custom Field - cPVAL Browser Homepage](/docs/bec7d778-7266-46f4-893b-616c0cea5557) | Custom Field to add the string value of the homepage to set in the browser. Only useful with the Set and Replace actions. |
| [Custom Field - cPVAL Browser EnforceOnNewTab](/docs/9e50a4bc-f862-48af-a964-b073cb9cce01) | Custom Field to enforce the homepage on each new tab instead of the new tab page. Only useful with the Set and Replace actions and only works on Chromium Browsers (Brave,Chrome and Edge). |
| [Custom Field - cPVAL Browser EnforceHomepageStartup](/docs/734b02cf-e27d-4bc9-93b6-8054946780f5) | Custom Field to force the homepage to be the only open tab at the startup of the browser. Only useful with the Set and Replace actions. |

### Automation

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Automation - Browser - Homepage - Manage](/docs/13d8ac16-33d9-4bf4-b7cb-d8db932c8da6) | Manages browser homepage settings for Chrome, Edge, Brave, and Firefox using signed agnostic scripts. |


### Compound Conditions

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Compound Condition - Manage Browser Homepage - Workstations](/docs/0f23c8a1-f507-4c1d-9d3f-8e1233653c1e) | Triggers the [Automation - Browser - Homepage - Manage](/docs/13d8ac16-33d9-4bf4-b7cb-d8db932c8da6) on Windows Workstations where deployment is enabled for windows workstations from [Custom Field - cPVAL Enable Browser Manage](/docs/d63f2f2f-d39d-4bcd-8eb5-c4bbbb67b750). | 
| [Compound Condition - Manage Browser Homepage - servers](/docs/3557a5e1-91f2-4a2b-983c-bf79332ee3ec) | Triggers the [Automation - Browser - Homepage - Manage](/docs/13d8ac16-33d9-4bf4-b7cb-d8db932c8da6) on Windows servers where deployment is enabled for windows servers from [Custom Field - cPVAL Enable Browser Manage](/docs/d63f2f2f-d39d-4bcd-8eb5-c4bbbb67b750). |

## Implementation

### Step 1: Create the Following Custom Fields

Create all the custom fields listed below in Ninja RMM. These are required for the solution to function correctly.

* [cPVAL Enable Browser Manage](/docs/d63f2f2f-d39d-4bcd-8eb5-c4bbbb67b750)
* [cPVAL Browser HomePage Action](/docs/9073ddaa-e5c0-478f-a893-e6b8c423fb3d)
* [cPVAL Browser](/docs/117579a5-d7bf-43d5-97e1-ea77163cf7a2)
* [cPVAL Browser Homepage](/docs/bec7d778-7266-46f4-893b-616c0cea5557)
* [cPVAL Browser EnforceOnNewTab](/docs/9e50a4bc-f862-48af-a964-b073cb9cce01)
* [cPVAL Browser EnforceHomepageStartup](/docs/734b02cf-e27d-4bc9-93b6-8054946780f5)

### Step 2: Create the Automation

Set up the [Automation - Browser - Homepage - Manage](/docs/13d8ac16-33d9-4bf4-b7cb-d8db932c8da6) automation that will manage the browser homepage configuration on the targeted Windows endpoints.

### Step 3: Create the Compound Conditions

Create the compound conditions that will automatically target the appropriate Windows endpoints.

* [Compound Condition - Manage Browser Homepage - Workstations](/docs/0f23c8a1-f507-4c1d-9d3f-8e1233653c1e)
* [Compound Condition - Manage Browser Homepage - Servers](/docs/3557a5e1-91f2-4a2b-983c-bf79332ee3ec)

The Workstations compound condition targets Windows Workstations where Browser Homepage Management is enabled.

The Servers compound condition targets Windows Servers where Browser Homepage Management is enabled.

## FAQ

### Q: Which platforms are supported?

> The Browser Homepage Management solution supports **Windows Workstations and Windows Servers**.

### Q: Which browsers are supported?

> The solution supports **Chrome, Edge, Brave, and Firefox**.

### Q: What actions are supported?

> The solution supports the following actions:
>
> * **Set** – Sets the configured homepage.
> * **Remove** – Removes the configured homepage.
> * **Replace** – Replaces the existing homepage with the configured homepage.

### Q: When is the Browser Homepage custom field required?

> The [cPVAL Browser Homepage](/docs/bec7d778-7266-46f4-893b-616c0cea5557) custom field is required when using the **Set** or **Replace** actions. It is not required when using the **Remove** action.

### Q: Can multiple browsers be managed?

> Yes. The [cPVAL Browser](/docs/117579a5-d7bf-43d5-97e1-ea77163cf7a2) custom field can be used to specify the supported browsers that should be managed.

### Q: Does EnforceOnNewTab work with Firefox?

> No. The **EnforceOnNewTab** setting only applies to Chromium-based browsers: **Chrome, Edge, and Brave**.

### Q: What happens when Browser Homepage Management is disabled?

> The endpoint will not be targeted by the Browser Homepage Management compound condition, and the [Automation - Browser - Homepage - Manage](/docs/13d8ac16-33d9-4bf4-b7cb-d8db932c8da6) automation will not be triggered for that endpoint.

### Q: Why is the automation not running on an endpoint?

> Verify that:
> * The endpoint is a supported **Windows Workstation or Windows Server**.
> * The [cPVAL Enable Browser Manage](/docs/d63f2f2f-d39d-4bcd-8eb5-c4bbbb67b750) custom field is enabled.
> * The endpoint meets the appropriate Workstation or Server compound condition.
> * The required browser is installed on the endpoint.
> * The Browser Homepage custom fields contain valid configuration values.

### Q: Is any manual configuration required on the endpoint?

> No additional manual endpoint configuration is required. The solution uses the configured Ninja RMM custom fields and the Browser Homepage Management automation to apply the settings.

### Q: Can the homepage be removed after it has been configured?

> Yes. Set the [cPVAL Browser HomePage Action](/docs/9073ddaa-e5c0-478f-a893-e6b8c423fb3d) custom field to **Remove**. The homepage URL does not need to be configured for the Remove action.


## Changelog

### 2026-09-28

- Initial version of the document
