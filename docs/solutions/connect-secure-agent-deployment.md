---
id: '0e33b1a2-5539-4451-b49d-2ba9b7f904dd'
slug: /0e33b1a2-5539-4451-b49d-2ba9b7f904dd
title: 'ConnectSecure Agent Deployment'
title_meta: 'ConnectSecure Agent Deployment'
keywords: ['cybercns', 'connectsecure', 'vulnerability', 'management']
description: 'This solution automates the deployment of the ConnectSecure v4 vulnerability scan agent across Windows and macOS endpoints managed in NinjaRMM.'
tags: ['vulnerability', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-03-16
---

## Purpose

This solution automates the deployment of the ConnectSecure v4 vulnerability scan agent across Windows and macOS endpoints managed in NinjaRMM. ConnectSecure (formerly CyberCNS) continuously monitors endpoints for vulnerabilities, misconfigurations, and exposure risks; this solution eliminates manual installation by driving deployments entirely through NinjaRMM custom fields.

**How it works:**

1. **Authentication values** -> Three secure custom fields (`Company ID`, `Tenant ID`, and `User Secret`) are populated at the organization, location, or device level. These credentials are sourced from the ConnectSecure portal and authenticate each agent registration automatically.
2. **Deployment targeting** -> The [cPVAL Connect Secure Agent Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf) drop-down field controls which platforms are eligible for automated installation. Setting this field to a value such as `All`, `Windows`, or `Macintosh` at the organization level enables deployment for all devices underneath, while setting it to `Disable` at the location or device level excludes those specific items.
3. **Automated triggering** -> Three compound conditions (one per platform tier: Windows Workstation, Windows Server, and macOS) run continuously. Whenever a targeted device does not have the ConnectSecure agent service running, the appropriate automation fires and installs the agent using the stored credentials.
4. **Forced reinstallation** -> If an agent needs to be reinstalled or updated, the `Force` parameter on both automations can be used to bypass the existing-service check and rerun the full installer.

This solution supports deployment scoping at any level of the NinjaRMM hierarchy (organization → location → device), giving granular control over where the agent is deployed.

## Associated Content

### Custom Fields

| Content | Definition Scope | Required | Type | Function |
| ------- | ---------------- | -------- | ---- | -------- |
| [cPVAL Connect Secure Agent Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf) | `Organization`, `Location`, `Device` | True | Drop-Down | Controls which OS platforms receive automatic ConnectSecure agent installation; setting `Disable` at a location or device excludes it from automated deployment |
| [cPVAL Connect Secure Company ID](/docs/c104e227-d5f3-432b-90fa-f31186536181) | `Organization`, `Location`, `Device` | True | Secure | Stores the ConnectSecure Company ID that uniquely identifies the organization within the ConnectSecure portal |
| [cPVAL Connect Secure Tenant ID](/docs/3d1a16b3-688c-4911-a92d-835a578254a9) | `Organization`, `Location`, `Device` | True | Secure | Stores the top-level Tenant ID for the ConnectSecure environment |
| [cPVAL Connect Secure User Secret](/docs/af99dc24-6b08-4e0a-880e-05ccc755fc6f) | `Organization`, `Location`, `Device` | True | Secure | Stores the authentication secret/token required to register the agent with the ConnectSecure portal |

### Automations

| Content | Function |
| ------- | -------- |
| [Deploy ConnectSecure Agent [Windows]](/docs/d22e3b29-76a2-4385-a013-d592f6c5ae6d) | Downloads and deploys the ConnectSecure vulnerability scan agent on Windows endpoints using company-level custom fields for authentication |
| [Deploy ConnectSecure Agent [Macintosh]](/docs/19378af5-7ee0-43b4-8051-58b280467a6c) | Downloads and deploys the ConnectSecure vulnerability scan agent on macOS endpoints using company-level custom fields for authentication |

### Compound Conditions

| Content | Function |
| ------- | -------- |
| [Connect Secure Deployment [Windows Workstation]](/docs/65db6f18-c505-4ced-ad51-2964ea516f6b) | Triggers the Windows deployment automation on workstations where deployment is enabled but the agent service is not yet detected |
| [Connect Secure Deployment [Windows Server]](/docs/0ea70cbf-dc58-4d64-90f8-aff021079fc7) | Triggers the Windows deployment automation on servers where deployment is enabled but the agent service is not yet detected |
| [Connect Secure Deployment [Macintosh]](/docs/b5472dc9-11af-4739-af78-7ef7478f6eab) | Triggers the macOS deployment automation on Mac computers where deployment is enabled but the agent service is not yet detected |

## Implementation

### Step 1: Create Custom Fields

1. **[cPVAL Connect Secure Agent Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf)**
2. **[cPVAL Connect Secure Company ID](/docs/c104e227-d5f3-432b-90fa-f31186536181)**
3. **[cPVAL Connect Secure Tenant ID](/docs/3d1a16b3-688c-4911-a92d-835a578254a9)**
4. **[cPVAL Connect Secure User Secret](/docs/af99dc24-6b08-4e0a-880e-05ccc755fc6f)**

### Step 2: Import Automations

1. Import the **[Deploy ConnectSecure Agent [Windows]](/docs/d22e3b29-76a2-4385-a013-d592f6c5ae6d)** automation
2. Import the **[Deploy ConnectSecure Agent [Macintosh]](/docs/19378af5-7ee0-43b4-8051-58b280467a6c)** automation

### Step 3: Create Compound Conditions

1. Create the **[Connect Secure Deployment [Windows Workstation]](/docs/65db6f18-c505-4ced-ad51-2964ea516f6b)** compound condition and assign it to the `Windows Workstation Policy [Default]`
2. Create the **[Connect Secure Deployment [Windows Server]](/docs/0ea70cbf-dc58-4d64-90f8-aff021079fc7)** compound condition and assign it to the `Windows Server Policy [Default]`
3. Create the **[Connect Secure Deployment [Macintosh]](/docs/b5472dc9-11af-4739-af78-7ef7478f6eab)** compound condition and assign it to the `Mac Policy [Default]`

### Step 4: Populate Authentication Fields

For each organization where ConnectSecure should be deployed, populate the following fields at the organization level (or at the location/device level for more granular control):

- **[cPVAL Connect Secure Company ID](/docs/c104e227-d5f3-432b-90fa-f31186536181)** -> Enter the Company ID from the ConnectSecure portal
- **[cPVAL Connect Secure Tenant ID](/docs/3d1a16b3-688c-4911-a92d-835a578254a9)** -> Enter the Tenant ID from the ConnectSecure portal
- **[cPVAL Connect Secure User Secret](/docs/af99dc24-6b08-4e0a-880e-05ccc755fc6f)** -> Enter the authentication secret from the ConnectSecure portal

> For instructions on locating these values in the ConnectSecure portal, refer to the [ConnectSecure installation guide](https://cybercns.atlassian.net/wiki/spaces/CVB/pages/2103410891/How+To+Install+ConnectSecure+Agent#Instructions).

### Step 5: Enable Deployment via the Deployment Field

Set the **[cPVAL Connect Secure Agent Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf)** field value at the appropriate scope:

| Value | Effect |
| ----- | ------ |
| `All` | Deploys to all Windows (workstations and servers) and macOS endpoints |
| `Windows` | Deploys to all Windows endpoints (workstations and servers) |
| `Windows Workstation` | Deploys to Windows workstations only |
| `Windows Server` | Deploys to Windows servers only |
| `Windows Workstation and Macintosh` | Deploys to Windows workstations and macOS endpoints |
| `Macintosh` | Deploys to macOS endpoints only |
| `Disable` | Excludes this organization, location, or device from automated deployment |

Once the field is set, the compound conditions will automatically detect eligible endpoints and trigger the appropriate automation to install the ConnectSecure agent.

## FAQ

### 1. What does this solution do for me on a daily basis?

> It automatically deploys the ConnectSecure agent to eligible endpoints so vulnerability scanning can start without manual installation effort.

### 2. How do I know whether a device is eligible for deployment?

> Check the effective value of [cPVAL Connect Secure Agent Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf) for that endpoint. If the selected option includes the endpoint OS, it is eligible.

### 3. Why did deployment work for one site but not another?

> A location or device may have an override value that differs from the organization setting. Lower-level values take priority over higher-level values.

### 4. Why did a specific endpoint not receive the agent?

> Common causes are: endpoint offline, deployment option excludes its OS, secure credential fields are empty/invalid at effective scope, or installer execution was blocked.

### 5. Will this keep reinstalling the agent every time policies evaluate?

> No. The normal behavior is install-if-missing. If the expected agent service is detected, the automation does not reinstall unless forced manually.

### 6. What happens if the endpoint already has the agent installed?

> If the service is present and healthy, the endpoint is treated as compliant and will not be reinstalled during standard runs.

### 7. Does this solution support both Windows and macOS?

> Yes. It supports Windows workstations, Windows servers, and macOS using separate platform-aware conditions and automations.

### 8. Can I target only servers or only workstations?

> Yes. Use the deployment field option that matches your target platform, such as `Windows Server` or `Windows Workstation`.

### 9. Can I pause deployment for one location only?

> Yes. Set [cPVAL Connect Secure Agent Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf) to `Disable` at that location.

### 10. Can I exclude just one endpoint?

> Yes. Set [cPVAL Connect Secure Agent Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf) to `Disable` at the device level.

### 11. How long after enabling deployment should I expect results?

> Deployment occurs when the endpoint checks in and the condition cycle evaluates. Most environments see execution shortly after the next policy/condition pass.

### 12. What if the credentials were entered incorrectly?

> Deployment attempts will fail until valid values are entered in [cPVAL Connect Secure Company ID](/docs/c104e227-d5f3-432b-90fa-f31186536181), [cPVAL Connect Secure Tenant ID](/docs/3d1a16b3-688c-4911-a92d-835a578254a9), and [cPVAL Connect Secure User Secret](/docs/af99dc24-6b08-4e0a-880e-05ccc755fc6f).

### 13. I updated credentials. Will existing installs be affected immediately?

> Updated values are used on future deployment attempts. Existing installed agents are not automatically reinstalled unless a forced run is initiated.

### 14. What if endpoint security software blocks the installer?

> The deployment will fail until the block is removed. After allow-listing or policy adjustment, the next run should proceed normally.

### 15. Can users continue working while deployment happens?

> Yes, in most cases. Deployment runs silently in the background, though short spikes in CPU/network usage may occur during download and install.

### 16. What should I check first if deployment seems stuck?

> Verify endpoint online status, OS targeting value, effective credential values, and recent automation activity for errors.

### 17. Can this solution deploy to Linux devices?

> No. This solution currently targets only Windows and macOS endpoints.

### 18. Is internet access required for deployment?

> Yes. Endpoints need outbound connectivity to download and register the ConnectSecure agent.

### 19. How can I confirm deployment actually ran on a device?

> Review the endpoint's automation activity history in NinjaRMM for the corresponding ConnectSecure deployment automation and result details.

### 20. What should I do when only a small subset of devices fail repeatedly?

> Treat those as endpoint-specific issues: compare effective field values, check local security/network restrictions, and run the relevant deployment automation manually for deeper error output.

## Changelog

### 2026-03-16

- Renamed custom field `cPVAL ConnectSecure Deployment` to `cPVAL Connect Secure Agent Deployment` and updated its drop-down options.
- Changed `cPVAL Connect Secure Company ID` and `cPVAL Connect Secure Tenant ID` field types from `Text` to `Secure`.
- Added new `cPVAL Connect Secure User Secret` custom field for agent authentication.
- Updated Windows and macOS automations to retrieve the user secret from the new custom field, support a `Force` parameter for reinstallation, and use a service-based agent detection method.
- Updated all three compound conditions to reference the renamed custom field and updated automations.
- Added FAQs.

### 2025-12-15

- Initial version of the document
