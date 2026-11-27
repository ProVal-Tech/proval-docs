---
id: '11eb7169-75d8-456d-a28d-fe9aff517ac7'
slug: /11eb7169-75d8-456d-a28d-fe9aff517ac7
title: 'SSTP VPN Deployment'
title_meta: 'SSTP VPN Deployment'
keywords: ['sstp', 'vpn', 'peap', 'radius', 'split-tunneling', 'routes', 'deployment']
description: 'Creates or updates the all-user SSTP VPN connection on a Windows device from the SSTP custom fields, changing it only when a setting differs.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The **SSTP VPN Deployment** task creates the all-user SSTP VPN connection on a Windows device, or updates the one that's already there, from the SSTP custom fields. It's scheduled to run once a day against the [SSTP VPN Deployment](/docs/9848ce15-c56b-4ccd-a80f-95b21e5a4f75) group, so every device in scope keeps the settings made for its company, its site or the device itself.

### How it works

1. **Check the scope.** The task reads the SSTP_Enable fields. A device that's excluded, or whose OS type isn't covered, is skipped without changes.
2. **Read the settings.** Each setting is taken from the device, then the site, then the company. The most specific level that holds a value wins.
3. **Prepare the sign-in.** For `PEAP with Server Validation`, the task finds a valid certificate for each RADIUS server in the Local Machine Trusted Root store and trusts it for the connection. Devices joined to the domain in SSTP_DNS_Suffix, or one of its child domains, connect with their Windows sign-in.
4. **Create or update the connection.** A missing connection is created. An existing one is compared with the settings and changed only when something differs.
5. **Sync the routes.** When SSTP_Routes is set, missing routes are added and any others are removed.
6. **Report the result.** The result goes to the Script Log. A failure fails the task and, when SSTP_Ticket is `Enabled`, creates one ticket for the device through the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow. The ticket closes after the next successful run.

**Requirements:** Windows PowerShell 5.1. For `PEAP with Server Validation`, a valid certificate for each RADIUS server in the Local Machine Trusted Root store. For tickets, the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow and the real webhook URL in [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab).

## Sample Run

