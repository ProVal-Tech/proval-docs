---
id: '81d8fa31-72c7-4339-a107-4a41a3e489f5'
slug: /81d8fa31-72c7-4339-a107-4a41a3e489f5
title: 'Network Adapter Details'
title_meta: 'Network Adapter Details'
keywords: ['network','adapter']
description: 'This solution gathers active network adapter details and updates custom fields with DHCP status, IP type, and DNS server information for accurate visibility and reporting.'
tags: ['dhcp','dns','custom-fields','networking']
draft: false
unlisted: false
---

## Purpose

This solution is designed to collect active network adapter details from managed devices and automatically populate custom fields with key network configuration information, including DHCP status, IP address type (Static or Dynamic), and DNS server addresses. The collected data enables improved visibility, reporting, and device grouping based on network configuration, ensuring accurate monitoring and streamlined network management.

## Associated Content

| Content                                                                     | Type           | Function                                                                                                                                                                                                  |
| --------------------------------------------------------------------------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [cPVAL DHCP Status](/docs/ce67cff7-8ff2-42a6-8b05-c9dc22bd3392)             | `Custom Field` | Displays whether DHCP is enabled or disabled on the active network adapter.                                                                                                                               |
| [cPVAL DNS Server](/docs/050b6b01-ec88-4c11-8e37-f5f34df0daa3)              | `Custom Field` | Displays the DNS server address(es) configured on the active network adapter.                                                                                                                             |
| [cPVAL IP Type](/docs/9e7a6f5f-f8c7-483d-9b0a-c04dc10f7cb4)                 | `Custom Field` | Displays whether the IP configuration type is `DHCP (Dynamic)` or `Static` on the active network adapter.                                                                                             |
| [Network Adapter Details](/docs/50ff2168-46f2-4c9b-8ccc-0d3671178267)       | `Script`       | Identifies the first active network adapter that is up, has an IPv4 address, and a default gateway. Collects DHCP status, IP type (DHCP or Static), and DNS server addresses in a comma-separated format. |
| [cPVAL Network Adapter Details](/docs/e30843b6-3891-4793-b1a2-f18a749ac4f5) | `Group`        | Displays all network adapter–related custom fields, including DHCP status, IP type, and DNS server addresses.                                                                                             |
| [Check Network Adapter Details - Workstations](/docs/5b8facb5-f73d-45d2-b06e-58ffc6b5ce61) | `Compound condition`        | This compound condition is used to facilitate the automated execution of the script to update the custom field on Windows workstations. It ensures the custom field is updated only on eligible systems.    |
| [Check Network Adapter Details - Servers](/docs/3c1b4d06-33e8-4e0c-8f2c-3bc93ebd36ae) | `Compound condition`        | This compound condition is used to facilitate the automated execution of the script to update the custom field on Windows servers. It ensures the custom field is updated only on eligible systems.                                                                                            |
| [custom Field - cPVAL Network Adapter Details](/docs/fb89116d-060f-4787-95af-efdd731765d2) | `Custom Field`      | Displays all network adapter–related custom fields, including DHCP status, IP type, and DNS server addresses.                                                                                             |

## Implementation

### Step 1

Create the [cPVAL Network Adapter Details](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) group.

### Step 2

Create the [cPVAL DHCP Status](/docs/ce67cff7-8ff2-42a6-8b05-c9dc22bd3392)  custom field.
Create the [cPVAL DNS Server](/docs/050b6b01-ec88-4c11-8e37-f5f34df0daa3)  custom field
Create the [cPVAL IP Type](/docs/9e7a6f5f-f8c7-483d-9b0a-c04dc10f7cb4) custom field
Create the [custom Field - cPVAL Network Adapter Details](/docs/fb89116d-060f-4787-95af-efdd731765d2) custom field

### Step 3

Create the [Network Adapter Details](/docs/50ff2168-46f2-4c9b-8ccc-0d3671178267) automation.

### Step 4

Create the - [Check Network Adapter Details - Workstations](/docs/5b8facb5-f73d-45d2-b06e-58ffc6b5ce61) Compound condition
Create the - [Check Network Adapter Details - Servers](/docs/3c1b4d06-33e8-4e0c-8f2c-3bc93ebd36ae) Compound condition

## FAQ

Q1. What is the purpose of this script?

A. This script collects network adapter details from a Windows machine and updates custom fields with the DHCP status, IP configuration type (DHCP or Static), and configured DNS server addresses.

Q2. Which network adapter does the script evaluate?

A. The script identifies the first active network adapter that:

- Is in an Up state
- Has an IPv4 address
- Has a default gateway (indicating internet connectivity)

Q3. How does the script determine whether DHCP is enabled?

A. It checks the NetIPv4Interface.Dhcp property of the active adapter and reports the status as Enabled or Disabled.

Q4. How is the IP type (DHCP or Static) identified?

A. If DHCP is enabled, the IP type is reported as DHCP. If DHCP is disabled, the IP type is reported as Static.

Q5. How are DNS server addresses collected?

A. The script retrieves all IPv4 DNS server addresses configured on the active adapter and outputs them as a comma-separated list.

Q6. What happens if no active network adapter is found?

A. If no qualifying adapter is detected, the script safely returns:

- Unknown for DHCP status
- Unknown for IP type
- Not Configured for DNS servers

This prevents incorrect or empty data from being stored.

Q7. Which custom fields are updated by this script?

A. The script updates the following NinjaOne custom fields:

- cpvalDhcpStatus – DHCP Enabled/Disabled
- cpvalIpType – DHCP or Static
- cpvalDnsServer – DNS server addresses (comma-separated)

Q8. Does this script require user interaction or login?

A. No. The script runs as System and does not require user login or interaction.

Q9. Is this script safe for compliance-sensitive environments?

A. Yes. The script is read-only in nature and does not modify network settings. It only collects configuration data and updates reporting fields.

Q10. What platforms are supported?

A. The script supports Windows systems across all architectures and is designed for automated execution via RMM tools.