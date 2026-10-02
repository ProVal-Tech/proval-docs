---
id: '49acbca5-5fa4-4f75-bbbc-595cec9a7e29'
slug: /49acbca5-5fa4-4f75-bbbc-595cec9a7e29
title: 'Time Sync Compliance'
title_meta: 'Time Sync Compliance'
keywords: ['windows', 'sync', 'time', 'compliance']
description: 'Configures and maintains Windows Time synchronization on supported Windows endpoints '
tags: ['compliance', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-02
---

## Purpose

This solution configures and maintains Windows Time synchronization on supported Windows endpoints using **NinjaOne custom fields**, automated configuration, and compound conditions.

The solution allows administrators to centrally specify the NTP servers that endpoints should use for Windows Time synchronization. When time synchronization compliance is enabled for an endpoint, the configured NTP peer list is applied and Windows Time is synchronized with the specified time servers.

The solution supports the following platform:

* **Windows Workstations**

### Key Capabilities

1. **Platform Support**

   The solution is designed for **Windows Workstations**.

2. **Time Synchronization Enablement**

   The [cPVAL Enable Time Sync Compliance](/docs/703ea4d2-6375-4f57-b54c-cce06808ebb3) custom field is used to enable or disable time synchronization compliance on Windows Workstations.

3. **NTP Peer Configuration**

   The [cPVAL Time Sync Peer List](/docs/5944866d-106f-46d5-83f7-75dfd19180fd) custom field is used to specify the NTP servers that the endpoint should use for Windows Time synchronization.

   Multiple NTP peers can be specified, for example:

   * `us.pool.ntp.org`
   * `time.nist.gov`

4. **Automated Time Configuration**

   When Time Sync Compliance is enabled, the [Automation - Configure Time Sync](/docs/002bd069-639a-488a-935f-17182ae8efe0) automation configures Windows Time to use the specified NTP peer list and initiates synchronization.

5. **Manual Time Resynchronization**

   The [Automation - Resync Windows Time](/docs/03e5954a-55fe-49f3-ba46-861156f83947) automation can be run manually to force Windows Time to synchronize using the currently configured time source.

6. **Centralized Configuration**

   Time synchronization settings are managed through NinjaOne custom fields, allowing administrators to configure the NTP peer list without modifying the automation scripts.

7. **Automated Endpoint Targeting**

   The [Compound Condition - Time Sync Compliance - Workstations](/docs/e63a5602-1618-45cd-a9ae-b877fccc2ea7) automatically targets Windows Workstations where Time Sync Compliance is enabled.



## Associated Content

### Custom Fields

| Content                                             | Purpose                                         |
|-----------------------------------------------------|-------------------------------------------------|
| [cPVAL Enable Time Sync Compliance](/docs/703ea4d2-6375-4f57-b54c-cce06808ebb3) | Custom Field to enable device time synchronization with the NTP servers specified in the peer list. |
| [cPVAL Time Sync Peer List](/docs/5944866d-106f-46d5-83f7-75dfd19180fd) | Custom Field to specify the NTP time servers (peers) that the device should use for Windows Time synchronization.E.g. 'us.pool.ntp.org', 'time.nist.gov'. |

### Automation

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Configure Time Sync](/docs/002bd069-639a-488a-935f-17182ae8efe0) | Configures and synchronizes Windows Time on Windows workstations using the specified NTP peer list. |
| [Resync Windows Time](/docs/03e5954a-55fe-49f3-ba46-861156f83947) | Manually forces Windows Time to synchronize using the currently configured time source on Windows workstations. |

### Compound Conditions

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Time Sync Compliance - Workstations](/docs/e63a5602-1618-45cd-a9ae-b877fccc2ea7) | Triggers the [Automation - Configure Time Sync](/docs/002bd069-639a-488a-935f-17182ae8efe0) on Windows Workstations where device time synchronization is enabled using [Custom Field - cPVAL Enable Time Sync Compliance](/docs/703ea4d2-6375-4f57-b54c-cce06808ebb3). |

## Implementation

### Step 1: Create the Following Custom Fields

Create the following custom fields in NinjaOne. These fields are required for the solution to function correctly.