![Image1](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image1.webp)

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Group: SSTP VPN Deployment](/docs/9848ce15-c56b-4ccd-a80f-95b21e5a4f75)
- [Custom Field: SSTP_Enable](/docs/57f97be2-e027-413f-919e-b6984ce6fba1)
- [Custom Field: SSTP_Enable_Site](/docs/48e518b7-2a64-42a1-9d00-8e46136a86d2)
- [Custom Field: SSTP_Enable_Endpoint](/docs/2e5a736d-431a-46ba-a157-e6f7e6740843)
- [Custom Field: SSTP_Connection](/docs/d3fcba13-20f4-4371-a743-937868c9e8b3)
- [Custom Field: SSTP_Connection_Site](/docs/942398eb-d14a-4cea-aee8-f392bad853b2)
- [Custom Field: SSTP_Connection_Endpoint](/docs/0d156eb8-142a-48a5-bbc7-00cab392c9c1)
- [Custom Field: SSTP_Server](/docs/74c3c252-1d85-4860-8e89-4c4e7d2804d7)
- [Custom Field: SSTP_Server_Site](/docs/89c2001e-dfce-43fd-b622-23a6e0f9703f)
- [Custom Field: SSTP_Server_Endpoint](/docs/ee49791e-8522-4665-a2c1-f302db20d2fc)
- [Custom Field: SSTP_DNS_Suffix](/docs/ff024303-4ef0-4f07-826e-a3913095299c)
- [Custom Field: SSTP_DNS_Suffix_Site](/docs/968485ea-c81e-4a03-b72b-b25a7bca424c)
- [Custom Field: SSTP_DNS_Suffix_Endpoint](/docs/2a2f7930-d975-4d1b-9b93-808992ddd76c)
- [Custom Field: SSTP_Auth](/docs/dd2b757e-651a-4ccc-bfb1-48e32eed9675)
- [Custom Field: SSTP_Auth_Site](/docs/698120a1-a717-4e8c-9fb1-3953922a513b)
- [Custom Field: SSTP_Auth_Endpoint](/docs/42272ef7-d912-464b-9d05-cb4d53e36467)
- [Custom Field: SSTP_RADIUS_1](/docs/ba58573e-5e74-4241-a036-a1519acf426d)
- [Custom Field: SSTP_RADIUS_1_Site](/docs/e3fc5254-1fcd-4f1c-b98e-8c6f5335a120)
- [Custom Field: SSTP_RADIUS_1_Endpoint](/docs/b4a4ebdd-1ae4-4539-87d9-3d723126664b)
- [Custom Field: SSTP_RADIUS_2](/docs/42062995-a0d7-45b7-a6b7-f9aeeb952cfb)
- [Custom Field: SSTP_RADIUS_2_Site](/docs/6e6ea744-fb29-4980-9da2-5ac322367933)
- [Custom Field: SSTP_RADIUS_2_Endpoint](/docs/3e97136c-12d2-4a09-8712-b80b3ae55edc)
- [Custom Field: SSTP_Split](/docs/bafcaae5-8322-4ff2-9ace-26f27aa5df81)
- [Custom Field: SSTP_Split_Site](/docs/52919877-7d53-49a4-becf-cee8f59fd697)
- [Custom Field: SSTP_Split_Endpoint](/docs/4c605b55-44bf-436f-8530-333aeb2f0045)
- [Custom Field: SSTP_Routes](/docs/5e860000-83c9-49fa-87fa-f046fe1a793f)
- [Custom Field: SSTP_Routes_Site](/docs/096bae7a-48e6-4a36-8339-e1ce79e573e4)
- [Custom Field: SSTP_Routes_Endpoint](/docs/9210fae1-36ed-4210-86a8-b69f117ca50b)
- [Custom Field: SSTP_Ticket](/docs/9525e584-65f9-4540-bab4-d968878b5df9)
- [Custom Field: SSTP_Ticket_Site](/docs/5cca5370-e9c6-4c17-83dc-89d8f028de2f)
- [Custom Field: SSTP_Ticket_Endpoint](/docs/9dc62dce-b999-40ad-adea-b1cfd9d6808f)
- [Custom Field: Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab)
- [Workflows: CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57)

## User Parameters

This task has no parameters.

## Custom Fields

The task reads these fields through its Set Pre-defined Variable rows. A blank site or endpoint field uses the level above.

