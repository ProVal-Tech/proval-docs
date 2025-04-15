---
id: '46c7d8b6-eefc-4a70-9ecd-54386326f177'
slug: /46c7d8b6-eefc-4a70-9ecd-54386326f177
title: 'Domain Watch Configuration'
title_meta: 'Domain Watch Configuration'
keywords: ['domain', 'discovery', 'configuration', 'vsa', 'administration']
description: 'This document provides step-by-step instructions for configuring Domain Watch Discovery in VSA 9.5, ensuring a consistent and accurate setup across the organization. It covers prerequisites, detailed procedures, and verification steps to ensure optimal performance and coverage of your domain environment.'
tags: []
draft: false
unlisted: false
---

## Purpose

This document provides step-by-step instructions for configuring Domain Watch Discovery in VSA 9.5, ensuring a consistent and accurate setup across the organization.

## Prerequisites

Before configuring Domain Watch Discovery, ensure the following prerequisites are met:

1. **User Credentials**: Ensure you have the necessary Domain administrative credentials to configure settings within VSA.
2. **Domain Information**: Gather relevant information regarding the DC Server or any machine that will act as a probe.
3. **Schedule**: Gather information about the recurring schedule of the Discovery Scan.
4. **Agent Package**: The agent package should be created beforehand for the organization for which Domain Discovery is being configured.

## Procedure

### Step 1: Access Domain Watch Discovery

1. In the VSA dashboard, navigate to **Discovery**.
2. Select **Domain Watch** from the Discovery menu.

### Step 2: Configure Domain Settings

1. From the list, select the organization for which Domain Watch is to be configured.
2. From the probe deployment, select the machine that will act as a probe (preferably DCs).
3. Click on Install, then enter the Domain Admin username and credentials.
   ![Image](../../../static/img/Domain-Watch-Configuration/image_1.png)
4. Click on Verify and set the credentials.
5. After the credentials verification is complete, proceed with the Install button.
   ![Image](../../../static/img/Domain-Watch-Configuration/image_2.png)
6. Wait for the discovery to complete; meanwhile, proceed to configure Agent Deployment.
7. Go to the Agent deployment section and click on Edit.
8. Select the option "Automatically install Agents when a computer is discovered" and change the Default package to the Agent package for that specific organization.
   ![Image](../../../static/img/Domain-Watch-Configuration/image_3.png)
9. If the discovery has been completed, there will be some policies created in the Policies section. Head over to the OU/Containers section under Policies.
10. Select the policies one by one if there are machines present in multiple policies and click on the "Computers Policy" button.
    ![Image](../../../static/img/Domain-Watch-Configuration/image_4.png)
11. Check whether the policy is for workstations or servers.
12. Select the "Include New Computer" option.
13. Change the Machine Group to the Workstation or Server subgroup respectively (or as per the requirement from the client's end).
14. Select all the machines (or select a few if specified) and click on save.
    ![Image](../../../static/img/Domain-Watch-Configuration/image_5.png)
15. Repeat Steps 11-14 for all the policies as per the requirement.
16. Move over to the Schedule and Status option.
17. Schedule Full Synchronization to run daily or as per the requirement.
    ![Image](../../../static/img/Domain-Watch-Configuration/image_6.png)
18. Go to Probe Deployment and select the machine on which the probe was installed earlier.
19. Click on Activate.
    ![Image](../../../static/img/Domain-Watch-Configuration/image_7.png)
20. Check the status of the Domain Discovery; it should show as Active and Green.
    ![Image](../../../static/img/Domain-Watch-Configuration/image_8.png)
21. If the status is not green or active, review the configuration and click on Apply Changes under Policies > OU/Containers.
    ![Image](../../../static/img/Domain-Watch-Configuration/image_9.png)

### Step 3: Verify Configuration

1. Return to the **Domain Watch** main page.
2. Verify that the domain is listed and the schedule is active.
3. Run a manual discovery to test the configuration:
   - Select the domain.
   - Click **Run Discovery Now**.
4. Check the logs and notifications to ensure the discovery process runs smoothly.

## Conclusion

By following these steps, you will successfully configure Domain Watch Discovery in VSA 9.5. Regular monitoring and adjustment of settings based on discovery results will ensure optimal performance and coverage of your domain environment.


