---
id: 'ec53fd65-8cd1-4af6-9f78-b3fa97e54af1'
slug: /ec53fd65-8cd1-4af6-9f78-b3fa97e54af1
title: 'Offline Machines Reporting'
title_meta: 'Offline Machines Reporting'
keywords: ['offline', 'offline-machines', 'last-contact', 'threshold', 'inventory', 'report', 'knowledge-base', 'kb', 'ninja-api', 'client-credentials', 'audit']
description: 'An API-driven reporting solution for NinjaOne that lists every device that has not checked in for one or more day thresholds and publishes the results as organization-level and tenant-wide Knowledge Base articles.'
tags: ['report', 'api']
draft: false
unlisted: false
last_update:
  date: 2026-10-06
---

## Purpose

The **Offline Machines Reporting** solution answers a question every client review eventually asks: *which machines have stopped checking in, and for how long?*

For each day threshold you supply, it lists the devices whose last contact with NinjaOne is at least that old, then publishes the findings as Knowledge Base articles. Each organization with such a device gets an article listing them, and a tenant-wide article lists every one across all organizations. The output lands where technicians already look for client documentation, and it is refreshed in place on every run rather than exported to a spreadsheet that goes stale the moment it is sent.

It replaces the CW Automate *Offline Machines X days Detection per client [Global]* solution. NinjaOne cannot raise client-level tickets, so the same list is published as a Knowledge Base table laid out like an Automate dataview. It is built for identifying abandoned or retired hardware, reconciling agent counts before billing, cleaning up stale devices, and spotting machines that have quietly fallen out of management.

## How It Works

The solution runs as a single automation, working entirely from data NinjaOne has already collected:

1. **Authenticate:** The script reads the Client ID and Client Secret from two secure custom fields and exchanges them for an access token using the OAuth 2.0 client credentials grant. Nothing is passed in as a script parameter, so the credential never appears in automation run history.
2. **Query:** It calls the NinjaOne Public API for the tenant's organizations, locations, and devices, and works out how many full days have passed since each device last contacted NinjaOne.
3. **Publish:** For every threshold it writes one tenant-wide article listing all qualifying devices, plus one article for each organization that has at least one. Organizations with no device over a threshold receive no article for it.
4. **Clean Up:** If an organization article exists for a threshold in this run but that organization no longer has a device over it, the article is archived and deleted, so the folder only ever holds articles that list devices.

Because the report is assembled centrally from API data rather than collected per endpoint, the automation runs on **one** scheduled device, not across the fleet.

## Key Capabilities

* **Tenant-Wide Coverage From a Single Run:** One execution reports across every organization, with no per-endpoint deployment and no agent-side collection.
* **Several Thresholds at Once:** Supply `30, 60, 90` and each value gets its own set of articles in the same run, so short-term outages and long-abandoned machines are separated without extra runs.
* **Full Inventory Mode:** A threshold of `0` lists every machine, online or offline, with its last contact and the days elapsed since.
* **Two Levels of Output:** Per-organization tables for client-facing work, and a tenant-wide table for internal review.
* **Self-Maintaining Articles:** Article names carry no date, so each run updates the previous run's articles in place, and organization articles that would now be empty are removed. Articles for thresholds not supplied in a run are never touched.
* **Dataview-Style Columns:** Location, device name, last contact, days offline, and operating system, plus last logged-in user and device type (`Server`, `Desktop`, or `Laptop`) whenever NinjaOne reports them.
* **Credentials Held Securely:** The API credential lives in secure custom fields, read at runtime and never exposed in script parameters or run output.
* **Least-Privilege API Access:** The API application needs only the Monitoring and Management scopes; remote control permissions are deliberately not granted.

---

## Associated Content

### Custom Fields

> **Note on Enablement:** Both fields below must be populated before the first run. The automation cannot obtain an access token without them and will exit without producing a report. If they are already populated for another reporting solution, such as [Application Installation Reporting](/docs/4de25a7e-823c-4b69-8048-8c00f65e1c17), no further action is needed.

| Name | Default | Example | Level | Managed By | Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) | *(blank)* | `8GIo0Y646lsxWXj5HBO6RcUoKY7` | System | Manual | Identifies the API application the reporting automation authenticates as. |
| [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) | *(blank)* | `67h5w58GIo0Y646lsxWXj5...` | System | Manual | Authenticates that API application. Shown by NinjaOne only once, at creation. |

