---
id: 'd613b809-a8cf-4dde-b3fa-e36b13223eeb'
slug: /d613b809-a8cf-4dde-b3fa-e36b13223eeb
title: 'Antivirus Status Audit'
title_meta: 'Antivirus Status Audit'
keywords: ['antivirus', 'antivirus-status', 'antivirus-missing', 'ninja-api', 'client-credentials', 'report', 'knowledge-base']
description: 'Copies the antivirus status NinjaOne holds for every Windows and Mac device into a custom field and reports antivirus status and missing antivirus across all clients.'
tags: ['antivirus', 'auditing', 'security', 'api', 'report']
draft: false
unlisted: false
last_update:
  date: 2026-10-14
---

## Purpose

The **Antivirus Status Audit** solution answers two questions: *which devices have no antivirus, and which antivirus is switched off or out of date?*

It uses the antivirus information NinjaOne already shows under **Details > Antivirus**, and stores it in a custom field on every Windows and Mac device. Devices without antivirus are marked too.

## How It Works

1. **Collect:** The [Antivirus Status Audit](/docs/3724a85b-929e-4f55-9b3a-bd13a21e1d05) automation runs daily on **one** device. It signs in to the NinjaOne API with the credentials in [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e), reads the antivirus status of every device, and writes it to [cPVAL Antivirus Status](/docs/20cf7c66-038f-4e83-857e-4c68ac5de358) on each device.
2. **Report (optional):** The [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation turns that field into two sets of Knowledge Base articles and CSV files: **Antivirus Status** and **Antivirus Missing**.

Because the data comes from NinjaOne, nothing is collected on the devices themselves.

## Key Capabilities

* **One Run Covers Every Device:** A single scheduled device updates every Windows and Mac device in NinjaOne.
* **Missing Antivirus Detection:** Devices without antivirus get a row with `Is Installed` set to `No`.
* **Several Products per Device:** A device with two antivirus products gets two rows.
* **Low API Load:** Devices are only updated when their antivirus status changed.
* **Cross-Client View:** Optional Antivirus Status and Antivirus Missing reports per organization and for all clients.

---

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Managed By | Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL Antivirus Status](/docs/20cf7c66-038f-4e83-857e-4c68ac5de358) | *(blank)* | *HTML table* | Device | Automation | Stores the antivirus products of each device, or a row showing that none was found. |
| [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) | *(blank)* | `8GIo0Y646lsxWXj5HBO6RcUoKY7` | System | Manual | Required. Identifies the API application the automations sign in as. |
| [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) | *(blank)* | `67h5w58GIo0Y646lsxWXj5...` | System | Manual | Required. Authenticates that API application. |

### Automations

| Name | Function |
| :--- | :--- |
| [Antivirus Status Audit](/docs/3724a85b-929e-4f55-9b3a-bd13a21e1d05) | Reads the antivirus status of every device from the NinjaOne API and stores it in the custom field. |
| [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) | Optional. Builds the Knowledge Base articles and CSV files from the custom field. |

### Audit Reports

| Name | Function |
| :--- | :--- |
| [Antivirus Status](/docs/460013c8-7bb9-4773-ac6b-a03689575e79) | Lists the antivirus products of every device with antivirus. |
| [Antivirus Missing](/docs/08cc8eb4-7a6f-4a17-a34e-218e5ff5e547) | Lists every device without antivirus. |

---

## Implementation

:::tip  
If the API application and both credential fields are already set up for another ProVal reporting solution, Steps 1 to 3 are already done.  
:::

### Step 1: Create the API Application

Create a NinjaOne API application under **Administration → Apps → API → Client App IDs → Add**, as **API Services (machine-to-machine)** with the **Monitoring** and **Management** scopes and the **Client credentials** grant type. The full configuration is described in [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687).

:::warning  
Copy the Client Secret immediately. NinjaOne shows it only once, when the application is created.  
:::

### Step 2: Create the Custom Fields

* [Custom Field: cPVAL Antivirus Status](/docs/20cf7c66-038f-4e83-857e-4c68ac5de358)
* [Custom Field: cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88)
* [Custom Field: cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e)

### Step 3: Populate the Credentials

* Client ID → `cPVAL Ninja API Client ID`
* Client Secret → `cPVAL Ninja API Client Secret`

### Step 4: Create the Automation

* [Automation: Antivirus Status Audit](/docs/3724a85b-929e-4f55-9b3a-bd13a21e1d05)

Set **Run as** to `System`, and set the NinjaOne instance of the partner in the script, for example `us2.ninjarmm.com`.

### Step 5: Schedule the Data Collection

Schedule the automation to run **once per day** against **one** device, such as a server that is always online.

:::warning  
Do not deploy it across the fleet. One run updates every device. Running it on many devices repeats the same work and API load for no benefit.  
:::

### Step 6 (Optional): Set Up the Reports

Skip this step if the partner does not need reports. The data is still collected and kept on each device in the custom field.

1. **API application and credentials:** Already done in Steps 1 to 3. The report automation uses the same API application and credential fields.
2. **Report automation:** Create the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation.
3. **Schedule:** Schedule the report automation to run once per day against **one** device, such as a server that is always online. Run it after the data collection. Use the values listed in the **Report Settings** section of each Audit Report, one schedule per report:
   * [Audit Report: Antivirus Status](/docs/460013c8-7bb9-4773-ac6b-a03689575e79)
   * [Audit Report: Antivirus Missing](/docs/08cc8eb4-7a6f-4a17-a34e-218e5ff5e547)

:::note  
Knowledge Base articles need the **NinjaOne Documentation** app. Without it, set **Report Output** to **Local CSV Files** to create only the CSV files on the device that runs the report.  
:::

---

## Comprehensive FAQs

### General Usage

**Q. What does this solution do?**  
**A:** It copies the antivirus status NinjaOne shows for each device into a custom field, so you can report antivirus status and missing antivirus across all clients.

**Q. Where does the data come from?**  
**A:** From NinjaOne itself, the same data shown under **Details > Antivirus**. Nothing runs on the devices.

**Q. Which devices are included?**  
**A:** Windows workstations, Windows servers and Macs.

**Q. Why does it run on one device only?**  
**A:** One run reads and updates every device through the API. Running it on more devices only repeats the same work.

**Q. What does Product State OFF mean?**  
**A:** The antivirus is installed but switched off. The device is not protected.

**Q. Why is DataCollectionDate blank for some devices?**  
**A:** NinjaOne has never received antivirus information from those devices.

**Q. What is the difference between the two reports?**  
**A:** **Antivirus Status** lists devices that have antivirus. **Antivirus Missing** lists devices without it. Both come from the same custom field.

### Credentials & Permissions

**Q. Why are the credentials in custom fields instead of script parameters?**  
**A:** Parameters are visible in the automation settings and run history. Secure custom fields keep the secret out of both.

**Q. I lost the Client Secret. Can I recover it?**  
**A:** No. Generate a new secret on the same API application and update the custom field right away. The old secret stops working immediately.

**Q. The automation fails at sign-in. What should I check?**  
**A:** That both credential fields are filled and complete, that the instance in the script matches your NinjaOne region, and that the API application has the **Client credentials** grant type.

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