| Name | Example | Level | Type | Default Value | Description |
| --- | --- | --- | --- | --- | --- |
| [SSTP_Enable](/docs/57f97be2-e027-413f-919e-b6984ce6fba1) | `Windows Workstations Only` | `Company` | `Dropdown` | `Disabled` | Company-level SSTP VPN deployment scope by OS type. Overridden by Site or Endpoint settings. The default value acts as the portal-wide default. |
| [SSTP_Enable_Site](/docs/48e518b7-2a64-42a1-9d00-8e46136a86d2) | `Windows Workstations Only` | `Site` | `Dropdown` |  | Site-level override for the SSTP VPN deployment scope by OS type. Overrides Company settings, but overridden by Endpoint. |
| [SSTP_Enable_Endpoint](/docs/2e5a736d-431a-46ba-a157-e6f7e6740843) | `Enabled` | `Endpoint` | `Dropdown` |  | Endpoint-level SSTP VPN deployment switch. Overrides Site and Company settings, whatever the device OS. |
| [SSTP_Connection](/docs/d3fcba13-20f4-4371-a743-937868c9e8b3) | `Contoso VPN` | `Company` | `Text Box` |  | Company-level name of the SSTP VPN connection as users see it in Windows. Overridden by Site or Endpoint settings. |
| [SSTP_Connection_Site](/docs/942398eb-d14a-4cea-aee8-f392bad853b2) | `Contoso VPN` | `Site` | `Text Box` |  | Site-level override for the SSTP VPN connection name. Overrides Company settings, but overridden by Endpoint. |
| [SSTP_Connection_Endpoint](/docs/0d156eb8-142a-48a5-bbc7-00cab392c9c1) | `Contoso VPN` | `Endpoint` | `Text Box` |  | Endpoint-level override for the SSTP VPN connection name. Overrides Site and Company settings. |
| [SSTP_Server](/docs/74c3c252-1d85-4860-8e89-4c4e7d2804d7) | `remote.contoso.com` | `Company` | `Text Box` |  | Company-level SSTP VPN server address. Overridden by Site or Endpoint settings. |
| [SSTP_Server_Site](/docs/89c2001e-dfce-43fd-b622-23a6e0f9703f) | `remote.contoso.com` | `Site` | `Text Box` |  | Site-level override for the SSTP VPN server address. Overrides Company settings, but overridden by Endpoint. |
| [SSTP_Server_Endpoint](/docs/ee49791e-8522-4665-a2c1-f302db20d2fc) | `remote.contoso.com` | `Endpoint` | `Text Box` |  | Endpoint-level override for the SSTP VPN server address. Overrides Site and Company settings. |
| [SSTP_DNS_Suffix](/docs/ff024303-4ef0-4f07-826e-a3913095299c) | `corp.contoso.com` | `Company` | `Text Box` |  | Company-level DNS suffix for the SSTP VPN connection. Also names the domain whose members connect with their Windows logon credentials, and completes short RADIUS server names. Overridden by Site or Endpoint settings. |
| [SSTP_DNS_Suffix_Site](/docs/968485ea-c81e-4a03-b72b-b25a7bca424c) | `corp.contoso.com` | `Site` | `Text Box` |  | Site-level override for the SSTP VPN DNS suffix. Overrides Company settings, but overridden by Endpoint. |
| [SSTP_DNS_Suffix_Endpoint](/docs/2a2f7930-d975-4d1b-9b93-808992ddd76c) | `corp.contoso.com` | `Endpoint` | `Text Box` |  | Endpoint-level override for the SSTP VPN DNS suffix. Overrides Site and Company settings. |
| [SSTP_Auth](/docs/dd2b757e-651a-4ccc-bfb1-48e32eed9675) | `PEAP with Server Validation` | `Company` | `Dropdown` | `PEAP with Server Validation` | Company-level authentication method for the SSTP VPN connection. PEAP with Server Validation checks the RADIUS server certificate. Overridden by Site or Endpoint settings. |
| [SSTP_Auth_Site](/docs/698120a1-a717-4e8c-9fb1-3953922a513b) | `PEAP with Server Validation` | `Site` | `Dropdown` |  | Site-level override for the SSTP VPN authentication method. Overrides Company settings, but overridden by Endpoint. |
| [SSTP_Auth_Endpoint](/docs/42272ef7-d912-464b-9d05-cb4d53e36467) | `PEAP with Server Validation` | `Endpoint` | `Dropdown` |  | Endpoint-level override for the SSTP VPN authentication method. Overrides Site and Company settings. |
| [SSTP_RADIUS_1](/docs/ba58573e-5e74-4241-a036-a1519acf426d) | `nps01` | `Company` | `Text Box` |  | Company-level primary RADIUS server, used by PEAP with Server Validation. Its certificate must be in the Local Machine Trusted Root store. Overridden by Site or Endpoint settings. |
| [SSTP_RADIUS_1_Site](/docs/e3fc5254-1fcd-4f1c-b98e-8c6f5335a120) | `nps01` | `Site` | `Text Box` |  | Site-level override for the primary RADIUS server. Overrides Company settings, but overridden by Endpoint. |
| [SSTP_RADIUS_1_Endpoint](/docs/b4a4ebdd-1ae4-4539-87d9-3d723126664b) | `nps01` | `Endpoint` | `Text Box` |  | Endpoint-level override for the primary RADIUS server. Overrides Site and Company settings. |
| [SSTP_RADIUS_2](/docs/42062995-a0d7-45b7-a6b7-f9aeeb952cfb) | `nps02` | `Company` | `Text Box` |  | Company-level secondary RADIUS server, used by PEAP with Server Validation. Its certificate must be in the Local Machine Trusted Root store. Overridden by Site or Endpoint settings. |
| [SSTP_RADIUS_2_Site](/docs/6e6ea744-fb29-4980-9da2-5ac322367933) | `nps02` | `Site` | `Text Box` |  | Site-level override for the secondary RADIUS server. Overrides Company settings, but overridden by Endpoint. |
| [SSTP_RADIUS_2_Endpoint](/docs/3e97136c-12d2-4a09-8712-b80b3ae55edc) | `nps02` | `Endpoint` | `Text Box` |  | Endpoint-level override for the secondary RADIUS server. Overrides Site and Company settings. |
| [SSTP_Split](/docs/bafcaae5-8322-4ff2-9ace-26f27aa5df81) | `Enabled` | `Company` | `Dropdown` | `Disabled` | Company-level split tunneling setting for the SSTP VPN connection. Overridden by Site or Endpoint settings. |
| [SSTP_Split_Site](/docs/52919877-7d53-49a4-becf-cee8f59fd697) | `Enabled` | `Site` | `Dropdown` |  | Site-level override for split tunneling. Overrides Company settings, but overridden by Endpoint. |
| [SSTP_Split_Endpoint](/docs/4c605b55-44bf-436f-8530-333aeb2f0045) | `Enabled` | `Endpoint` | `Dropdown` |  | Endpoint-level override for split tunneling. Overrides Site and Company settings. |
| [SSTP_Routes](/docs/5e860000-83c9-49fa-87fa-f046fe1a793f) | `10.10.0.0/16,192.168.20.0/24` | `Company` | `Text Box` |  | Company-level list of networks routed through the SSTP VPN connection. When set, the routes of the connection are made to match this list. Overridden by Site or Endpoint settings. |
| [SSTP_Routes_Site](/docs/096bae7a-48e6-4a36-8339-e1ce79e573e4) | `10.10.0.0/16,192.168.20.0/24` | `Site` | `Text Box` |  | Site-level override for the networks routed through the SSTP VPN connection. Overrides Company settings, but overridden by Endpoint. |
| [SSTP_Routes_Endpoint](/docs/9210fae1-36ed-4210-86a8-b69f117ca50b) | `10.10.0.0/16,192.168.20.0/24` | `Endpoint` | `Text Box` |  | Endpoint-level override for the networks routed through the SSTP VPN connection. Overrides Site and Company settings. |
| [SSTP_Ticket](/docs/9525e584-65f9-4540-bab4-d968878b5df9) | `Enabled` | `Company` | `Dropdown` | `Disabled` | Company-level ticketing for failed SSTP VPN deployments. Enabled creates a ticket when the deployment fails on a device and closes it after the next successful run. Overridden by Site or Endpoint settings. |
| [SSTP_Ticket_Site](/docs/5cca5370-e9c6-4c17-83dc-89d8f028de2f) | `Enabled` | `Site` | `Dropdown` |  | Site-level override for ticketing on failed SSTP VPN deployments. Overrides Company settings, but overridden by Endpoint. |
| [SSTP_Ticket_Endpoint](/docs/9dc62dce-b999-40ad-adea-b1cfd9d6808f) | `Enabled` | `Endpoint` | `Dropdown` |  | Endpoint-level override for ticketing on failed SSTP VPN deployments. Overrides Site and Company settings. |
| [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) | `https://webhook.<rmm-domain>/<instance-id>` | `Company` | `Text Box` | `https://webhook.myconnectwise.net/...` | Webhook URL of the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow, entered as the field's default value. Needed only for tickets. |

