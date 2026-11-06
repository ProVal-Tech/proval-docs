---
id: 'fad08ef4-122c-4df2-8cb3-aad1b285a473'
slug: /fad08ef4-122c-4df2-8cb3-aad1b285a473
title: 'ISP Connection Monitoring'
title_meta: 'ISP Connection Monitoring'
keywords: ['isp', 'internet', 'connection', 'failover', 'wan', 'public ip', 'firewall', 'monitoring']
description: 'Monitor each internet line at sites with more than one ISP in NinjaOne, and open a ticket when a line goes down or fails over.'
tags: ['solution', 'monitoring', 'networking', 'ticketing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-06
---

## Purpose

ISP Connection Monitoring tells you when an internet line at a site goes down or fails over, even while the site stays online on another line. A Windows device at the site requests public IP lookup sites that the site's firewall routes out specific ISP lines, and confirms that each one returns that line's public IP. When a line doesn't answer, or its traffic comes back through another line, a ConnectWise Manage ticket opens with the name of the line and what went wrong.

The checks for each device are kept in the [cPVAL ISP Connection Checks](/docs/48803081-ae39-4113-bb40-41c1c5dba610) custom field. The [ISP Connection Monitoring](/docs/9f23f871-6125-47ab-8a46-429893104702) compound condition runs the [ISP Connection Monitor](/docs/64936e58-3cd2-4430-b40f-d9a2419786e2) automation on every device with checks. It then opens a ticket through the [ISP Connection Monitoring](/docs/03a8e269-aad5-486d-befd-0617c2b3a6c1) ticket template when a check fails. The latest result of every check is saved to [cPVAL ISP Connection Status](/docs/2da0d0c6-7dd0-4fbc-a846-bfec4b22219e).

**Platform:** `NinjaOne`

### Key Capabilities

- **Failover detection** – Catches a line that's down while the site keeps working on its backup line. A device offline alert can't see this, because the device never goes offline.
- **One condition for every site** – The checks live in a device custom field, so a single compound condition covers every monitored device. To monitor a new line, add a line of text to the device's field.
- **Clear tickets** – The ticket lists the failed lines first, each with the error or the IP that came back, followed by the lines that passed.
- **Status at a glance** – cPVAL ISP Connection Status shows when the lines were last checked and the result of each line.
- **Full IP or prefix** – Each check matches the full public IP of the line, or the start of it for lines whose IP changes within a range.

### Important Caveats & Behavior

- **The firewall routing comes first** – Each lookup site must be routed out one specific ISP line on the site's firewall. Without that routing, every check leaves through the same line and the results mean nothing. Ask the site's network administrator which lookup site goes out which line.
- **A site with only one line** – When a site's only line goes down, the device can't reach NinjaOne, so it can't report the failure. The NinjaOne device offline alert covers that case. The solution adds the most value at sites with two or more lines.
- **Prefixes can match other addresses** – A check passes when the response contains the expected text anywhere. A short prefix, such as `66.`, can also match the middle of another address. Use the full IP whenever the line has a static IP.
- **Mistakes in a check open a ticket** – An entry that isn't in the `Name|URL|ExpectedText` format counts as a failed check. That way, a typo raises a ticket instead of quietly stopping the monitoring of a line.
- **Lookup sites are third-party services** – If a lookup site is down, its check fails even though the line is fine. The ticket shows the error, so you can switch the check to another lookup site routed out the same line.
- **One schedule for every device** – The compound condition runs every 6 minutes on every device it covers.
- **Device time** – The check time in cPVAL ISP Connection Status is the device's local time.

## How It Works

1. A technician adds the checks for each ISP line to cPVAL ISP Connection Checks on one device at the site that stays online.
2. Every 6 minutes, the ISP Connection Monitoring compound condition runs the ISP Connection Monitor automation on each device with checks.
3. The automation requests each lookup site with a 10 second timeout and confirms the response contains the line's expected public IP. It saves the check time and a `PASS` or `FAIL` line for each check to cPVAL ISP Connection Status.
4. When any check fails, the compound condition opens a ConnectWise Manage ticket that includes the automation's output.
5. New failures are added to the open ticket. Once every line passes again, the condition resets and the ticket closes.

## Prerequisites

- A firewall at each site that routes each lookup site out a specific ISP line.
- One Windows device per site that stays online, preferably a server, with PowerShell 5.1.
- Internet access from that device to the lookup sites in its checks.
- ConnectWise Manage connected to NinjaOne, for the tickets.

## Associated Content

### Custom Fields

These fields appear on the **ISP Connection Monitoring** tab of Windows devices.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [cPVAL ISP Connection Checks](/docs/48803081-ae39-4113-bb40-41c1c5dba610) | Device | Multi-line | The ISP line checks for the device, one per line. A device is monitored only when this field holds a check. |
| [cPVAL ISP Connection Status](/docs/2da0d0c6-7dd0-4fbc-a846-bfec4b22219e) | Device | Multi-line | When the lines were last checked, and a `PASS` or `FAIL` line for each check. |

### Automation

| Name | Purpose |
|---|---|
| [ISP Connection Monitor](/docs/64936e58-3cd2-4430-b40f-d9a2419786e2) | Runs the device's checks and saves the result to cPVAL ISP Connection Status. Run by the compound condition. |

### Ticket Template

| Name | Purpose |
|---|---|
| [ISP Connection Monitoring](/docs/03a8e269-aad5-486d-befd-0617c2b3a6c1) | Opens a ConnectWise Manage ticket when an ISP line is down or has failed over, and closes it when every line passes again. |

### Monitor

| Name | Type | Purpose |
|---|---|---|
| [ISP Connection Monitoring](/docs/9f23f871-6125-47ab-8a46-429893104702) | Compound Condition | Runs ISP Connection Monitor every 6 minutes on devices with checks, and opens a ticket when a check fails. |

## Implementation

### Step 1: Create the custom fields

Create the custom fields and add them to the **ISP Connection Monitoring** tab of the **Windows Systems** role.

- [Custom Field: cPVAL ISP Connection Checks](/docs/48803081-ae39-4113-bb40-41c1c5dba610)
- [Custom Field: cPVAL ISP Connection Status](/docs/2da0d0c6-7dd0-4fbc-a846-bfec4b22219e)

### Step 2: Create the automation

Add the automation to the NinjaOne automation library. Don't schedule it. The compound condition runs it.

- [Automation: ISP Connection Monitor](/docs/64936e58-3cd2-4430-b40f-d9a2419786e2)

### Step 3: Create the ticket template

Create the ticket template so a ticket opens when a line fails. Set the board, ticket type and other ticket settings to match your ConnectWise Manage setup.

- [Ticket Template: ISP Connection Monitoring](/docs/03a8e269-aad5-486d-befd-0617c2b3a6c1)

### Step 4: Create the compound condition

Add the compound condition to the **Windows Server Policy [Default]**. If a site has no server, also create it for the workstation that runs the checks. See the FAQ for how.

- [Compound Condition: ISP Connection Monitoring](/docs/9f23f871-6125-47ab-8a46-429893104702)

### Step 5: Add the checks

For each site, pick one device that stays online. Ask the site's network administrator which lookup site the firewall routes out each ISP line, and the public IP of each line. Then add one check per line to the device's cPVAL ISP Connection Checks, in the format `Name|URL|ExpectedText`.

- [Custom Field: cPVAL ISP Connection Checks](/docs/48803081-ae39-4113-bb40-41c1c5dba610)

You'll know it worked when cPVAL ISP Connection Status on the device shows a recent **Last Checked** time and a `PASS` line for each ISP line. To test the ticket, add a temporary check with an IP the line doesn't have. A ticket opens within 6 minutes. Remove the check, and the ticket closes the next time every line passes.

## FAQ

### Q: How do I add a new ISP line to monitor?

> 1. Ask the site's network administrator which lookup site the firewall routes out the new line, and the line's public IP.
> 2. Run the ISP Connection Monitor automation on the device with only the new check in the **Checks** script variable, and confirm the `PASS` line shows the expected IP.
> 3. Add the check as a new line in the device's **cPVAL ISP Connection Checks**.
>
> If the field was blank before, the compound condition picks up the device on its next run.

### Q: Can I use a workstation to run the checks, for example at a site without a server?

> Yes. The compound condition is set up on the **Windows Server Policy [Default]** because a server usually stays online at the site, but the solution isn't limited to servers. Any Windows device that stays online at the site can run the checks. Create the very same compound condition, with the same settings, in one of these places:
>
> - The **Windows Workstation Policy**, to cover every workstation with checks.
> - The policy applied to that workstation.
> - A policy override on that device only.

### Q: Which lookup sites can I use?

> Any site that returns the public IP it sees, such as `https://myexternalip.com/raw`, `https://icanhazip.com/` or `http://checkip.dyndns.com/`. Sites that return only the IP are the easiest to read. Each check on a device needs a different lookup site, since the firewall routes each site out one line.

### Q: Should I use the full IP or a prefix?

> Use the full IP whenever the line has a static IP. Use a prefix, such as `203.0.113`, only when the line's IP changes within a known range. A short prefix can match the middle of another address, which could hide a failover.

### Q: Can I monitor a line with a dynamic IP?

> Yes, with a prefix that covers the provider's range. For a line with no predictable range, set the expected text to something every response contains, such as `Current` on `http://checkip.dyndns.com/`. That only confirms the lookup site answered, so it catches a line that's down but not one that has failed over.

### Q: The ticket shows a different IP than expected. What does that mean?

> The lookup site's traffic left through another line, so the line in the check has most likely failed over, for example `FAIL: Primary ISP Connection Monitor, returned 198.51.100.25`. Check that line's status on the site's firewall. If the line is up, confirm the firewall still routes that lookup site out the line, and that the line's public IP hasn't changed.

### Q: The ticket shows a timeout or a name that couldn't be resolved. What should I check?

> The lookup site didn't answer through that line. Check these:
>
> 1. The line's status on the site's firewall.
> 2. The firewall route for that lookup site still points to the line.
> 3. The lookup site opens from another network. If it's down, switch the check to another lookup site routed out the same line.

### Q: Why didn't I get a ticket when a site's only internet line went down?

> The device couldn't reach NinjaOne to run the check or report it. The NinjaOne device offline alert covers that case.

### Q: cPVAL ISP Connection Status is empty or hasn't updated. Why?

> Check these:
>
> 1. The device is online in NinjaOne.
> 2. Its agent policy, or a policy override on the device, includes the **ISP Connection Monitoring** compound condition.
> 3. **cPVAL ISP Connection Checks** on the device holds at least one check in the `Name|URL|ExpectedText` format.
> 4. The automation's activity details on the device don't show an error.

### Q: A ticket says a check is invalid. How do I fix it?

> The entry isn't in the `Name|URL|ExpectedText` format. Each line needs exactly two `|` characters and a value in all three parts. Correct the entry in **cPVAL ISP Connection Checks**, and the ticket closes the next time every line passes.

### Q: How do I stop monitoring a device?

> Clear its **cPVAL ISP Connection Checks**. The compound condition no longer runs the checks on that device. cPVAL ISP Connection Status keeps the last result.

## Changelog

### 2026-11-06

- Initial version of the document
