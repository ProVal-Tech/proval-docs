---
id: '7dc8d18c-aab4-4ad1-80bc-4e7beef98530'
slug: /7dc8d18c-aab4-4ad1-80bc-4e7beef98530
title: 'Internet Speed Audit'
title_meta: 'Internet Speed Audit'
keywords: ['internet', 'speed', 'audit', 'monitoring', 'network', 'bandwidth', 'latency', 'report', 'custom-fields']
description: 'Runs a daily internet speed test on Windows devices, stores the results in NinjaOne custom fields, and provides an organization-wide and global report for reviewing network performance.'
tags: ['database', 'performance']
draft: false
unlisted: false
last_update:
  date: 2026-10-29
---

## Purpose

The **Internet Speed Audit** solution runs an internet speed test on Windows devices using the Ookla SpeedTest CLI. It records the download and upload speeds, latency, jitter, packet loss, ISP, network interface, IP addresses, VPN status, and test server details, then stores the results in NinjaOne custom fields.

Use this solution to track internet performance across Windows devices, spot slow or unstable connections, and generate organization-level or global reports for network reviews.

## How It Works

1. **Schedule:** The [Audit Internet Speed](/docs/a04599cc-fb39-4e06-94bb-fe4ddaca358b) task runs the automation once per day against the [cPVAL Windows Workstations](/docs/6c0a75ba-68b7-47a5-acb8-17ef303f9422) and [cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) groups.
2. **Collect:** The [Internet Speed - Audit](/docs/5d4e181e-6fc8-4dfb-ad53-e8aae1a784a0) automation runs the [Agnostic - Test-InternetSpeed](/docs/12946fed-d74f-4977-b59d-85d5c639b56b) script and writes the full results to the [cPVAL Internet Speed Test Results](/docs/96f40eb8-1282-42d2-aefa-38042d85b796) custom field. It also writes the key values to the latency, jitter, packet loss, download, and upload custom fields.
3. **Report:** The [Internet Speed - Audit](/docs/acef689e-ec06-4ee8-9dee-8873a26cfe21) audit report presents the speed test results for reviewing devices and organizations.

## Key Capabilities

- **Speed Measurement:** Records the download and upload speeds in Mbps, along with the bytes transferred and the time taken.
- **Connection Quality:** Records latency, jitter, and packet loss.
- **Connection Details:** Records the ISP, network interface, MAC address, internal and external IP addresses, and VPN status.
- **Test Server Details:** Records the server name, host, location, country, and IP address, plus the result ID and URL of the speed test.
- **Individual Custom Fields:** Stores latency, jitter, packet loss, download, and upload values in separate text fields, so they can be used in searches and conditions.
- **HTML Custom Field:** Stores the full results in an HTML table for readable presentation in NinjaOne.
- **Audit Reporting:** Provides a report for reviewing internet speed results across organizations.

---

## Associated Content

### Custom Fields

| Name | Level | Function |
| :--- | :--- | :--- |
| [cPVAL Internet Speed Test Results](/docs/96f40eb8-1282-42d2-aefa-38042d85b796) | Device | Stores the full internet speed test results in HTML format. |
| [cPVAL Latency](/docs/e524bae2-78b5-4e41-84dd-d55d0509dc23) | Device | Stores the ping latency detected during the speed test. |
| [cPVAL Jitter](/docs/9a71b337-8153-4004-9fd7-61658ba0494b) | Device | Stores the ping jitter detected during the speed test. |
| [cPVAL PacketLoss](/docs/bd3ca16b-532a-4c55-bced-50732eea3a74) | Device | Stores the packet loss detected during the speed test. |
| [cPVAL DownloadMbps](/docs/58e36e0e-6896-4f80-8140-61fc7ad8680d) | Device | Stores the download speed detected during the speed test. |
| [cPVAL UploadMbps](/docs/7d74bd7b-4a7b-42c9-9e37-f00cd5ea7c49) | Device |  Stores the upload speed detected during the speed test. |

### Automation

| Name | Function |
| :--- | :--- |
| [Internet Speed - Audit](/docs/5d4e181e-6fc8-4dfb-ad53-e8aae1a784a0) | Runs the internet speed test and writes the results to the custom fields. |

### Groups

| Name | Function |
| :--- | :--- |
| [cPVAL Windows Workstations](/docs/6c0a75ba-68b7-47a5-acb8-17ef303f9422) | Targets the Windows workstations the task runs against. |
| [cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) | Targets the Windows servers the task runs against. |

### Task

| Name | Function |
| :--- | :--- |
| [Audit Internet Speed](/docs/a04599cc-fb39-4e06-94bb-fe4ddaca358b) | Runs the Internet Speed - Audit automation once per day against Windows devices. |