* [cPVAL Enable Time Sync Compliance](/docs/703ea4d2-6375-4f57-b54c-cce06808ebb3)
* [cPVAL Time Sync Peer List](/docs/5944866d-106f-46d5-83f7-75dfd19180fd)

### Step 2: Configure Time Sync Compliance

Set the [cPVAL Enable Time Sync Compliance](/docs/703ea4d2-6375-4f57-b54c-cce06808ebb3) custom field to Enable on the Windows Workstations that should use Time Sync Compliance.

Configure the [cPVAL Time Sync Peer List](/docs/5944866d-106f-46d5-83f7-75dfd19180fd) custom field or use the script parameter to specify the NTP servers that the endpoints should use.

For example:

* `us.pool.ntp.org`
* `time.nist.gov`


### Step 3: Create the Automation

Set up the following automation:

* [Automation - Configure Time Sync](/docs/002bd069-639a-488a-935f-17182ae8efe0)


### Step 4: Create the Manual Resync Automation

Set up the following automation:

* [Automation - Resync Windows Time](/docs/03e5954a-55fe-49f3-ba46-861156f83947)

This automation can be run manually when an immediate time synchronization is required. It uses the time source that is currently configured on the endpoint rather than changing the configured NTP peer list.

### Step 5: Create the Compound Condition

Create the following compound condition:

* [Time Sync Compliance - Workstations](/docs/e63a5602-1618-45cd-a9ae-b877fccc2ea7)

Apply the compound condition to the appropriate Windows Workstation agent policies.

The compound condition identifies Windows Workstations where Time Sync Compliance is enabled and triggers the [Automation - Configure Time Sync](/docs/002bd069-639a-488a-935f-17182ae8efe0) automation.

## FAQ

### Q: Which platforms are supported?

> The solution supports Windows Workstations.

### Q: How do I enable Time Sync Compliance?

> Set the [cPVAL Enable Time Sync Compliance](/docs/703ea4d2-6375-4f57-b54c-cce06808ebb3) custom field to `Enable` on the required Windows Workstation.

### Q: Where do I specify the NTP servers?

> Use the [cPVAL Time Sync Peer List](/docs/5944866d-106f-46d5-83f7-75dfd19180fd) custom field to specify the NTP servers that the endpoint should use or can be specified in the script parameters.

### Q: What is the purpose of the Resync Windows Time automation?

> The [Automation - Resync Windows Time](/docs/03e5954a-55fe-49f3-ba46-861156f83947) automation manually forces Windows Time to synchronize using the time source that is currently configured on the endpoint.


### Q: What happens when Time Sync Compliance is disabled?

> When the [cPVAL Enable Time Sync Compliance](/docs/703ea4d2-6375-4f57-b54c-cce06808ebb3) custom field is not set to `Enable`, the endpoint is not targeted by the Time Sync Compliance compound condition and the configuration automation is not triggered.

### Q: What happens if the NTP peer list is changed?

> When the NTP peer list is updated, the next execution of the [Automation - Configure Time Sync](/docs/002bd069-639a-488a-935f-17182ae8efe0) automation applies the updated peer configuration and synchronizes Windows Time using the new configuration.

### Q: Is any manual configuration required on the endpoint?

> No. The solution uses the configured NinjaOne custom fields, automation, and compound condition to configure Windows Time automatically.

### Q: Why is the automation not running on an endpoint?

> Verify that:
> * The endpoint is a supported Windows Workstation.
> * The [cPVAL Enable Time Sync Compliance](/docs/703ea4d2-6375-4f57-b54c-cce06808ebb3) custom field is set to `Enable`.
> * The [cPVAL Time Sync Peer List](/docs/5944866d-106f-46d5-83f7-75dfd19180fd) custom field contains valid NTP peers.
> * The [Compound Condition - Time Sync Compliance - Workstations](/docs/e63a5602-1618-45cd-a9ae-b877fccc2ea7) is applied to the endpoint's agent policy.
> * The Windows Time service is available and running.
> * The endpoint can communicate with the configured NTP servers.


## Changelog

### 2026-10-02

- Initial version of the document
