---
id: '132a68a2-5d49-49b5-994f-4baf4606f816'
title: 'VMware Host Detection Configuration'
title_meta: 'VMware Host Detection Configuration'
keywords: ['vmware', 'detection', 'configuration', 'probe', 'credentials']
description: 'This document provides guidance on troubleshooting incorrect configurations that may cause VMware host detection failures. It outlines steps for verifying probe and credential configurations, ensuring successful detection of VMware hosts within your network.'
tags: ['networking']
draft: false
unlisted: false
---

<div class='text-section scrollable'>

This document will help identify incorrect configurations that can cause VMware host detection to fail, as well as explain the resolution for each of those areas.

### Probe Configuration

1. Verify that a network probe is configured on the same IP subnet where the VMware host resides. Refer to the [Enabling the Network Probe](https://docs.connectwise.com/ConnectWise_Automate_Documentation/070/175/020) article for more information.
2. Confirm that the probe machine has the **VM Manager Probe Check via Remote** role detected.  
   If you do not see this role, run the following commands on the probe machine:
   - Update Config
   - Resend System Info
   - Update Plugins

3. Confirm that the VMware host's IP address appears under **Network Devices** in the client section of the **Control Center**.

   ![Image](../../../static/img/VMware-Host-Not-Detected-in-Virtualization-Manager-Plugin/image_1.png)

4. If it does not, correct the IP range being scanned by the probe from the **Network Probe** tile > **Settings**. Once these settings have been modified, click **Save** and then click **Rescan Network**.

   ![Image](../../../static/img/VMware-Host-Not-Detected-in-Virtualization-Manager-Plugin/image_2.png)

### Credential Configuration

5. Confirm that you have configured the proper credentials for the VMware host. This can be done from the **Global Settings**.

   Global Credentials are used if you have an ESXi password that you share between multiple clients (not recommended).

   ![Image](../../../static/img/VMware-Host-Not-Detected-in-Virtualization-Manager-Plugin/image_3.png)

   The other option (recommended) is to manually set the credentials through the Local Credentials section and select the proper password from the client or location:

   ![Image](../../../static/img/VMware-Host-Not-Detected-in-Virtualization-Manager-Plugin/image_4.png)

   If you do not have credentials saved at the client or location, you can add them with a quick shortcut by selecting "new credential" from the dropdown:

   ![Image](../../../static/img/VMware-Host-Not-Detected-in-Virtualization-Manager-Plugin/image_5.png) 
   ![Image](../../../static/img/VMware-Host-Not-Detected-in-Virtualization-Manager-Plugin/image_6.png)  

If the above steps are fine, please check the steps below:

1. From the Control Center, open the Computer Management Screen of the Probe agent, then open File Explorer and look for the *C:/Windows/LTSVC/Plugin_VM.txt* log file on the probe machine.
2. Verify that the VMware host is being scanned. If the IP address does not appear in the log, refer to the above section on **Probe Configuration**.
3. Check for an error message similar to the one below associated with the IP address of your VMware host:  
   *The underlying connection was closed: An unexpected error occurred on a send.....InnerException: Authentication failed because the remote party has closed the transport stream. This indicates that you must modify the ciphers allowed on the VMware host.*

   **Note:** Once you have modified the host, you must re-run the network probe detection. This can be done by restarting the LabTech service on the probe machine. Go to the **Services** tile of the **Computer Management** screen, right-click on the **LTService**, and select **Restart**.

4. Try to manually apply the credentials to the network device itself and run a test through the network device.

   ![Image](../../../static/img/VMware-Host-Not-Detected-in-Virtualization-Manager-Plugin/image_7.png)

   ![Image](../../../static/img/VMware-Host-Not-Detected-in-Virtualization-Manager-Plugin/image_8.png)

If none of the above steps help, please reach out to us at [Support@provaltech.com](mailto:Support@provaltech.com)

</div>