:::note

Field values are placed in the script as they're typed, so type a single quote twice, for example `Contoso''s VPN`.

:::

## Results

The Script Log shows one of these. A successful result also lists the authentication method, the split tunneling setting and the routes.

| Script Log starts with | What it means |
|---|---|
| `The SSTP VPN connection <Name> was created.` | The connection didn't exist and was created. |
| `The SSTP VPN connection <Name> was updated (<Settings>).` | The settings in brackets differed from the custom fields and were corrected. |
| `The SSTP VPN connection <Name> already matched the configured settings, so it was not changed.` | Nothing to do. |
| `Skipped: This device is excluded by SSTP_Enable_Endpoint.` | The device is excluded. Nothing was changed. |
| `Skipped: SSTP VPN deployment does not include this workstation.` or `... this server.` | The site or company scope doesn't cover the device's OS type. Nothing was changed. |
| `<Field> is not set.` | A required setting is empty at every level. Fill in the named field. The task fails. |
| `PEAP with Server Validation needs a RADIUS server.` | Fill in SSTP_RADIUS_1. The task fails. |
| `No valid certificate for the RADIUS server <Name> is installed in the Local Machine Trusted Root store.` | Install the RADIUS server's certificate on the device, or replace an expired one. The task fails. |
| `SSTP_Routes holds an invalid network: <Value>.` | Enter the routes in network/prefix format, such as `10.10.0.0/16`. The task fails. |
| `Failed to create the VPN connection` or `Failed to update the VPN connection` | Windows refused the change. The rest of the text says why. The task fails. |

