---
id: '4de25a7e-823c-4b69-8048-8c00f65e1c17'
slug: /4de25a7e-823c-4b69-8048-8c00f65e1c17
title: 'Application Installation Reporting'
title_meta: 'Application Installation Reporting'
keywords: ['application', 'software', 'inventory', 'report', 'knowledge-base', 'kb', 'ninja-api', 'client-credentials', 'wildcard', 'audit']
description: 'An API-driven reporting solution for NinjaOne that counts devices carrying a named application across every organization and publishes the results as organization-level and tenant-wide Knowledge Base articles.'
tags: ['report', 'api']
draft: true
unlisted: false
last_update:
  date: 2026-09-16
---

## Purpose

The **Application Installation Reporting** solution answers a question that comes up constantly and is tedious to answer by hand: *where is this application actually installed?*

Given an application name, it counts the devices carrying it in every organization in the tenant, then publishes the findings as Knowledge Base articles — a device-level detail article for each organization, and optionally a single tenant-wide summary. The output lands where technicians already look for client documentation, rather than in a spreadsheet that someone has to circulate and that goes stale the moment it is sent.

It is built for software audits, licence reconciliation, end-of-life tracking, and the "how widely is this deployed?" question that precedes any rollout or removal decision.

## How It Works

The solution runs as a single automation, working entirely from data NinjaOne has already collected:

1. **Authenticate:** The script reads the Client ID and Client Secret from two secure custom fields and exchanges them for an access token using the OAuth 2.0 client credentials grant. Nothing is passed in as a script parameter, so the credential never appears in automation run history.
2. **Query:** It calls the NinjaOne Public API for the tenant's organizations, devices, and software inventory, matching each installed application against the name you supplied — exactly, or as a partial match when wildcard matching is enabled.
3. **Publish:** For each organization it writes a Knowledge Base article listing the devices that carry a match. When the global report is enabled, it also writes one tenant-wide article summarising the counts per organization.

Because the report is assembled centrally from API data rather than collected per endpoint, the automation runs on **one** scheduled device, not across the fleet.

## Key Capabilities

* **Tenant-Wide Coverage From a Single Run:** One execution reports across every organization, with no per-endpoint deployment and no agent-side collection.
* **Exact or Wildcard Matching:** Match an application name precisely, or partially to capture editions, channels, and version-suffixed variants in a single report.
* **Two Levels of Output:** Per-organization device detail for client-facing work, and an optional tenant-wide summary for internal rollups. The global report is independently switchable.
* **Publishes Where People Look:** Results land as Knowledge Base articles in a folder you nominate, rather than as an export that has to be distributed manually.
* **Templated Article Names:** `OrgName` and `TimeStamp` tokens keep article names meaningful and prevent successive runs from colliding.
* **Credentials Held Securely:** The API credential lives in secure custom fields, read at runtime and never exposed in script parameters or run output.
* **Least-Privilege API Access:** The API application needs only read and documentation-write scopes; remote control permissions are deliberately not granted.

---

## Associated Content

### Custom Fields

> **Note on Enablement:** Both fields below must be populated before the first run. The automation cannot obtain an access token without them and will exit without producing a report.

| Name | Default | Example | Level | Managed By | Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) | *(blank)* | `8GIo0Y646lsxWXj5HBO6RcUoKY7` | System | Manual | Identifies the API application the reporting automation authenticates as. |
| [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) | *(blank)* | `67h5w58GIo0Y646lsxWXj5...` | System | Manual | Authenticates that API application. Shown by NinjaOne only once, at creation. |

### Automations

| Name | Function |
| :--- | :--- |
| [Application Installation Report - Organization and Global KB](/docs/d128edba-4851-4810-8b99-c94e0ac0780a) | Authenticates against the NinjaOne Public API, counts devices carrying the named application per organization, and publishes the organization and global Knowledge Base articles. |

---

## Implementation

### Step 1: Create the API Application

The solution authenticates as a registered NinjaOne API application. Create it under **Administration → Apps → API → Client App IDs → Add**, configured as **API Services (machine-to-machine)** with the **Monitoring** and **Management** scopes and the **Client credentials** grant type only.

