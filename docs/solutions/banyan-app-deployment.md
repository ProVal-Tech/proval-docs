---
id: 'f220b4c0-75f4-478d-860f-3e41a91ab6f0'
slug: /f220b4c0-75f4-478d-860f-3e41a91ab6f0
title: 'Banyan App Deployment'
title_meta: 'Banyan App Deployment'
keywords: ['banyan', 'banyan-app', 'sonicwall-cse', 'install-banyan-app', 'banyan-app-deployment']
description: 'Solution to detect endpoints missing the Banyan App and install it automatically.'
tags: ['application', 'installation', 'vpn']
draft: false
unlisted: false
---
## Purpose

Provide an automated solution to detect endpoints without the Banyan App and deploy the client automatically across Windows, macOS, and Linux devices using CWA scripts, an internal monitor, and an alert template.

## Associated Content

| Content                                             | Type           | Function |
|-----------------------------------------------------|---------------|-------------|
| [Install Banyan App](/docs/3a7001bb-a38b-11f0-9766-92000234cfc2)   | Script | Downloads and installs the Banyan client. |
| [Install Banyan App](/docs/5d2830db-272e-4f60-8b18-54bf53a7dbed)   | Internal Monitor | Detects endpoints missing the Banyan App. |
| △ Custom - Execute Script - Install Banyan App | Alert Template | Executes the script on machines flagged by the monitor. |

## Implementation

### Step 1

Import the following content from the `ProSync` plugin:

- [Script - Install Banyan App](/docs/3a7001bb-a38b-11f0-9766-92000234cfc2)
- [Internal Monitor - Install Banyan App](/docs/5d2830db-272e-4f60-8b18-54bf53a7dbed)
- `Alert Template - △ Custom - Execute Script - Install Banyan App`

### Step 2

Reload System Cache (Ctrl + R)

### Step 3

Execute the [script](/docs/3a7001bb-a38b-11f0-9766-92000234cfc2) with `Set_Environment=1` to create the EDFs required by the solution.

![First run](../../static/img/docs/3a7001bb-a38b-11f0-9766-92000234cfc2/image1.webp)

### Step 4

Configure the solution as outlined below:

- Navigate to Automation → Monitors within the CWA Control Center and set up the following:
  - [Internal Monitor - Install Banyan App](/docs/5d2830db-272e-4f60-8b18-54bf53a7dbed)
    - Set up with the alert template `△ Custom - Execute Script - Install Banyan App`.
    - Right-click and select `Run Now` to start the monitor.

## FAQ

**Q:** Where do I get the Invite Code and Deployment Key?
**A:** From the Banyan Command Center → Settings → App Deployment.

**Q:** What if Invite Code or Deployment Key are not set in EDFs?
**A:** Provide `INVITE_CODE` and `DEPLOYMENT_KEY` at runtime; runtime parameters override EDFs.

**Q:** How do I exclude a specific location or computer from deployment?
**A:** Set the EDF "Exclude Banyan App Deployment" at the Location or Computer level to true.

**Q:** How can I verify the client installed successfully?
**A:** Check the CWA job output, the endpoint's installed applications list, or look for the Banyan service/process on the target machine.

**Q:** Can this deploy to air-gapped devices?
**A:** No — targets must be able to download the installer and reach Banyan endpoints. For air-gapped devices use an offline installer and a different deployment workflow.

**Q:** What OS versions are supported?
**A:** The official Banyan install scripts support current Windows, macOS, and common Linux distributions. Confirm compatibility with Banyan documentation before mass deployment.

**Q:** How often should the monitor run?
**A:** It covers 50 machines per hour.

## References

- [https://github.com/banyansecurity/app-installer/tree/main](https://github.com/banyansecurity/app-installer/tree/main)
- [https://docs.banyansecurity.io/docs/manage-users-and-devices/device-managers/distribute-desktopapp/](https://docs.banyansecurity.io/docs/manage-users-and-devices/device-managers/distribute-desktopapp/)
