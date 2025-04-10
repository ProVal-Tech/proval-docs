---
id: c74040d5-4fbb-487f-bb4f-b19696daab1c
slug: /c74040d5-4fbb-487f-bb4f-b19696daab1c
title: 'Offboarding Scripts - Template - Partner'
title_meta: 'Offboarding Scripts - Template - Partner'
keywords: ['offboarding', 'script', 'client', 'automation', 'software', 'ticketing']
description: 'This document is crafted to walk you through the utilization of the Offboarding Scripts - Partner script to run the Sub Scripts before retiring the machine from Automate.'
tags: ['software', 'ticketing', 'uninstallation']
draft: false
unlisted: false
---

## Summary
This document is crafted to walk you through the utilization of the `Offboarding Scripts - Partner`  script to run the Sub Scripts before retiring the machine from Automate.

## Dependencies
- [Offboarding Wrapper](/docs/1fef1360-cfd3-4a3f-8444-207c09fb5a78)
- [Remove Application](/docs/494f7109-e4b2-4ffa-93f8-e33089b09b4e)

## How to Use
1. Import the [Offboarding Wrapper](/docs/1fef1360-cfd3-4a3f-8444-207c09fb5a78) script into Automate from the ProSync plugin.
2. Go to the `Automation -> Scripts -> Client Specific` folder and duplicate the `Offboarding Scripts - Partner [Template]` script.
3. Remove the word `Template` from the script name and save it.
4. Discuss with the Consultant regarding all the applications Partner would like to remove And any scripts other then Application removal like Domain removal, Removing Existing VPNs before offboarding.
5. Figure out if those applications are getting removed using [Remove Application](/docs/494f7109-e4b2-4ffa-93f8-e33089b09b4e) script.
6. If any application is not getting removed using [Remove Application](/docs/494f7109-e4b2-4ffa-93f8-e33089b09b4e) then determine the dedicated script for that application uninstallation.
7. Build the script for the partner using the following steps:
    - For Applications that can be removed using [Remove Application](/docs/494f7109-e4b2-4ffa-93f8-e33089b09b4e) script:
        - The current template is for just two applications. This can be increased if there are more than two scripts
        - Define the first Application name in the `App1` global parameter.
        - Define the second Application name in the `App2` global parameter.
        - In case there are more than two applications:
            - Add another parameter `App3` in global parameters
            - Repeat Script steps 16 to 20 after line 20.
            - Replace `@App2@` with `@App3@` in the repeated steps.
            - Replace Go to of step 19 from `:Uninstall DedicatedApp1` to `:Verify App3 Uninstall`.
    - For Applications that cannot be removed using [Remove Application](/docs/494f7109-e4b2-4ffa-93f8-e33089b09b4e) and has a dedicated uninstall script:
        - The current template is for just one application. This can be increased as per partners' requirements.
        - Define the first Application name in the `DedicatedApp1` global parameter.
        - Call the dedicated script for this application in the `Uninstall DedicatedApp1` section at step 22.
        - In case there are more than one such application:
            - Add another parameter `DedicatedApp2` in global parameters
            - Repeat Script steps 22 to 29 after line 29 after line 29.
            - Replace `@DedicatedApp1@` with `@DedicatedApp2@` in the repeated steps.
            - Replace Go to of step 28 from `:Run AdditionalScript1` to `:Uninstall DedicatedApp2`
    - Use the `:Run AdditionalScript1` section only if the client wants to run any Script besides Application Removals.
    - Open the `Offboarding Wrapper` script and update the script to use this updated script instead of the template one.