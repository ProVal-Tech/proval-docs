---
id: '96ec2315-d8e2-4793-8db9-8d3f73803945'
slug: /96ec2315-d8e2-4793-8db9-8d3f73803945
title: 'Uninstall Crowdstrike Ninjaone'
title_meta: 'Uninstall Crowdstrike Ninjaone'
keywords: ['crowdstrike', 'uninstallation', 'windows', 'ninjaone', 'security']
description: 'This content is designed to detect and uninstall CrowdStrike from Windows servers and workstations using NinjaOne automation.'
tags: ['windows', 'auditing', 'uninstallation', 'security']
draft: false
unlisted: false
last_update:
date: 2026-10-09
----------------

## Purpose

This content is designed to automate the detection and uninstallation of CrowdStrike from Windows servers and workstations managed through NinjaOne. It uses automation scripts, compound conditions, and custom fields to identify devices with CrowdStrike installed and initiate the uninstallation process.

If CrowdStrike tamper protection is enabled, the required maintenance token and password must be provided to complete the uninstallation. If tamper protection is disabled, CrowdStrike can be uninstalled without requiring these credentials, where applicable.


## Associated Content

### Compound Conditions

| Content                                                                                               | Type               | Function                                                                                       |
| ----------------------------------------------------------------------------------------------------- | ------------------ | ---------------------------------------------------------------------------------------------- |
| [Compound Condition - uninstall-CrowdStrike-Servers](/docs/dc76f6c4-2768-4e21-abe2-eb7e7bc05cb8)      | Compound Condition | Targets Windows servers that meet the configured criteria for CrowdStrike uninstallation.      |
| [Compound Condition - uninstall-CrowdStrike-Workstations](/docs/e18cdba3-96f3-4961-b516-d021752ada6f) | Compound Condition | Targets Windows workstations that meet the configured criteria for CrowdStrike uninstallation. |

### Automation

| Content                                                                          | Type       | Function                                                             |
| -------------------------------------------------------------------------------- | ---------- | -------------------------------------------------------------------- |
| [Automation - CrowdStrike Detection](/docs/f4ea23b5-d7ab-4ca3-832a-5b4fe369517a) | Automation | Detects whether CrowdStrike is installed on the target device.       |
| [Automation - Uninstall CrowdStrike](/docs/3d721829-3986-4700-8eb5-5b1f746d460a) | Automation | Executes the CrowdStrike uninstallation process on eligible devices. |

### File Transfer

| Content                                                                   | Type          | Function                                                                                                        |
| ------------------------------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------------------- |
| [File Transfer - Crowdstrike](/docs/7041c5e0-2aea-4dd7-a657-b8a5ae4caeff) | File Transfer | Uploads the CrowdStrike uninstaller executable and transfers it to the specified location on the target device. |

### Custom Fields

| Content                                                                                         | Type         | Function                                                                                         |
| ----------------------------------------------------------------------------------------------- | ------------ | ------------------------------------------------------------------------------------------------ |
| [Custom Field - cPVAL CS Maintenance token](/docs/32e82fc8-8550-43ae-bd58-6abe3bfb693a)         | Custom Field | Stores the CrowdStrike maintenance token required for authorized uninstallation when applicable. |
| [Custom Field - cPVAL CS Password](/docs/7542dfd2-1e05-4203-8234-a703e70b6748)                  | Custom Field | Stores the password required by the uninstallation process, when applicable.                     |
| [Custom Field - cPVAL CS Uninstallation Deployment](/docs/7542dfd2-1e05-4203-8234-a703e70b6748) | Custom Field | Controls the CrowdStrike uninstallation deployment configuration.                                |

## Implementation

### Step 1: Create the Following Custom Fields

Create and configure the following custom fields:

* [cPVAL CS Maintenance token](/docs/32e82fc8-8550-43ae-bd58-6abe3bfb693a)
* [cPVAL CS Password](/docs/7542dfd2-1e05-4203-8234-a703e70b6748)
* [cPVAL CS Uninstallation Deployment](/docs/7542dfd2-1e05-4203-8234-a703e70b6748)

### Step 2: Import Automation Scripts

Import the following automation scripts:

* [Automation - CrowdStrike Detection](/docs/f4ea23b5-d7ab-4ca3-832a-5b4fe369517a)
* [Automation - Uninstall CrowdStrike](/docs/3d721829-3986-4700-8eb5-5b1f746d460a)

### Step 3: Configure File Transfer

Configure the following file transfer content:

* [File Transfer - Crowdstrike](/docs/7041c5e0-2aea-4dd7-a657-b8a5ae4caeff)

### Step 4: Configure the Solution

Import and configure the following solution:

* [Solution - Uninstall-Crowdstrike-Ninjaone](/docs/96ec2315-d8e2-4793-8db9-8d3f73803945)

### Step 5: Configure the Compound Conditions

Create and configure the following compound conditions to target the appropriate device types:

* [Compound Condition - uninstall-CrowdStrike-Servers](/docs/dc76f6c4-2768-4e21-abe2-eb7e7bc05cb8)
* [Compound Condition - uninstall-CrowdStrike-Workstations](/docs/e18cdba3-96f3-4961-b516-d021752ada6f)

## FAQ

**Q: What is the purpose of this solution?**

A: It automates the detection and uninstallation of CrowdStrike from eligible Windows servers and workstations managed through NinjaOne.

**Q: Does the solution support both servers and workstations?**

A: Yes. Separate compound conditions are provided for Windows servers and workstations.

**Q: What happens if CrowdStrike is not installed on a device?**

A: The detection automation checks whether CrowdStrike is installed and determines whether the uninstallation workflow needs to proceed.

**Q: Are credentials required to uninstall CrowdStrike?**

A: If tamper protection is enabled, the required maintenance token and password must be provided. If tamper protection is disabled, uninstallation can proceed without these credentials, where applicable.

**Q: What is the purpose of the file transfer configuration?**

A: It transfers the CrowdStrike uninstaller executable to the specified location on the target device for use by the uninstallation automation.

**Q: Can the uninstallation process be run on demand?**

A: Yes. The uninstallation automation can be run on demand through NinjaOne, subject to the configured execution settings and deployment permissions.

## Changelog

### 2026-10-09

- Initial version of the document.

