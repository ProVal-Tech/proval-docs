---
id: 'New-GUID'
slug: /New-GUID
title: 'Monitor Name'
title_meta: 'Monitor Name'
keywords: ['keyword-one', 'keyword-two']
description: 'One sentence that says what the monitor detects and what happens when it does, in plain language.'
tags: []
draft: true
unlisted: false
last_update:
  date: 2026-10-28
---

## Template Guidelines

Delete this section before publishing.

- Write for the person setting up the monitor and working its tickets: short sentences, plain language.
- Follow the **Document Author Workflow** above [Monitor Setup Path](#monitor-setup-path) for every script the monitor runs.
- Save screenshots as `.webp` files in `static/img/docs/New-GUID/`, using this document's ID, and number them in the order they appear. Take new screenshots for every document instead of reusing images from other documents.
- Keep ticket subjects short and simple. The ticket body explains why the ticket was created and what to do next.
- Link other ProVal content by its document ID, for example `[Install-PSGalleryModule](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)`.
- Delete optional sections that don't apply. When the monitor needs setup outside this document, such as custom fields or an autofix task, add numbered setup steps after [Completed Monitor](#completed-monitor).
- Before publishing, replace `New-GUID` in `id`, `slug` and the image paths, choose `tags` from the repository's `tags.yml`, set `draft` to `false` and update `last_update`.

## Summary

The **Monitor Name** monitor checks one or two sentences on what it checks, on which endpoints and how often. Say what happens when it detects a problem, for example a ticket or an autofix task.

### How it works

1. **Check.** What the script checks, and how often it runs.
2. **Detect.** What output means a problem, and what happens then: a ticket, an autofix task, or both.
3. **Resolve.** When the ticket closes automatically, or what the technician does to close it.

| Script Output | Meaning |
| --- | --- |
| `Output text the monitor matches` | What it means for the endpoint. |
| No output | The endpoint is healthy. |

**Requirements:** PowerShell 5.1, and any internet access, license or setting the monitor needs.

## Dependencies

- [Group: Device Group Name](/docs/New-GUID)
- [Task: Autofix Task Name](/docs/New-GUID)
- [Custom Field: CustomFieldName](/docs/New-GUID)
- [Solution: Solution Name](/docs/New-GUID)

## Target

This monitor targets the `Device Group Name` device group. One sentence on why, if it isn't obvious.

![Image1](../../../static/img/docs/New-GUID/image1.webp)

> 📝 **Document Author Workflow (Read Before Proceeding)**
>
> **Do not paste raw PowerShell, Bash, or CMD scripts directly into this public document.**
> To keep our public documentation clean and our code secure, all scripts must be hosted in our central repository.
>
> 1. **Author & Format:** Write the script adhering strictly to the organization's PowerShell/Bash formatting rules (single quotes, `-f` composition, explicit parameters, etc.).
> 2. **Commit to Repository:** Push the finalized script to the **[`cw-rmm` repository](https://github.com/ProVal-Tech/cw-rmm)**.
> 3. **Directory Structure:** Save the file using the exact name of this markdown document (without the `.md` extension) inside the `monitors` directory.
>    * *Example Path:* `monitors/<this-document-filename>/script.ps1` (or `.sh` / `.cmd`).
>    * *Multiple Scripts:* Only if the monitor requires more than one script of the same type, name them `script1.ps1`, `script2.ps1`, etc. For example, `script1.ps1` for the conditions and `script2.ps1` for ticket resolution.
> 4. **Link in Document:** Replace the raw code blocks in the "Conditions" section below with the permanent GitHub URLs pointing to your committed scripts.

## Monitor Setup Path

- **Monitors Path:** `ENDPOINTS` ➞ `Alerts` ➞ `Monitors`
- **Action:** `Create Monitor`

## Monitor Creation

### Description

- **Name:** `Monitor Name`
- **Description:**

```PlainText
One or two lines on what the monitor checks and what happens when it detects a problem.
```

- **Type:** `<Type>`
- **Severity:** `<Severity>`
- **Family:** `<Family>`

![Image2](../../../static/img/docs/New-GUID/image2.webp)

## Conditions

- **Run script on:** `Schedule`
- **Repeat every:** `<Interval, for example 15 Minutes or 24 Hours>`
- **Script Language:** `PowerShell`
- **Use Generative AI Assist for script creation:** `False`
- **PowerShell Script Editor:**

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/monitors/monitor-name/script.ps1)

- **Criteria:** `<Contains / Does Not Contain / etc.>`
- **Operator:** `<AND / OR>`
- **Script Output:** `<Expected Output String>`
- **Escalate ticket on script failure:** `<True / False / Disabled>`
- **Add Automation:** `<Autofix Task Name or NONE>`

![Image3](../../../static/img/docs/New-GUID/image3.webp)

## Ticket Resolution

Optional. Delete this section if tickets aren't resolved automatically.

- **Automatically Resolve:** `<Enabled / Disabled>`
- **Dropdown Option:** `<Run same script as above / etc.>`
- **Criteria:** `<Contains / Does Not Contain>`
- **Operator:** `<AND / OR>`
- **Script Output:** `<Expected Recovery Output String>`

![Image4](../../../static/img/docs/New-GUID/image4.webp)

## Monitor Output

- **Output:** `<Generate Ticket / Do not Generate Ticket>`

![Image5](../../../static/img/docs/New-GUID/image5.webp)

## Completed Monitor

![Image6](../../../static/img/docs/New-GUID/image6.webp)

## Ticketing

Optional. Delete this section if the monitor doesn't create tickets.

**Subject:**

```PlainText
Short subject that names the problem and the endpoint.
```

**Body:**

```PlainText
Why the ticket was created, with the details the script found.
What the technician should do next.
When the ticket closes automatically, if it does.
```

**Example Ticket:**

![Image7](../../../static/img/docs/New-GUID/image7.webp)

## Changelog

### 2026-10-28

- Initial version of the document
