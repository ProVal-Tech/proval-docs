---
id: '215f93ac-aca7-4ccd-8f3e-1b241bd32353'
slug: /215f93ac-aca7-4ccd-8f3e-1b241bd32353
title: 'SojiGo'
title_meta: 'SojiGo'
keywords: ['sojigo', 'disk-cleanup', 'drive', 'space', 'cleanup', 'autofix']
description: 'Frees up drive space on Windows endpoints with SojiGo, using arguments managed through hierarchical custom fields. Run it on demand or on a schedule, or as the optional Enhanced Drive Space Monitoring autofix.'
tags: ['disk', 'disk-cleanup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-20
---

## Purpose

The **SojiGo** solution frees up drive space on managed Windows endpoints. It runs the [SojiGo](/docs/6b7cbccd-c62f-457a-a97e-0b861b27b9df) drive cleaner through a single CW RMM task, which removes old temporary files, logs and caches.

What SojiGo cleans is controlled through custom fields, so you can set a company-wide cleanup and adjust it for specific sites or devices without editing any script. Out of the box, it runs a low-impact cleanup that is safe for patched devices.

### Key Capabilities

- **Low-Impact by Default** – With no fields changed, SojiGo cleans drive C only and removes files older than 21 days. It leaves the Windows Update download cache, recycle bins and update rollback untouched.
- **Hierarchical Arguments** – Set Company-wide arguments, then override them for specific Sites or individual Endpoints.
- **OS-Aware Targeting** – Servers and Workstations automatically use their own arguments (`_Svr` / `_Wks`).
- **Nothing to Install** – SojiGo is a single executable with no .NET or other runtime. It is downloaded only when a newer version is available, its digital signature is checked before every run, and ARM64 devices get the ARM64 version.
- **Reports for Every Run** – Each run can save CSV reports of every file removed, with 60 days of earlier reports kept by default.
- **Optional Automatic Cleanup** – Combined with the [Enhanced Drive Space Monitoring](/docs/e9cf4ff0-4413-447b-97dd-b8b2abd59597) solution, SojiGo can clean up a device when a drive space ticket is raised and add the results to the ticket.

### Important Caveats & Behavior

- **Check Manual_Run for Your Own Runs** – Every manual or scheduled run needs the `Manual_Run` parameter checked. Without it, the task acts only as the Enhanced Drive Space Monitoring autofix, and does nothing on any device where that autofix is not enabled.
- **SojiGo Deletes Files** – Preview any new arguments with `--dry-run` before using them on many devices. See [Step 4](#step-4-preview-the-cleanup).
- **Type Single Quotes Twice** – CW RMM places field values inside a single-quoted PowerShell string. A single quote typed once stops the task. See [Writing arguments](/docs/5e38eb11-8e17-4aa6-a917-e06d78d026e0#writing-arguments).
- **Files in Use Are Skipped** – Files open in other programs cannot be removed. They are listed in the log and cleaned on a later run.
- **One Run at a Time** – Only one SojiGo run can take place on a device at once. A second run started at the same time stops with an error, without cleaning.

## Associated Content

### Task

| Name | Purpose |
|---|---|
| [SojiGo](/docs/5e38eb11-8e17-4aa6-a917-e06d78d026e0) | Downloads and verifies SojiGo, chooses the arguments from the custom fields, and runs the cleanup. Also serves as the optional Enhanced Drive Space Monitoring autofix. |

### Application

| Name | Purpose |
|---|---|
| [SojiGo](/docs/6b7cbccd-c62f-457a-a97e-0b861b27b9df) | The drive cleaner the task runs. Its document lists every available option, with examples and the locations to handle with care. |

### Custom Fields: SojiGo Arguments

The arguments the task runs SojiGo with. The task uses the most specific level that is set: **Endpoint → Site → Company**, then the built-in default.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [SojiGo_Arguments_Svr](/docs/c51eb5bd-5636-4a67-896f-ec19626d3831) | Company | Text Area | Company baseline arguments for servers (Default: the low-impact arguments). |
| [SojiGo_Arguments_Wks](/docs/91d0fa29-3c12-4e9c-b65b-b23e64a93c66) | Company | Text Area | Company baseline arguments for workstations (Default: the low-impact arguments). |
| [SojiGo_Arguments_Svr_Site](/docs/ec1c9648-be61-4d3d-abfa-f3c0f3d0cd3b) | Site | Text Area | Site-level override for server arguments. |
| [SojiGo_Arguments_Wks_Site](/docs/248a3007-7a4f-4962-91f3-01ec4d2c8a39) | Site | Text Area | Site-level override for workstation arguments. |
| [SojiGo_Arguments](/docs/0d0cfdb2-351b-404a-979d-e73ef4583933) | Endpoint | Text Area | Endpoint-level override for specific machines. |

### Optional: Enhanced Drive Space Monitoring Autofix

Only needed to have SojiGo clean up devices automatically when a drive space ticket is raised.

| Name | Purpose |
|---|---|
| [Enhanced Drive Space Monitoring](/docs/e9cf4ff0-4413-447b-97dd-b8b2abd59597) | The monitoring solution, deployed with its Workflow ticketing option. |
| [Enhanced Drive Space Monitoring [Workflow]](/docs/2c9dd7bc-f5aa-48c2-be76-1348e13cda07) | The monitor that starts the SojiGo task as its automation. |
| [Enhanced Drive Space Monitoring Configuration Writer](/docs/b2a4b9ec-08bd-4bce-8db7-b155c6bc03bc) | Writes the Autofix setting that turns the autofix on for a device. |
| [EDSM_Autofix_Svr](/docs/0633eb30-42d1-4b39-a81f-8ddcdf343041), [EDSM_Autofix_Wks](/docs/be43ba2c-9066-47c2-89c0-cd81a219f00f), [EDSM_Autofix_Svr_Site](/docs/f39306a9-d782-42c8-a9c7-df8f37d9b06e), [EDSM_Autofix_Wks_Site](/docs/0cea4c75-a11c-4466-b8d3-4df2717ea9c2), [EDSM_Autofix](/docs/fdf87d82-1984-496f-aae4-1d2d3b6d5cd9) | Turn the autofix on or off per company, site or endpoint. |

## Implementation

Follow these steps in order. Steps 1–5 set up manual and scheduled cleanups. Step 6 is optional.

### Step 1: Create the Custom Fields

Create the five custom fields in CW RMM.

- [Custom Field: SojiGo_Arguments_Svr](/docs/c51eb5bd-5636-4a67-896f-ec19626d3831)
- [Custom Field: SojiGo_Arguments_Wks](/docs/91d0fa29-3c12-4e9c-b65b-b23e64a93c66)
- [Custom Field: SojiGo_Arguments_Svr_Site](/docs/ec1c9648-be61-4d3d-abfa-f3c0f3d0cd3b)
- [Custom Field: SojiGo_Arguments_Wks_Site](/docs/248a3007-7a4f-4962-91f3-01ec4d2c8a39)
- [Custom Field: SojiGo_Arguments](/docs/0d0cfdb2-351b-404a-979d-e73ef4583933)

Set the low-impact arguments as the Default Value of the two Company fields, exactly as shown in their documents.

### Step 2: Create the Task

Create the [SojiGo](/docs/5e38eb11-8e17-4aa6-a917-e06d78d026e0) task with its two parameters, `Arguments` and `Manual_Run`.

### Step 3: Review the Arguments

Keep the Company defaults, or change them to suit the partner. Then set Site or Endpoint overrides where a different cleanup is needed, for example on file servers with a data drive. See [Common Scenarios](#common-scenarios) for ready-made arguments, and the [SojiGo](/docs/6b7cbccd-c62f-457a-a97e-0b861b27b9df) document for every option.

### Step 4: Preview the Cleanup

Run the task on a few devices with `Manual_Run` checked and `Arguments` set to the arguments you plan to use, plus `--dry-run`. For example:

```plaintext
--drives C --days 21 --csv --dry-run
```

Nothing is deleted. The script log shows how much space would be freed, and `C:\ProgramData\_Automation\App\SojiGo\SojiGoLogs\SojiGo-files.csv` lists every file that would be removed.

### Step 5: Run or Schedule the Cleanup

- **On demand:** run the [SojiGo](/docs/5e38eb11-8e17-4aa6-a917-e06d78d026e0) task on the devices you choose, with `Manual_Run` checked.
- **On a schedule:** schedule the task against the devices or groups you want cleaned, with `Manual_Run` checked. Once a week suits most environments.

Leave `Arguments` empty to use the custom fields.

### Step 6 (Optional): Set Up the Enhanced Drive Space Monitoring Autofix

To clean up devices automatically when a drive space ticket is raised, follow [Step 9](/docs/e9cf4ff0-4413-447b-97dd-b8b2abd59597#step-9-optional-set-up-the-sojigo-autofix) of the Enhanced Drive Space Monitoring solution. The autofix acts only on devices where it is enabled, so it never cleans up any other device in the monitoring group.

## Common Scenarios

Set these in the custom field for the level you want, or in the `Arguments` parameter for a single run.

| Goal | Arguments |
|---|---|
| The low-impact default | `--drives C --days 21 --csv --log-retention-days 60 --exclude-path ''C:\Windows\SoftwareDistribution\Download'' --exclude-volumecache ''Temporary Files,Recycle Bin,Update Cleanup''` |
| Clean drives C and D on a file server | `--drives C,D --days 30 --csv --exclude-path ''C:\Windows\SoftwareDistribution\Download''` |
| Clean only SojiGo's own folder list, without the Windows Disk Cleanup tasks | `--drives C --days 21 --csv --skip-volumecaches --exclude-path ''C:\Windows\SoftwareDistribution\Download''` |
| Leave a business application's folder untouched | `--drives C --days 21 --exclude-path ''C:\Windows\SoftwareDistribution\Download,C:\Exports''` |
| Clean only drives that are low on space | `--days 21 --min-free-percent 15 --exclude-path ''C:\Windows\SoftwareDistribution\Download''` |
| Keep 90 days of reports | `--drives C --days 21 --csv --log-retention-days 90` |
| Preview without deleting anything | Add `--dry-run` to any of the above. |

:::warning

Options such as `--all`, `--purge-downloads`, `--empty-recyclebin` and `--clean-winsxs` delete user files permanently or remove the ability to uninstall updates. Read [Locations to Handle with Care](/docs/6b7cbccd-c62f-457a-a97e-0b861b27b9df#locations-to-handle-with-care) before using them.

:::

## FAQ

### Q: What does SojiGo remove with the default arguments?

> Files older than 21 days in the standard temporary, log and cache folders on drive C. It also runs the Windows Disk Cleanup tasks, except Temporary Files, Recycle Bin and Update Cleanup. The Windows Update download cache, recycle bins and update rollback are left untouched. See [What SojiGo Cleans by Default](/docs/6b7cbccd-c62f-457a-a97e-0b861b27b9df#what-sojigo-cleans-by-default) for the full list.

### Q: I ran the task and it did nothing. Why?

> `Manual_Run` was not checked. Without it, the task acts only as the Enhanced Drive Space Monitoring autofix, and does nothing on devices where that autofix is not enabled. The script log ends with the reason. Run it again with `Manual_Run` checked.

### Q: How do I see what would be removed before cleaning?

> Run the task with `Manual_Run` checked and `--dry-run` added to the arguments. Nothing is deleted, and the CSV report lists every file that would be removed. See [Step 4](#step-4-preview-the-cleanup).

### Q: Where are the logs and reports?

> In `C:\ProgramData\_Automation\App\SojiGo\SojiGoLogs` on each device. `SojiGo.log` holds the log of every run, and `SojiGo-summary.csv` holds one line per drive with the space freed. Reports from earlier runs are kept in the `Archive` folder for 60 days by default.

### Q: How do I clean a different drive on one device?

> Set the [SojiGo_Arguments](/docs/0d0cfdb2-351b-404a-979d-e73ef4583933) field on that device, for example `--drives D --days 30 --csv`. It overrides the Site and Company arguments for that device only.

### Q: Can servers and workstations use different arguments?

> Yes. Servers use the `_Svr` fields and workstations use the `_Wks` fields, at both the Company and Site levels. The Endpoint field applies to whichever device it is set on.

### Q: Will SojiGo interfere with patching?

> Not with the default arguments. They leave the Windows Update download cache, where patches wait to be installed, untouched, and keep the ability to uninstall updates. If you write your own arguments, keep `--exclude-path ''C:\Windows\SoftwareDistribution\Download''` in them on patched devices.

### Q: The task reports that some files could not be removed. Is that a problem?

> No. Those files were open in other programs. They are listed in the log and in `SojiGo-files.csv`, and are cleaned on a later run once they are closed. They do not make the task fail.

### Q: The task stopped with an error about the arguments. What should I check?

> Make sure every single quote is typed twice, and that values with spaces, commas or `|` are wrapped in two single quotes on each side. Variables such as `$env:ProgramData` are not supported. See [Writing arguments](/docs/5e38eb11-8e17-4aa6-a917-e06d78d026e0#writing-arguments).

### Q: Do I need to install .NET or anything else on the devices?

> No. SojiGo is a single executable that the task downloads and keeps up to date. It needs Windows 10, Windows Server 2016 or newer, on a 64-bit system.

### Q: How is this different from Soji?

> SojiGo replaces [Soji](/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc) and accepts the same arguments, but needs no .NET runtime. It also adds exclusions, previews, free space thresholds and report retention. See [Moving from Soji](/docs/6b7cbccd-c62f-457a-a97e-0b861b27b9df#moving-from-soji).

## Changelog

### 2026-10-20

- Initial version of the document
