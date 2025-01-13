---
id: 'cwa-ad-sync-troubleshooting'
title: 'AD Sync out of date troubleshooting'
title_meta: 'AD Sync out of date troubleshooting'
keywords: ['ad', 'sync', 'troubleshooting', 'credentials', 'plugin']
description: 'This document provides a step-by-step guide to troubleshoot issues related to Active Directory Sync being out of date in ConnectWise Automate. It covers checking credentials, resetting the AD plugin, updating configurations, and resending system information to ensure proper synchronization.'
tags: ['active-directory', 'configuration', 'update', 'security', 'software']
draft: true
unlisted: true
---
## AD Sync out of date troubleshooting

1. Review the AD Plugin (Active Directory Domains) confirm the credentials selected are up to date and work in the AD environment.

   ![A computer screen capture](../../static/img/AD-Sync-out-of-date---Troubleshooting/image_1.png)

   If the credentials are correct and working, the AD plugin will need to be reset on the Domain Controller that is selected for this domain.  
   **Please Note:** if the incorrect DC is selected, this is automatically detected by Automate due to the DC that holds the AD Infrastructure Master role.

   ![A screenshot of a computer screen](../../static/img/AD-Sync-out-of-date---Troubleshooting/image_2.png)

2. Use Control or another remote tool. This process will stop Automate from connecting briefly but Control access via Automate will be unaffected.

   Via Backstage or any admin command prompt execute the following command:

   `taskkill /F /IM ltsvc.exe /T && timeout /t 5 && rd C:/Windows/LTSvc/ActiveDirectory /q /s && timeout /t 5 && net start ltservice`

   ![Text](../../static/img/AD-Sync-out-of-date---Troubleshooting/image_3.png)

3. After this completes update plugins on the agent.

   ![Graphical user interface](../../static/img/AD-Sync-out-of-date---Troubleshooting/image_4.png)

4. Update Config

   ![Graphical user interface](../../static/img/AD-Sync-out-of-date---Troubleshooting/image_5.png)

5. Then resend system info

   ![Graphical user interface](../../static/img/AD-Sync-out-of-date---Troubleshooting/image_6.png)

6. Return to the AD Domains plugin – reselect the correct credentials.
   - Refresh plugin and it should show success after a few minutes.




