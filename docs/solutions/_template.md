---
id: 'New GUID'
slug: /New GUID
title: 'Filename'
title_meta: 'Filename'
keywords: []
description: ''
tags: []
draft: true
unlisted: false
last_update:
  date: 2026-10-27
---

<!--
How to use this template
- Keep the sections in this order. Delete any section marked "Optional" that doesn't apply, and delete these comments.
- Write for the client: plain language, short sentences, no script code.
- Link every piece of content by its doc GUID, e.g. [Name](/docs/<GUID>). Never link downloads or GitHub URLs for ProVal tools.
- Use the platform's own name for each content type (see the reference under Associated Content).
-->

## Purpose

<What the solution achieves and the problem it solves, in one or two short paragraphs. Name the main content pieces and how they work together.>

<!-- Platform: ConnectWise Automate, ConnectWise RMM, NinjaOne, Datto RMM, Kaseya VSA, or Agnostic (works on any RMM). List more than one if the solution spans platforms. -->

**Platform:** `<Platform>`

### Key Capabilities

- **<Capability>** – <What it does and why it helps.>
- **<Capability>** – <What it does and why it helps.>

### Important Caveats & Behavior

<!-- Anything the reader must know before deploying: timing and schedules, permissions, licences, side effects, data stored in plain text, content that must not be combined, install order. -->

- **<Caveat>** – <What happens and what to do about it.>

## How It Works

<!-- Optional. The end-to-end flow, from what starts it to the result. Add a mermaid diagram if it helps: https://mermaid.live/ -->

1. <Step>
2. <Step>

## <Choice> Options

<!-- Optional. Use when the solution offers alternative approaches, e.g. built-in vs workflow ticketing. Compare them side by side and say how to choose. Delete otherwise. -->

| | <Option A> | <Option B> |
|---|---|---|
| **<Aspect>** | <Option A behavior> | <Option B behavior> |
| **Best for** | <Who should pick it> | <Who should pick it> |

**How to choose:**

- Pick **<Option A>** if <reason>.
- Pick **<Option B>** if <reason>.

## Prerequisites

<!-- Optional. Licences, agent or module versions, accounts and permissions, third-party consoles, or other solutions this one relies on. -->

- <Prerequisite>

## Associated Content

<!--
One table per content type, each under its own heading, in the order the content is implemented.
- Delete the tables that don't apply. Add a table for any type not shown here, using the reference below.
- Use the singular for one item and the plural for several: ### Script / ### Scripts.
- Split a large set of the same type by role: ### Custom Fields: Enablement, ### Custom Fields: Thresholds.
- Add a qualifier when content belongs to one option or is optional: ### Bot (Workflow option only), ### Task (optional).
- Add a short intro sentence under a heading when the table needs context, e.g. how the fields are entered or which option they belong to.

Content type reference (heading name, platforms, columns):
- Script ............................ All platforms ........................... Name | Purpose
- Task .............................. ConnectWise RMM ......................... Name | Purpose
- Automation ........................ NinjaOne ................................ Name | Purpose
- Component ......................... Datto RMM ............................... Name | Purpose
- Agent Procedure ................... Kaseya VSA .............................. Name | Purpose
- Custom Field ...................... ConnectWise RMM, NinjaOne, Kaseya VSA .... Name | Level | Type | Purpose
- Extra Data Field (EDF) ............ ConnectWise Automate .................... Name | Level | Type | Purpose
- User-Defined Field (UDF) .......... Datto RMM ............................... Name | Level | Type | Purpose
- Managed Variable .................. Kaseya VSA .............................. Name | Level | Type | Purpose
- Group / Search / Filter / View .... All platforms ........................... Name | Type | Purpose
- Monitor ........................... All platforms ........................... Name | Type | Purpose
  (Type: Internal Monitor, Remote Monitor, Compound Condition, Monitor Set, Component Monitor, etc.)
- Policy ............................ ConnectWise RMM, NinjaOne, Datto RMM, Kaseya VSA ... Name | Purpose
- Workflow .......................... ConnectWise RMM ......................... Name | Trigger | Purpose
- Trigger / Bot / Form .............. ConnectWise RMM ......................... Name | Purpose
- Dataview / Custom Table / Report .. ConnectWise Automate, NinjaOne .......... Name | Purpose
- Alert Template / Ticket Template .. All platforms ........................... Name | Purpose
- Application / Tool ................ All platforms ........................... Name | Purpose

Level by platform:
- ConnectWise RMM: Company, Site, Endpoint
- NinjaOne: Organization, Location, Device
- ConnectWise Automate: Client, Location, Computer
- Datto RMM: Site (site variables), Device (UDFs)
- Kaseya VSA: Machine Group (managed variables), Agent (custom fields)
-->

### Script

| Name | Purpose |
|---|---|
| [<Script Name>](/docs/<GUID>) | <What it does in this solution and when it runs.> |

### Custom Fields

| Name | Level | Type | Purpose |
|---|---|---|---|
| [<Field Name>](/docs/<GUID>) | <Level> | <Type> | <What it stores or controls.> |

### Group

| Name | Type | Purpose |
|---|---|---|
| [<Group Name>](/docs/<GUID>) | <Dynamic / Static / Search> | <Which devices it targets.> |

### Monitor

| Name | Type | Purpose |
|---|---|---|
| [<Monitor Name>](/docs/<GUID>) | <Monitor Type> | <What it checks, how often, and what it does on a failure.> |

### Workflow

| Name | Trigger | Purpose |
|---|---|---|
| [<Workflow Name>](/docs/<GUID>) | <Trigger> | <What it does.> |

### Dataview

| Name | Purpose |
|---|---|
| [<Dataview Name>](/docs/<GUID>) | <What it shows.> |

## Implementation

<!--
Numbered steps in the order the content must be created. Each step says what to do and links the content docs.
- Note manual configuration inline: permissions, schedules, values to set, content to import from the ProVal - Content Community.
- Mark steps that apply to one option only, or are optional.
- End with how to confirm the solution works.
-->

### Step 1: <Action>

<What to do and why.>

- [<Content Type>: <Name>](/docs/<GUID>)

### Step 2: <Action>

<What to do and why.>

- [<Content Type>: <Name>](/docs/<GUID>)

You'll know it worked when <observable result>.

## FAQ

<!-- Questions a technician would ask while deploying or troubleshooting. Answer each in a block quote. Add a troubleshooting checklist for the most likely failure. -->

### Q: <Question>

> <Answer>

## Changelog

### YYYY-MM-DD

- Initial version of the document