## Task Setup Path

- **Tasks Path:** `AUTOMATION` ➞ `Tasks`
- **Task Type:** `Script Editor`

## Task Creation

### Description

- **Name:** `SSTP VPN Deployment`
- **Description:**

```PlainText
Creates or updates the all-user SSTP VPN connection from the SSTP custom fields. Changes the connection only when a setting differs.

https://content.provaltech.com/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7
```

- **Category:** `Security`
- **Script Isolation Mode:** `Inactive`

![Image2](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image2.webp)

### Script Editor

Add the rows in this order. Rows 1 to 31 load the custom fields into the variables that the script reads.

#### Row 1 Function: Set Pre-defined Variable ( @endpointLevelEnable@ = SSTP_Enable_Endpoint )

- **Notes:** `endpointLevelEnable`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelEnable`
- **Custom Field:** `SSTP_Enable_Endpoint (ENUM - ENDPOINT)`

![Image3](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image3.webp)

#### Row 2 Function: Set Pre-defined Variable ( @endpointLevelConnectionName@ = SSTP_Connection_Endpoint )

- **Notes:** `endpointLevelConnectionName`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelConnectionName`
- **Custom Field:** `SSTP_Connection_Endpoint (STRING - ENDPOINT)`

![Image4](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image4.webp)

#### Row 3 Function: Set Pre-defined Variable ( @endpointLevelServerAddress@ = SSTP_Server_Endpoint )

- **Notes:** `endpointLevelServerAddress`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelServerAddress`
- **Custom Field:** `SSTP_Server_Endpoint (STRING - ENDPOINT)`

![Image5](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image5.webp)

#### Row 4 Function: Set Pre-defined Variable ( @endpointLevelDnsSuffix@ = SSTP_DNS_Suffix_Endpoint )

- **Notes:** `endpointLevelDnsSuffix`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelDnsSuffix`
- **Custom Field:** `SSTP_DNS_Suffix_Endpoint (STRING - ENDPOINT)`

![Image6](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image6.webp)

#### Row 5 Function: Set Pre-defined Variable ( @endpointLevelAuthMethod@ = SSTP_Auth_Endpoint )

