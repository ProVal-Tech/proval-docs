---
id: 'b98f159a-f34a-4c4c-8ff3-b89a0d003219'
slug: /b98f159a-f34a-4c4c-8ff3-b89a0d003219
title: 'Associate a device with an existing ticket'
title_meta: 'Associate a device with an existing ticket'
keywords: ['bot', 'form', 'rpa', 'ticketing', 'device-association', 'asset', 'ticket-update', 'automation']
description: 'Custom RPA bot that attaches a device to an existing CW RMM service ticket, covering the gap where a workflow cannot associate a device. Accepts a ticket ID or ticket number, preserves existing device associations, and is safe to re-run.'
tags: ['api', 'automation', 'ticketing']
draft: false
unlisted: false
last_update:
  date: 2026-09-07
---

## Summary

The **Associate a device with an existing ticket** bot attaches a device to a ticket that already exists. It covers a capability a native CW RMM workflow lacks entirely: a workflow can create a ticket, note it and close it, but it cannot associate a device with it.

The bot runs inside the platform, so it uses the pre-authenticated RPA HTTP client and needs no client ID or client secret. The base URL arrives automatically through the `cwOpenAPIURL` input.

It is intended for tickets that are already open — one raised by hand, one created by a process outside this content set, or a ticket that needs a second device attached alongside the first.

**How it works:**

1. Both form values are read and written to the result log before validation, so a single run shows exactly what the form delivered.
2. The ticket is resolved. A value matching the GUID pattern is fetched directly by ID; anything else is treated as a ticket number and searched for. A GUID that fails a direct fetch also falls back to the number search.
3. After a number search the ticket is re-read by ID, because the search projection is not guaranteed to include the complete `assets` array.
4. The existing associations are merged with the incoming device.
5. The merged array is written back with a JSON Patch `replace` operation.
6. The patch response is inspected to confirm the device is present before the run is reported as successful.
7. `ticketId`, `ticketNumber`, `deviceId`, `assetCount`, `isPrimary` and `alreadyAssociated` are returned as result data for bot chaining.

**Why the ticket is read before it is written**

The ticket API supports only the `replace` operation on the `assets` path, which means the entire array has to be sent back on every change. Sending just the new device would silently remove every device already associated with the ticket, and would also discard the primary flag. Reading first and merging avoids both.

**Merge behaviour**

| Ticket state | Outcome |
| ------------ | ------- |
| Has a device flagged primary | The new device is appended as an additional device; the existing primary is untouched |
| Has no devices at all | The new device is attached and becomes the primary |
| Has devices but none flagged primary | The new device is attached and becomes the primary |
| Already has this device | No patch is sent; the run reports success and changes nothing |

That last row makes the bot safe to re-run. A repeated or duplicated run will not create a duplicate association or fail the run.

**When not to use it**

If the ticket is being created as part of the same process, create it with the device already attached instead, using the [Bots: Create ticket with associated device](/docs/cf8a2c3d-456c-4567-8039-97e89f894ac5) bot. A device attached to a ticket after the fact does not carry through to the configuration on the ticket once it syncs to CW Manage, while a device supplied in the original create call does. This bot remains correct for tickets that already exist, but it is not a substitute for creating the ticket with its device.

**API endpoints used**

| Method | Endpoint | Purpose |
| ------ | -------- | ------- |
| GET | `/api/platform/v2/service/ticketing/tickets/{ticketId}` | Fetch the ticket by ID and read its current assets |
| GET | `/api/platform/v2/service/ticketing/tickets?number={number}` | Resolve a ticket number to a ticket ID |
| PATCH | `/api/platform/v2/service/ticketing/tickets/{ticketId}` | Replace the assets array with the merged list |

## Details

| Bot Name | Description | Execution Environment |
| -------- | ----------- | --------------------- |
| Associate a device with an existing ticket | Attaches a device to an existing ticket, covering the gap where a workflow cannot associate a device. Existing devices and the primary flag are preserved. Accepts a ticket ID or number. Safe to re-run: an already attached device is reported and left unchanged. | Cloud |

## Integration Configuration

| Platform | Platform Scopes | 3rd Party Apps | Integrations |
| -------- | --------------- | -------------- | ------------ |
| True | <ul><li>`Platform - Tickets - Read`</li><li> `Platform - Devices - Read`</li><li> `Platform - Sites - Read`</li><li> `Platform - Assets - Read`</li><li> `Platform - Companies - Read`</li><li> `Platform - Tickets - Create`</li><li> `Platform - Tickets - Update`</li></ul> | False |  |

## Form Setup

| Form Required | Form Template |
| ------------- | ------------- |
| Yes | [Forms: Associate a device with an existing ticket](/docs/45135ca2-b3f8-4d0e-9331-ef89768b487b) |

## Functions

- [app.py](https://github.com/ProVal-Tech/cw-rmm/blob/main/bots/associate-a-device-with-an-existing-ticket/app.py)
- [conda.yaml](https://github.com/ProVal-Tech/cw-rmm/blob/main/bots/associate-a-device-with-an-existing-ticket/conda.yaml)
- [formSchema.json](https://github.com/ProVal-Tech/cw-rmm/blob/main/bots/associate-a-device-with-an-existing-ticket/formschema.json)

## Forms Setup Path

- **Tasks Path:** `Automation` ➞ `Bots`

## Dependencies

- [Forms: Associate a device with an existing ticket](/docs/45135ca2-b3f8-4d0e-9331-ef89768b487b)

The bot cannot run without its form, which supplies the ticket and the device. Importing the bot brings the form in with it, already attached.

**Related content:**

- [Bots: Create ticket with associated device](/docs/cf8a2c3d-456c-4567-8039-97e89f894ac5) — creates a ticket and attaches a device in one operation, rather than attaching to an existing ticket.

## Implementation

Install the bot from the `ProVal - Content` Community, selecting the **Bots** repository. After installation the following configuration steps are mandatory.

![Image1](../../../static/img/docs/b98f159a-f34a-4c4c-8ff3-b89a0d003219/image1.webp)

**Primary Note: Reading the bot output**

Progress and failure detail are written to the result log, which is what appears when bot logs are directed to a ticket. The run logs the values the form delivered, the resolved ticket ID and number, and the asset count before and after the change. If a run fails with no detail beyond the exception, the form data itself did not arrive.

## Changelog

### 2026-09-07

- Initial version of the document
