---
id: '66340c96-0b27-472f-add9-609e38df48c1'
slug: /66340c96-0b27-472f-add9-609e38df48c1
title: 'Active Directory - Users with Domain Admin Audit'
title_meta: 'Active Directory - Users with Domain Admin Audit'
keywords: ['active-directory', 'domain-admins', 'user-audit', 'primary-domain-controller', 'report', 'knowledge-base']
description: 'Lists every user account with Domain Admin rights on each domain, with sign-in and password details, and reports them across all clients.'
tags: ['active-directory', 'accounts', 'auditing', 'security', 'report']
draft: false
unlisted: false
last_update:
  date: 2026-10-14
---

## Purpose

The **Active Directory - Users with Domain Admin Audit** solution answers a key security question: *who can administer this domain?*

It lists every account with Domain Admin rights, including accounts that get the rights through nested groups. For each account it shows whether the account is enabled, when it last signed in, and when its password was last changed. Use it to find disabled, stale or never-used admin accounts before they become a risk.

## How It Works

1. **Collect:** The [Active Directory - Users with Domain Admin Audit](/docs/f990a8c2-84fe-4f1a-8687-dcc412dfd520) automation runs daily on the primary domain controllers and stores the account list in [cPVAL Domain Admin Users](/docs/dca9853f-1914-4f06-a700-a3a9926a123f).
2. **Report (optional):** The [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation runs on one device and turns that field into organization and global Knowledge Base articles and CSV files.

## Key Capabilities

* **Complete Admin List:** Includes accounts that get Domain Admin rights through nested groups.
* **Stale Account Spotting:** Days since last sign-in and days since the last password change, ready to sort.
* **Password Expiry at a Glance:** Shows accounts whose password never expires or has already expired.
* **Safe to Run on Every Domain Controller:** Only the primary domain controller collects data. The others skip the run.
* **Cross-Client View:** Optional Knowledge Base articles and CSV files per organization and for all clients.

---

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Managed By | Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL Domain Admin Users](/docs/dca9853f-1914-4f06-a700-a3a9926a123f) | *(blank)* | *HTML table* | Device | Automation | Stores the accounts with Domain Admin rights. Filled on the primary domain controller only. |
| [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) | *(blank)* | `8GIo0Y646lsxWXj5HBO6RcUoKY7` | System | Manual | Optional. Only needed for the reports. Identifies the API application the report automation signs in as. |
| [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) | *(blank)* | `67h5w58GIo0Y646lsxWXj5...` | System | Manual | Optional. Only needed for the reports. Authenticates that API application. |

### Automations

| Name | Function |
| :--- | :--- |
| [Active Directory - Users with Domain Admin Audit](/docs/f990a8c2-84fe-4f1a-8687-dcc412dfd520) | Collects every account with Domain Admin rights on the primary domain controller and stores them in the custom field. |
| [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) | Optional. Builds the Knowledge Base articles and CSV files from the custom field. |

### Audit Reports

| Name | Function |
| :--- | :--- |
| [Active Directory - Users With Domain Admin](/docs/630beb69-029d-4103-8fd0-f5d3f3311bfc) | Lists the Domain Admin accounts of every client, per organization and for all clients. |

---

## Implementation

### Step 1: Create the Custom Field

* [Custom Field: cPVAL Domain Admin Users](/docs/dca9853f-1914-4f06-a700-a3a9926a123f)

### Step 2: Create the Automation

* [Automation: Active Directory - Users with Domain Admin Audit](/docs/f990a8c2-84fe-4f1a-8687-dcc412dfd520)

Set **Run as** to `System`.

### Step 3: Schedule the Data Collection

Schedule the automation to run **once per day** against the **cPVAL Primary Domain Controller** group. This group holds the primary domain controllers, based on the **cPVAL Roles Detected** custom field.

:::note  
Running it against every domain controller is also safe. Only the primary domain controller collects data, and the others skip the run.  
:::

### Step 4 (Optional): Set Up the Reports

Skip this step if the partner does not need reports. The data is still collected and kept on each device in the custom field.

1. **API application and credentials:** Create the NinjaOne API application and fill the [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) fields, as described in [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687). If they are already set up for another ProVal reporting solution, reuse them.
2. **Report automation:** Create the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation.
3. **Schedule:** Schedule the report automation to run once per day against **one** device, such as a server that is always online. Run it after the data collection. Use the values listed in the **Report Settings** section of the Audit Report:
   * [Audit Report: Active Directory - Users With Domain Admin](/docs/630beb69-029d-4103-8fd0-f5d3f3311bfc)

:::note  
Knowledge Base articles need the **NinjaOne Documentation** app. Without it, set **Report Output** to **Local CSV Files** to create only the CSV files on the device that runs the report.  
:::

---

## Comprehensive FAQs

### General Usage

**Q. What does this solution do?**  
**A:** It lists every account with Domain Admin rights on each domain, with sign-in and password details, and keeps the list up to date every day.

**Q. Why does only the primary domain controller collect data?**  
**A:** Every domain controller sees the same accounts. Collecting on one of them avoids duplicate rows for the same domain.

**Q. Are accounts in nested groups included?**  
**A:** Yes. An account that gets Domain Admin rights through another group is listed too.

**Q. Our Domain Admins group was renamed. Does it still work?**  
**A:** Yes. The automation finds the group even when it has been renamed or has a non-English name.

**Q. How accurate is the last sign-in date?**  
**A:** It can trail the real sign-in by up to 14 days when another domain controller handled the sign-in. This is how Active Directory shares sign-in times between domain controllers.

**Q. We moved the primary domain controller role. What happens?**  
**A:** The new primary domain controller fills its field on the next run. The old one keeps its last list, which you can spot by its old `DataCollectionDate`. Clear that field on the old domain controller to remove it from the reports.

### Reports

**Q. Do I need the reports?**  
**A:** No. They are optional. Without them, the data is still collected and kept on each device in its custom field.

**Q. What do I need for the Knowledge Base articles?**  
**A:** The **NinjaOne Documentation** app, an API application with its credentials in [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e), and the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation. Without the Documentation app, the report can create CSV files only.

**Q. How current are the reports?**  
**A:** They show the data from the last collection on each device. The `DataCollectionDate` column shows when each device reported. Schedule the report after the data collection so it picks up the latest data.

**Q. Where are the CSV files saved?**  
**A:** On the device that runs the report automation, under `C:\ProgramData\_Automation\Report`. The exact path is listed in each Audit Report document.

---

## Changelog

### 2026-10-14

- Initial version of the document.