- **Notes:** `endpointLevelAuthMethod`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelAuthMethod`
- **Custom Field:** `SSTP_Auth_Endpoint (ENUM - ENDPOINT)`

![Image7](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image7.webp)

#### Row 6 Function: Set Pre-defined Variable ( @endpointLevelRadiusServer1@ = SSTP_RADIUS_1_Endpoint )

- **Notes:** `endpointLevelRadiusServer1`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelRadiusServer1`
- **Custom Field:** `SSTP_RADIUS_1_Endpoint (STRING - ENDPOINT)`

![Image8](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image8.webp)

#### Row 7 Function: Set Pre-defined Variable ( @endpointLevelRadiusServer2@ = SSTP_RADIUS_2_Endpoint )

- **Notes:** `endpointLevelRadiusServer2`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelRadiusServer2`
- **Custom Field:** `SSTP_RADIUS_2_Endpoint (STRING - ENDPOINT)`

![Image9](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image9.webp)

#### Row 8 Function: Set Pre-defined Variable ( @endpointLevelSplitTunnel@ = SSTP_Split_Endpoint )

- **Notes:** `endpointLevelSplitTunnel`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelSplitTunnel`
- **Custom Field:** `SSTP_Split_Endpoint (ENUM - ENDPOINT)`

![Image10](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image10.webp)

#### Row 9 Function: Set Pre-defined Variable ( @endpointLevelRoutes@ = SSTP_Routes_Endpoint )

- **Notes:** `endpointLevelRoutes`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelRoutes`
- **Custom Field:** `SSTP_Routes_Endpoint (STRING - ENDPOINT)`

![Image11](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image11.webp)

#### Row 10 Function: Set Pre-defined Variable ( @endpointLevelTicket@ = SSTP_Ticket_Endpoint )

- **Notes:** `endpointLevelTicket`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelTicket`
- **Custom Field:** `SSTP_Ticket_Endpoint (ENUM - ENDPOINT)`

![Image12](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image12.webp)

#### Row 11 Function: Set Pre-defined Variable ( @locationLevelEnable@ = SSTP_Enable_Site )

- **Notes:** `locationLevelEnable`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelEnable`
- **Custom Field:** `SSTP_Enable_Site (ENUM - SITE)`

![Image13](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image13.webp)

#### Row 12 Function: Set Pre-defined Variable ( @locationLevelConnectionName@ = SSTP_Connection_Site )

- **Notes:** `locationLevelConnectionName`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelConnectionName`
- **Custom Field:** `SSTP_Connection_Site (STRING - SITE)`

![Image14](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image14.webp)

#### Row 13 Function: Set Pre-defined Variable ( @locationLevelServerAddress@ = SSTP_Server_Site )

- **Notes:** `locationLevelServerAddress`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelServerAddress`
- **Custom Field:** `SSTP_Server_Site (STRING - SITE)`

![Image15](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image15.webp)

#### Row 14 Function: Set Pre-defined Variable ( @locationLevelDnsSuffix@ = SSTP_DNS_Suffix_Site )

- **Notes:** `locationLevelDnsSuffix`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelDnsSuffix`
- **Custom Field:** `SSTP_DNS_Suffix_Site (STRING - SITE)`

![Image16](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image16.webp)

#### Row 15 Function: Set Pre-defined Variable ( @locationLevelAuthMethod@ = SSTP_Auth_Site )

- **Notes:** `locationLevelAuthMethod`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelAuthMethod`
- **Custom Field:** `SSTP_Auth_Site (ENUM - SITE)`

![Image17](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image17.webp)

#### Row 16 Function: Set Pre-defined Variable ( @locationLevelRadiusServer1@ = SSTP_RADIUS_1_Site )

- **Notes:** `locationLevelRadiusServer1`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelRadiusServer1`
- **Custom Field:** `SSTP_RADIUS_1_Site (STRING - SITE)`

![Image18](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image18.webp)

#### Row 17 Function: Set Pre-defined Variable ( @locationLevelRadiusServer2@ = SSTP_RADIUS_2_Site )