Full field-by-field configuration, including why **Control** is deliberately left unchecked, is documented in [API Application Configuration](/docs/d128edba-4851-4810-8b99-c94e0ac0780a#api-application-configuration).

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

* [Automation: Application Installation Report - Organization and Global KB](/docs/d128edba-4851-4810-8b99-c94e0ac0780a)

Set **Run as** to `System`, and confirm the **Instance URL** parameter matches the region your tenant is hosted in.

### Step 5: Run or Schedule the Report

Run the automation against a single reliable device — a server or a permanently-on workstation. Supply the application name, decide whether wildcard matching and the global report are wanted, and set the article and folder names.

For recurring audits, schedule it on that one device. The `TimeStamp` token keeps each run's articles distinct, so successive runs build a history rather than overwriting one another.

> **⚠️ Do not deploy this across the fleet.** Every execution reports on the entire tenant. Running it on many devices produces duplicate articles and repeated API load for no additional information.

---

## Comprehensive FAQs

### General Usage

**Q. What does this solution actually do?**
**A:** You give it an application name. It works out how many devices in each of your organizations have that application installed, and writes the answer into Knowledge Base articles — one per organization listing the actual devices, plus an optional tenant-wide summary.

**Q. Does it need to run on every machine?**
**A:** No, and it shouldn't. It reads inventory NinjaOne has already collected, through the API. One run on one device covers the whole tenant.

**Q. Where does the data come from?**
**A:** The NinjaOne Public API, which serves the software inventory NinjaOne already holds for each device. The report is therefore only as current as the last inventory scan — it does not query endpoints live.

**Q. Can I report on more than one application at a time?**
**A:** Each run targets one application name. Wildcard matching widens that to any name containing your value, so a single run can cover an application's variants, but reporting on genuinely unrelated applications means separate runs.

### Matching & Output

**Q. What does Use Wildcard actually change?**
**A:** With it off, only an exact name match counts. With it on, any installed application whose name contains your value counts. Searching `Google Chrome` with wildcards on will also pick up *Google Chrome Beta*; with it off, it won't.

**Q. Should I leave wildcard matching on?**
**A:** It depends what the report is for. For "is this product present anywhere", wildcards give a fuller picture. For licence counting, exact matching avoids inflating the number with editions you are not licensing.

**Q. What is the difference between the organization article and the global article?**
**A:** The organization article is the detail — which devices in that client carry the application. The global article is the rollup — how many devices per organization across the tenant. Use the first for client conversations and the second for internal decisions.

**Q. Can I produce only the organization articles?**
**A:** Yes. Leave **Global Level Report** unchecked and no tenant-wide article is written.

**Q. What do OrgName and TimeStamp do in the article names?**
**A:** They are replaced with live values as each article is created, so names stay meaningful and successive runs do not collide. `OrgName` only resolves on organization articles — a global article spans every organization, so it has no single value there.

**Q. What happens if I run the report twice with the same article name?**
**A:** Keep `TimeStamp` in the name and each run produces a distinct, dated article, building a history over time. Remove it and repeat runs will contend for the same article name.

### Credentials & Permissions

**Q. Why is the credential in custom fields rather than script parameters?**
**A:** Parameters are visible in automation configuration and run history. Secure custom fields keep the secret out of both, while remaining readable by the script at runtime.

**Q. What permissions does the API application actually need?**
**A:** **Monitoring**, to read organizations, devices, and software inventory, and **Management**, to write the Knowledge Base articles. **Control** is not required and should not be granted — the automation never takes remote action on a device.

**Q. I lost the Client Secret. Can I recover it?**
**A:** No. NinjaOne shows it once. Generate a new secret on the same API application and update the custom field. Note that generating a new secret invalidates the old one immediately, so do both together or the next run will fail.

**Q. The automation fails at authentication. What should I check?**
**A:** In order: that both custom fields are populated and have not been truncated on paste; that the **Instance URL** matches your tenant's region; that the API application has the Client credentials grant type enabled; and that the secret has not been regenerated without updating the field.

**Q. Can other automations share this API application?**
**A:** Yes, and the credential fields are named generically for that reason. If you do share it, review whether the other automation's requirements change the scopes — and bear in mind that rotating the secret then affects everything using it.

### Scheduling & Practical Use

**Q. Which device should I run it on?**
**A:** Any single machine that is reliably online — typically a server. The device itself is incidental; it is only the execution host, and nothing about it appears in the report.

**Q. How often should it run?**
**A:** As often as the question needs answering. Monthly suits licence reconciliation and audit trails; ad-hoc runs suit one-off questions like scoping a rollout or confirming a removal has completed.

**Q. The numbers look lower than expected. Why?**
**A:** Usually one of three things: the application is registered under a name that differs from what you searched (try wildcard matching), devices have not checked in recently so their inventory is stale, or the application genuinely is not installed where it was assumed to be.

---

## Changelog

### 2026-09-16

- Initial version of the document.
