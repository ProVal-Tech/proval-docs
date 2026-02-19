---
id: '172c15d2-01fd-421a-8954-67f6942e0e64'
slug: /172c15d2-01fd-421a-8954-67f6942e0e64
title: 'HyperV - Snapshot Age > 3 Days'
title_meta: 'HyperV - Snapshot Age > 3 Days'
keywords: ['hyper-v', 'snapshot', 'monitoring', 'database', 'alert']
description: 'This solution outlines the process for detecting and monitoring Hyper‑V Host servers that store snapshots older than 3 days from CW RMM.'
tags: ['windows', 'alerting', 'hyper-v']
draft: false
unlisted: false
---

## Purpose

This solution outlines the process for detecting and monitoring Hyper‑V Host servers that store snapshots older than 3 days from CW RMM.

## Associated Content

### Custom Fields

| Name                            | Example                    | Type     | Level    | Required | Purpose                                                                                             |
|----------------------------------|----------------------------|----------|----------|----------|-----------------------------------------------------------------------------------------------------|
| [HyperV Snapshot Age Monitoring](/docs/e0a288ec-c323-45bb-94b0-02071635ce45)        | Yes                        | Flag     | COMPANY  | Yes      | Check this box to enable alerts for HyperV Host servers of the client that have snapshots older than 3 days.                       |

### Group

| Name                                                                                  | Purpose                                                                               |
|---------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| [HyperV Snapshot Age Monitoring](/docs/21d5941d-f8ad-439c-a724-1e998972751c)       | Group of HyperV Host servers where monitoring for snapshots older than 3 days is enabled. |

### Monitor

| Name                                               | Type    | Schedule      | Purpose                                                                         |
|----------------------------------------------------|---------|---------------|---------------------------------------------------------------------------------|
| [HyperV - Snapshot Age > 3 Days](/docs/172c15d2-01fd-421a-8954-67f6942e0e64) | Script  | Hourly | Generate alerts for HyperV host snapshots that have turned 3 days old in the past hour. |

## Implementation

### Step 1: Create the Required Custom Field

Create the custom field defined above under `SETTINGS → Custom Fields` in CW RMM. See documentation page for configuration details.

- [HyperV Snapshot Age Monitoring](/docs/e0a288ec-c323-45bb-94b0-02071635ce45)  

### Step 2: Create the Dynamic Group

Create the group [HyperV Snapshot Age Monitoring](/docs/21d5941d-f8ad-439c-a724-1e998972751c) under `ENDPOINTS → Groups` as a dynamic group.

### Step 3: Set up the Monitor

Configure the monitor [HyperV - Snapshot Age > 3 Days](/docs/172c15d2-01fd-421a-8954-67f6942e0e64) under `ENDPOINTS → Alerts → Monitors` to target the monitoring enabled group, running every hour and generating a ticket for detected hosts.

## FAQ

### How do I enable this monitoring for specific clients?

> Enable monitoring by setting the **HyperV Snapshot Age Monitoring** custom field to `True` at the company level in CW RMM. Servers with the Hyper-V role that have this flag enabled will automatically be added to the monitoring group.

### How often does the monitor check for stale snapshots?

> The monitor runs every hour to detect snapshots that have become older than 3 days. This ensures timely alerts when snapshots cross the 3-day threshold.

### What counts as a stale snapshot?

> A snapshot is considered stale when its creation time is 3 or more days old. The monitor specifically alerts on snapshots that turned 3 days old within the past hour, helping you catch problematic snapshots soon after they exceed the threshold.

### What happens when a stale snapshot is detected?

> When the monitor detects a stale snapshot, it automatically generates a support ticket with details about the affected VM, snapshot name, creation time, and snapshot type. The same snapshot will only trigger one alert to avoid duplicate tickets.

### Which servers are included in the monitoring group?

> The **HyperV Snapshot Age Monitoring** dynamic group automatically includes all servers that meet both criteria:
>
>> - Have the Hyper-V role assigned
>> - Have the HyperV Snapshot Age Monitoring custom field enabled (`True`)

### Can I customize the 3-day threshold?

> The 3-day threshold is defined in the monitor script. To change this value, edit the `$threshold` variable at the top of the PowerShell script in the monitor configuration.

### What information is included in the alert?

> Alerts include:
>
>> - VM Name
>> - Snapshot Name
>> - Parent Snapshot Name (if applicable)
>> - Snapshot Type
>> - Creation Time
>
> This helps technicians quickly identify which snapshots need attention and understand their relationships.

### How are duplicate alerts prevented?

> The monitor maintains a stored object table that tracks which snapshots have been alerted on. New alerts are only generated for stale snapshots that haven't been previously reported, preventing notification fatigue.

### What should I do with the generated tickets?

> Technicians should review stale snapshots and either delete them (if no longer needed) or document why they're being retained. Old snapshots consume storage and can impact backup and recovery operations.
