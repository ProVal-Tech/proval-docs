---
id: 'New-GUID'
slug: /New-GUID
title: 'Task Name'
title_meta: 'Task Name'
keywords: ['keyword-one', 'keyword-two']
description: 'One sentence that says what the task does, in plain language.'
tags: []
draft: true
unlisted: false
last_update:
  date: 2026-10-28
---

## Template Guidelines

Delete this section before publishing.

- Write for the person setting up and running the task: short sentences, plain language.
- Follow the **Document Author Workflow** above [Task Setup Path](#task-setup-path) for every script the task runs.
- Save screenshots as `.webp` files in `static/img/docs/New-GUID/`, using this document's ID, and number them in the order they appear. Take new screenshots for every document instead of reusing images from other documents.
- **Sample Run:** one screenshot per run with different parameter values, each with one line on what the run does. No output screenshots. For a task without parameters, use a single screenshot with no text.
- **User Parameters** explains each parameter for the person running the task. **Task Creation** ➞ **Parameters** shows only what's entered in the CW RMM interface, one table per parameter.
- Link other ProVal content by its document ID, for example `[Install-PSGalleryModule](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)`.
- Delete optional sections and rows that don't apply. When the task must be attached to a monitor or workflow, add a setup section after [Completed Task](#completed-task) with numbered steps.
- Before publishing, replace `New-GUID` in `id`, `slug` and the image paths, choose `tags` from the repository's `tags.yml`, set `draft` to `false` and update `last_update`.

## Summary

The **Task Name** task does one or two sentences on what it does, on which endpoints, and what it changes or stores. Link the scripts or tools it runs, for example [Script-Name](/docs/New-GUID).

### How it works

1. **Short step name.** What happens in this step, from the user's point of view.
2. **Short step name.** What happens in this step, and where the task stops without changing anything.
3. **Report the result.** Where the result appears, and what happens when the task fails.

**Requirements:** PowerShell 5.1, and any internet access, license or setting the task needs.

## Sample Run

**Scenario name:** set `ParameterName` to `Value`. One sentence on what this run does.

![Image1](../../../static/img/docs/New-GUID/image1.webp)

**Another scenario:** check `FlagName`. One sentence on what this run does.

![Image2](../../../static/img/docs/New-GUID/image2.webp)

## Dependencies

- [PowerShell: Script-Name](/docs/New-GUID)
- [PowerShell: Install-PSGalleryModule](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)
- [Custom Field: CustomFieldName](/docs/New-GUID)
- [Solution: Solution Name](/docs/New-GUID)

## User Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| `ParameterName` | `Value` | Describe the accepted values | False | | Text String | What the parameter controls, and what happens when it's left empty. |
| `FlagName` | `Checked` | `Checked` or `Unchecked` | False | False | Flag | What happens when it's checked. |

If the task has no parameters, replace the table with: This task has no parameters.

:::warning

Optional. Use a warning for parameter values that can cause data loss or disrupt users.

:::

## Custom Fields

Optional. Delete this section if the task doesn't use custom fields.

| Name | Example | Level | Type | Default Value | Description |
| --- | --- | --- | --- | --- | --- |
| [CustomFieldName](/docs/New-GUID) | `Value` | `Endpoint` | `Text Box` | | What the field controls or stores. |

> 📝 **Document Author Workflow (Read Before Proceeding)**
>
> **Do not paste raw PowerShell, Bash, or CMD scripts directly into this public document.**
> To keep our public documentation clean and our code secure, all scripts must be hosted in our central repository.
>
> 1. **Author & Format:** Write the script adhering strictly to the organization's PowerShell/Bash formatting rules (single quotes, `-f` composition, explicit parameters, etc.).
> 2. **Commit to Repository:** Push the finalized script to the **[`cw-rmm` repository](https://github.com/ProVal-Tech/cw-rmm)**.
> 3. **Directory Structure:** Save the file using the exact name of this markdown document (without the `.md` extension) inside the `tasks` directory.
>    * *Example Path:* `tasks/<this-document-filename>/script.ps1` (or `.sh` / `.cmd`).
>    * *Multiple Scripts:* Only if the task requires more than one script of the same type, name them `script1.ps1`, `script2.ps1`, etc., in the order of their rows.
> 4. **Link in Document:** Replace the raw code blocks in the "Script Editor" section below with the permanent GitHub URLs pointing to your committed scripts.

## Task Setup Path

- **Tasks Path:** `AUTOMATION` ➞ `Tasks`
- **Task Type:** `Script Editor`

## Task Creation

### Description

- **Name:** `Task Name`
- **Description:**

```PlainText
One or two lines on what the task does.
One line per parameter on how to fill it in.
```

- **Category:** `Custom`

![Image3](../../../static/img/docs/New-GUID/image3.webp)

### Parameters

Add one subsection per parameter, in the same order as [User Parameters](#user-parameters). Delete this section if the task has no parameters.

#### ParameterName

| Parameter Name | Required Field | Parameter Type | Default Value |
| --- | --- | --- | --- |
| `ParameterName` | `False` | `Text String` | |

![Image4](../../../static/img/docs/New-GUID/image4.webp)

#### FlagName

| Parameter Name | Required Field | Parameter Type | Default Value |
| --- | --- | --- | --- |
| `FlagName` | `False` | `Flag` | |

![Image5](../../../static/img/docs/New-GUID/image5.webp)

### Completed Parameters Section

![Image6](../../../static/img/docs/New-GUID/image6.webp)

:::note

Name the parameters exactly as shown. The script reads them by these names.

:::

### Script Editor

Add one subsection per row, in row order. Delete the row types the task doesn't use.

#### Row 1 Function: Set Pre-defined Variable ( @CustomFieldName@ = CustomFieldName )

- **Notes:** `CustomFieldName`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `CustomFieldName`
- **Custom Field:** `CustomFieldName (STRING - ENDPOINT)`

![Image7](../../../static/img/docs/New-GUID/image7.webp)

#### Row 2 Function: PowerShell script

- **Notes:** `<Leave it Blank>`
- **Use Generative AI Assist for script creation:** `False`
- **Expected time of script execution in seconds:** `300`
- **Continue on Failure:** `False`
- **Run As:** `System`
- **Operating System:** `Windows`
- **PowerShell Script Editor:**

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/task-name/script.ps1)

![Image8](../../../static/img/docs/New-GUID/image8.webp)

#### Row 3 Function: Bash script

- **Notes:** `<Leave it Blank>`
- **Expected time of script execution in seconds:** `300`
- **Continue on Failure:** `False`
- **Operating System:** `Mac`
- **Bash Script Editor:**

[Bash Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/task-name/script.sh)

![Image9](../../../static/img/docs/New-GUID/image9.webp)

#### Row 4 Function: Script Log

- **Notes:** `<Leave it Blank>`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Script Log Message:** `%Output%`

![Image10](../../../static/img/docs/New-GUID/image10.webp)

#### Row 5 Function: Set Custom Field ( CustomFieldName = %Output% )

- **Notes:** `<Leave it Blank>`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Custom Field:** `CustomFieldName`
- **Value:** `%Output%`

![Image11](../../../static/img/docs/New-GUID/image11.webp)

## Completed Task

![Image12](../../../static/img/docs/New-GUID/image12.webp)

## Schedule Task

Optional. Delete this section if the task isn't scheduled.

### Task Details

- **Name:** `Task Name`
- **Description:** `Same description as in Task Creation.`
- **Category:** `Custom`

![Image13](../../../static/img/docs/New-GUID/image13.webp)

### Schedule

- **Schedule Type:** `Schedule`
- **Timezone:** `Local Machine Time`
- **Start:** `<Current Date>`
- **Trigger:** `Time` `At` `<Current Time>`
- **Recurrence:** `Every day`
- **Execute at next agent check-in:** `15` `Day(s)`

![Image14](../../../static/img/docs/New-GUID/image14.webp)

### Targeted Resource

- **Device Group:** `Device Group Name`

![Image15](../../../static/img/docs/New-GUID/image15.webp)

### Completed Scheduled Task

![Image16](../../../static/img/docs/New-GUID/image16.webp)

## Output

- Script Log
- Custom Field
- Files or logs the task leaves on the endpoint, with their location

## Changelog

### 2026-10-28

- Initial version of the document