### Automations

| Name | Function |
| :--- | :--- |
| [Offline Machines Report - Organization and Global KB](/docs/bae00191-7c86-4ceb-96a9-f34f05b5ec9f) | Authenticates against the NinjaOne Public API, lists the devices offline for each supplied threshold, publishes the organization and global Knowledge Base articles, and removes organization articles that no longer list any device. |

---

## Implementation

> **💡 Already using another API reporting solution?** If the API application and both credential custom fields were set up for [Application Installation Reporting](/docs/4de25a7e-823c-4b69-8048-8c00f65e1c17), Steps 1 to 3 are already done. This solution uses the same scopes and the same credential, so go straight to [Step 4](#step-4-create-the-automation).

### Step 1: Create the API Application

The solution authenticates as a registered NinjaOne API application. Create it under **Administration → Apps → API → Client App IDs → Add**, configured as **API Services (machine-to-machine)** with the **Monitoring** and **Management** scopes and the **Client credentials** grant type only.

Full field-by-field configuration, including why **Control** is deliberately left unchecked, is documented in [API Application Configuration](/docs/bae00191-7c86-4ceb-96a9-f34f05b5ec9f#api-application-configuration).

> **⚠️ Copy the Client Secret immediately.** NinjaOne displays it once, at the moment the application is created. If the dialog is closed before it is copied, the secret cannot be retrieved — a new one must be generated, which invalidates the old one instantly.

### Step 2: Create Custom Fields

Create the two credential fields as described in their own documents. Each specifies the exact type, scope, permissions, and tab placement to use.

* [Custom Field: cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88)
* [Custom Field: cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e)

Both are **Secure** type at **System** scope, and both belong on the `Client_Credentials_API` tab.

### Step 3: Populate the Credentials

Copy the values issued in Step 1 into their respective fields:

* Client ID → `cPVAL Ninja API Client ID`
* Client Secret → `cPVAL Ninja API Client Secret`

### Step 4: Create the Automation

Create the automation as described in its document:

* [Automation: Offline Machines Report - Organization and Global KB](/docs/bae00191-7c86-4ceb-96a9-f34f05b5ec9f)

Set **Run as** to `System`, and confirm the **Instance URL** parameter matches the region your tenant is hosted in.

### Step 5: Run or Schedule the Report

Run the automation against a single reliable device — a server or a permanently-on workstation. Set **Threshold Days** to the day counts you want reported, for example `30, 60`.

For ongoing visibility, schedule it on that one device, daily or weekly. Article names are fixed, so each run refreshes the previous run's articles instead of adding new ones, and the Knowledge Base always shows the current state.

> **⚠️ Do not deploy this across the fleet.** Every execution reports on the entire tenant. Running it on many devices repeats the same sweep and API load once per machine for no additional information.

---

## Comprehensive FAQs

### General Usage

**Q. What does this solution actually do?**  
**A:** You give it one or more day counts. For each one, it finds every device that has not checked in to NinjaOne for at least that many days and writes the list into Knowledge Base articles — one per affected organization, plus a tenant-wide article.

**Q. Why Knowledge Base articles instead of tickets, as in CW Automate?**  
**A:** NinjaOne cannot create client-level tickets. It can raise device-level tickets from a compound condition, but script output only reaches those tickets through a time-limited detection script, and this report makes too many API calls to fit that limit. A Knowledge Base table keeps the per-client list in one place, as the Automate solution did.

**Q. Does it need to run on every machine?**  
**A:** No, and it shouldn't. It reads the last contact time NinjaOne already records for every device, through the API. One run on one device covers the whole tenant.

**Q. Where does the data come from?**  
**A:** The NinjaOne Public API. Each device's last contact time is recorded by NinjaOne whenever the agent checks in, so the report reflects the tenant as it stood at the moment the automation ran.

**Q. Which devices are included?**  
**A:** Windows, macOS, and Linux workstations and servers running the NinjaOne agent. Network devices, virtualization hosts, cloud monitors, and mobile devices are excluded.

### Thresholds & Output

**Q. What does Threshold Days do?**  
**A:** It sets how long a device must have been out of contact before it is reported. Supply several values separated by commas, such as `30, 60, 90`, and each gets its own set of articles. A device offline for 75 days appears in the 30-day and 60-day articles, but not the 90-day one.

**Q. What does a threshold of 0 do?**  
**A:** It lists every device, including those online right now, with its last contact and the days elapsed since. Use it when you want a full machine inventory per client rather than only the offline ones.

**Q. How exactly is "offline for X days" measured?**  
**A:** A device is listed once at least X full days have passed since its last contact. The **Offline Since Days** column shows the whole number of days, and **Last Contact** is shown in UTC.

**Q. What is the difference between the organization article and the global article?**  
**A:** The organization article lists the offline devices for that client, for client conversations. The global article lists every offline device across the tenant with an **Organization Name** column, for internal review and cleanup.

**Q. Why doesn't one of my organizations have an article?**  
**A:** It has no device over that threshold. Organization articles are only written when there is something to list, and an existing one is removed once its last qualifying device comes back online or is removed from NinjaOne.

**Q. What happens to articles from previous runs?**  
**A:** Articles for the thresholds in the current run are updated in place, and organization articles that would now be empty are removed. Articles for any threshold not in the current run are left alone, so if you stop reporting on `15`, delete the old 15-day articles manually.

**Q. Can I keep a history of previous reports?**  
**A:** Not with this solution. Article names deliberately carry no date, so every run replaces the previous one and the articles always show the current state. The collection time is shown in each article's caption line.

**Q. Why are the Last Logged In User or Device Type columns missing?**  
**A:** Those columns are added only when NinjaOne reported that information for at least one device in the article. **Device Type** can also be blank for an individual workstation when NinjaOne does not report its chassis type.

**Q. Can I change the folder or article names?**  
**A:** Yes, in the `#region variables` block of the script; they are not parameters. Articles written under the old names are no longer found or cleaned up after the change, so remove them manually.

### Credentials & Permissions

**Q. Why is the credential in custom fields rather than script parameters?**  
**A:** Parameters are visible in automation configuration and run history. Secure custom fields keep the secret out of both, while remaining readable by the script at runtime.

**Q. I already set up an API application for Application Installation Reporting. Do I need a new one?**  
**A:** No. Both solutions use the same custom fields and need the same Monitoring and Management scopes, so the existing credential works as it is.

**Q. What permissions does the API application actually need?**  
**A:** **Monitoring**, to read organizations, locations, and devices, and **Management**, to create, update, archive, and delete the Knowledge Base articles. **Control** is not required and should not be granted — the automation never takes remote action on a device.

**Q. I lost the Client Secret. Can I recover it?**  
**A:** No. NinjaOne shows it once. Generate a new secret on the same API application and update the custom field. Generating a new secret invalidates the old one immediately, so do both together or the next run of every automation sharing the credential will fail.

**Q. The automation fails at authentication. What should I check?**  
**A:** In order: that both custom fields are populated and have not been truncated on paste; that the **Instance URL** matches your tenant's region; that the API application has the Client credentials grant type enabled; and that the secret has not been regenerated without updating the field.

### Scheduling & Practical Use

**Q. Which device should I run it on?**  
**A:** Any single machine that is reliably online — typically a server. The device itself is incidental; it is only the execution host, and nothing about it appears in the report.

**Q. How often should it run?**  
**A:** Daily or weekly suits most environments. Each run replaces the previous one, so the schedule decides how current the articles are; a monthly run before billing or a client review also works well.

**Q. The list doesn't match what I see in the NinjaOne device list. Why?**  
**A:** Usually one of three things: the report counts full days only, so a device offline for 29 days and 23 hours is not yet in the 30-day list; devices that came back online after the run are still listed until the next one; or the device is a network device, cloud monitor, or other non-agent device, which the report excludes.

**Q. The global article says the table was truncated. What now?**  
**A:** The article reached the Knowledge Base size limit, which only happens with a very large number of devices, typically with a low threshold or `0` on a large tenant. The organization articles are unaffected and still list every device for their client; use a higher threshold if the global view needs to be complete.

---

## Changelog

### 2026-10-06

- Initial version of the document.