- **Notes:** `locationLevelRadiusServer2`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelRadiusServer2`
- **Custom Field:** `SSTP_RADIUS_2_Site (STRING - SITE)`

![Image19](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image19.webp)

#### Row 18 Function: Set Pre-defined Variable ( @locationLevelSplitTunnel@ = SSTP_Split_Site )

- **Notes:** `locationLevelSplitTunnel`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelSplitTunnel`
- **Custom Field:** `SSTP_Split_Site (ENUM - SITE)`

![Image20](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image20.webp)

#### Row 19 Function: Set Pre-defined Variable ( @locationLevelRoutes@ = SSTP_Routes_Site )

- **Notes:** `locationLevelRoutes`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelRoutes`
- **Custom Field:** `SSTP_Routes_Site (STRING - SITE)`

![Image21](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image21.webp)

#### Row 20 Function: Set Pre-defined Variable ( @locationLevelTicket@ = SSTP_Ticket_Site )

- **Notes:** `locationLevelTicket`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelTicket`
- **Custom Field:** `SSTP_Ticket_Site (ENUM - SITE)`

![Image22](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image22.webp)

#### Row 21 Function: Set Pre-defined Variable ( @clientLevelEnable@ = SSTP_Enable )

- **Notes:** `clientLevelEnable`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelEnable`
- **Custom Field:** `SSTP_Enable (ENUM - COMPANY)`

![Image23](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image23.webp)

#### Row 22 Function: Set Pre-defined Variable ( @clientLevelConnectionName@ = SSTP_Connection )

- **Notes:** `clientLevelConnectionName`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelConnectionName`
- **Custom Field:** `SSTP_Connection (STRING - COMPANY)`

![Image24](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image24.webp)

#### Row 23 Function: Set Pre-defined Variable ( @clientLevelServerAddress@ = SSTP_Server )

- **Notes:** `clientLevelServerAddress`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelServerAddress`
- **Custom Field:** `SSTP_Server (STRING - COMPANY)`

![Image25](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image25.webp)

#### Row 24 Function: Set Pre-defined Variable ( @clientLevelDnsSuffix@ = SSTP_DNS_Suffix )

- **Notes:** `clientLevelDnsSuffix`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelDnsSuffix`
- **Custom Field:** `SSTP_DNS_Suffix (STRING - COMPANY)`

![Image26](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image26.webp)

#### Row 25 Function: Set Pre-defined Variable ( @clientLevelAuthMethod@ = SSTP_Auth )

- **Notes:** `clientLevelAuthMethod`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelAuthMethod`
- **Custom Field:** `SSTP_Auth (ENUM - COMPANY)`

![Image27](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image27.webp)

#### Row 26 Function: Set Pre-defined Variable ( @clientLevelRadiusServer1@ = SSTP_RADIUS_1 )

- **Notes:** `clientLevelRadiusServer1`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelRadiusServer1`
- **Custom Field:** `SSTP_RADIUS_1 (STRING - COMPANY)`

![Image28](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image28.webp)

#### Row 27 Function: Set Pre-defined Variable ( @clientLevelRadiusServer2@ = SSTP_RADIUS_2 )

- **Notes:** `clientLevelRadiusServer2`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelRadiusServer2`
- **Custom Field:** `SSTP_RADIUS_2 (STRING - COMPANY)`

![Image29](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image29.webp)

#### Row 28 Function: Set Pre-defined Variable ( @clientLevelSplitTunnel@ = SSTP_Split )

- **Notes:** `clientLevelSplitTunnel`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelSplitTunnel`
- **Custom Field:** `SSTP_Split (ENUM - COMPANY)`

![Image30](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image30.webp)

#### Row 29 Function: Set Pre-defined Variable ( @clientLevelRoutes@ = SSTP_Routes )