### Audit Report

| Name | Function |
| :--- | :--- |
| [Internet Speed - Audit](/docs/acef689e-ec06-4ee8-9dee-8873a26cfe21) | Presents the collected internet speed test results for audit and review across organizations. |

---

## Implementation

### Step 1: Create the Custom Fields

Create the following custom fields in NinjaOne:

- [cPVAL Internet Speed Test Results](/docs/96f40eb8-1282-42d2-aefa-38042d85b796)
- [cPVAL Latency](/docs/e524bae2-78b5-4e41-84dd-d55d0509dc23)
- [cPVAL Jitter](/docs/9a71b337-8153-4004-9fd7-61658ba0494b)
- [cPVAL PacketLoss](/docs/bd3ca16b-532a-4c55-bced-50732eea3a74)
- [cPVAL DownloadMbps](/docs/58e36e0e-6896-4f80-8140-61fc7ad8680d)
- [cPVAL UploadMbps](/docs/7d74bd7b-4a7b-42c9-9e37-f00cd5ea7c49)

Ensure the results field supports WYSIWYG HTML content and that the automation has permission to read and update all the fields.

### Step 2: Create the Automation

Create the [Internet Speed - Audit](/docs/5d4e181e-6fc8-4dfb-ad53-e8aae1a784a0) automation.

Configure **Run As** to `System` so the script can run the speed test and update the NinjaOne custom fields.

### Step 3: Create the Groups

Create the following groups, if they do not already exist:

- [cPVAL Windows Workstations](/docs/6c0a75ba-68b7-47a5-acb8-17ef303f9422)
- [cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256)

### Step 4: Create the Task

Create the [Audit Internet Speed](/docs/a04599cc-fb39-4e06-94bb-fe4ddaca358b) task. It runs the automation once per day against the Windows workstation and server groups.

Review the custom fields after the first run to confirm that the speed test results are being collected correctly.

### Step 5: Configure the Audit Report (Optional)

Skip this step if the partner does not need reports. The data is still collected and kept on each device in the [cPVAL Internet Speed Test Results](/docs/96f40eb8-1282-42d2-aefa-38042d85b796) custom field.

1. **API application and credentials:** Create the NinjaOne API application and fill the [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) fields, as described in [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687). If they are already set up for another ProVal reporting solution, reuse them.
2. **Report automation:** Create the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation.
3. **Schedule:** Schedule the report automation against **one** device, such as a server that is always online. Run it after the daily speed test task. Use the values listed in the **Report Settings** section of the Audit Report:
   * [Internet Speed - Audit](/docs/acef689e-ec06-4ee8-9dee-8873a26cfe21)

:::note  
Knowledge Base articles need the **NinjaOne Documentation** app. Without it, set **Report Output** to **Local CSV Files** to create only the CSV files on the device that runs the report.  
:::

---

## FAQ

### General Usage

**Q. What does this solution do?**

**A:** It runs an internet speed test on Windows devices once per day and stores the results in NinjaOne custom fields for auditing and reporting.

**Q. What information does the automation collect?**

**A:** It collects the download and upload speeds, latency, jitter, packet loss, ISP, network interface, MAC address, internal and external IP addresses, VPN status, test server details, and the speed test result ID and URL.

**Q. What tool does the speed test use?**

**A:** The automation runs the [Agnostic - Test-InternetSpeed](/docs/12946fed-d74f-4977-b59d-85d5c639b56b) script, which uses the Ookla SpeedTest CLI.

**Q. Where are the results stored?**

**A:** The full results are stored as an HTML table in the **cPVAL Internet Speed Test Results** custom field. Latency, jitter, packet loss, download, and upload values are also stored in their own custom fields on the device.

**Q. Does the speed test use network bandwidth?**

**A:** Yes. Each test downloads and uploads data to measure the connection. The task runs once per day to limit the impact.

### Reports

**Q. What is the audit report used for?**

**A:** The report provides a consolidated view of internet speed test results for reviewing network performance across organizations.

**Q. Do I need the reports?**

**A:** No. They are optional. Without them, the speed test results are still collected and kept on each device in its custom fields.

**Q. What do I need for the Knowledge Base articles?**

**A:** The **NinjaOne Documentation** app, an API application with its credentials in [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e), and the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation. Without the Documentation app, the report can create CSV files only.

**Q. How can I ensure the report contains current information?**

**A:** Run the report after the daily speed test task so it can use the latest data available in the custom fields.

## Changelog

### 2026-10-29

- Initial version of the document.