- **Notes:** `clientLevelRoutes`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelRoutes`
- **Custom Field:** `SSTP_Routes (STRING - COMPANY)`

![Image31](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image31.webp)

#### Row 30 Function: Set Pre-defined Variable ( @clientLevelTicket@ = SSTP_Ticket )

- **Notes:** `clientLevelTicket`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelTicket`
- **Custom Field:** `SSTP_Ticket (ENUM - COMPANY)`

![Image32](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image32.webp)

#### Row 31 Function: Set Pre-defined Variable ( @clientLevelTicketMgmtWebhookUrl@ = Ticket_Mgmt_Webhook_Url )

- **Notes:** `clientLevelTicketMgmtWebhookUrl`
- **Continue on Failure:** `True`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelTicketMgmtWebhookUrl`
- **Custom Field:** `Ticket_Mgmt_Webhook_Url (STRING - COMPANY)`

![Image33](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image33.webp)

#### Row 32 Function: PowerShell script

- **Notes:** `<Leave it Blank>`
- **Use Generative AI Assist for script creation:** `False`
- **Expected time of script execution in seconds:** `1800`
- **Continue on Failure:** `False`
- **Run As:** `System`
- **Operating System:** `Windows`
- **PowerShell Script Editor:**

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/sstp-vpn-deployment/script.ps1)

For detailed instructions on creating the task, see [Workflow for Implementing Engineers](https://github.com/ProVal-Tech/cw-rmm#-workflow-for-implementing-engineers).

![Image34](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image34.webp)

#### Row 33 Function: Script Log

- **Notes:** `<Leave it Blank>`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Script Log Message:** `%Output%`

![Image35](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image35.webp)

:::note

Row 31 is set to **Continue on Failure** `True`, so the task still runs in an environment without the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) field. Tickets are off there.

:::

## Completed Task

![Image36](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image36.webp)

## Schedule Task

### Task Details

- **Name:** `SSTP VPN Deployment`
- **Description:**

```PlainText
Creates or updates the all-user SSTP VPN connection from the SSTP custom fields. Changes the connection only when a setting differs.

https://content.provaltech.com/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7
```

- **Category:** `Security`

![Image37](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image37.webp)

### Schedule

- **Schedule Type:** `Schedule`
- **Timezone:** `Local Machine Time`
- **Start:** `<Current Date>`
- **Trigger:** `Time` `At` `<Current Time>`
- **Recurrence:** `Every day`
- **Execute at next agent check-in:** `True`
- **Stop After:** `15`
- **Unit:** `Day(s)`

![Image38](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image38.webp)

### Targeted Resource

- **Device Group:** `SSTP VPN Deployment`

![Image39](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image39.webp)

### Completed Scheduled Task

![Image40](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image40.webp)

## Output

- Script Log
- `C:\ProgramData\_Automation\Script\SstpVpnDeployment\Ticket_Open.flag`, only while a ticket opened by the task is still open. Don't delete it, or the ticket won't be closed automatically.

## Ticketing

When SSTP_Ticket is `Enabled` for the device, a failed run creates one ticket through the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow. Later failures don't create more tickets while it's open. The first successful run closes it. This needs the real webhook URL in [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab).

**Subject:**

```PlainText
SSTP VPN Deployment - <ComputerName>
```

**Body:**

```PlainText
The SSTP VPN deployment failed on this device.

Computer: <ComputerName>
Connection: <Connection name>
Reason: <The failure from the Script Log>

What to do: Fix the cause given in the reason, then run the SSTP VPN Deployment task on the device, or wait for its next daily run.

The ticket closes automatically after the next successful run.
```

The [Results](#results) table explains each reason and what to do about it.

**Closing note:**

```PlainText
The SSTP VPN deployment succeeded on a later run. The ticket is being closed automatically.

<The result from the Script Log>
```

**Example Ticket:**

![Image41](../../../static/img/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7/image41.webp)

## Changelog

### 2026-11-27

- Initial version of the document
