---
id: '57daa951-2acc-4be7-a025-0d0ca729ef57'
slug: /57daa951-2acc-4be7-a025-0d0ca729ef57
title: 'CWRMM Ticket Management for Monitors'
title_meta: 'CWRMM Ticket Management for Monitors'
keywords: ['trigger', 'ticketing', 'ticket-management', 'webhook', 'workflow', 'automation', 'monitors']
description: 'Automates ConnectWise ticket creation, closure, and commenting based on webhook payloads from CW RMM monitors. This workflow handles device lookups, ticket state checks, and status updates to streamline alert management without requiring native RMM ticketing tasks.'
tags: ['api', 'automation', 'ticketing']
draft: false
unlisted: false
last_update:
  date: 2026-07-23
---

## Summary

The **CWRMM Ticket Management for Monitors** workflow automates the lifecycle of ConnectWise tickets based on JSON payloads received from a custom webhook trigger. Designed to work in tandem with advanced RMM monitoring scripts (such as Enhanced Drive Space, CPU, or Memory monitors), this workflow processes three primary actions: `Create`, `Close`, and `Comment`.

**How it works:**

1. A monitor script evaluates device telemetry and maintains a local state file.
2. If a threshold is breached or recovered, the script sends an HTTP POST request to the webhook URL containing the `Action`, `TicketSubject`, `TicketBody`, and `DeviceId`.
3. This workflow catches the webhook, looks up the endpoint, and executes the requested ticketing action.

**Duplicate Ticket Prevention:** This workflow does not verify if an open ticket already exists before creating a new one. The RMM monitor script calling the workflow is solely responsible for intelligently managing state and firing the `Create` action only once per incident to prevent duplicate tickets.

## Details

| Name | Description | Category tags | Trigger |
| ---- | ----------- | ------------- | ------- |
| CWRMM Ticket Management for Monitors | Automates ticket creation, closure, and commenting for CW RMM monitors via webhook. | Ticketing | [CWRMM Ticket Management for Monitors](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7) |

## Dependencies

- [Triggers: CWRMM Ticket Management for Monitors](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7)
- [Custom Field: Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab)

## Workflow Setup Path

- **Tasks Path:** `Automation` ➞ `Workflows` ➞ `All Workflows`

## Usage Example

```PowerShell
$webhookUrl = 'https://webhook.xyz.net/sampleUrl'

$action = 'Create'
$ticketSubject = 'A Sample Ticket for {0}' -f $env:ComputerName
$ticketBody = 'This ticket is created to test the functionality of the trigger'

$deviceId = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432Node\ITSPlatform').privateendpointid

$payload = [ordered]@{
    Action        = $action
    TicketSubject = $ticketSubject
    TicketBody    = $ticketBody
    DeviceId      = $deviceId
}
$jsonPayload = $payload | ConvertTo-Json -Depth 2

Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $jsonPayload -ContentType 'application/json'
```

## Component Used

*This workflow utilizes native ConnectWise RMM workflow actions, including:*

- **Webhook Trigger:** Catches incoming JSON payloads.
- **Get a Endpoint by Criteria:** Resolves the `$deviceId` to an endpoint.
- **Set Variable:** Used to define a blank assignee variable (`NoOne`).
- **Condition:** Branches logic based on the `$action` payload value.
- **Create Ticket:** Generates a new ticket on the specified Service Board.
- **Get All Tickets By Criteria:** Fetches existing tickets matching the subject and device.
- **Loop:** Iterates through fetched tickets to apply notes or status updates.
- **Create Ticket Notes:** Appends the `$ticketBody` to an existing ticket.
- **Update Ticket Status:** Closes the ticket if the action is `Close`.

## Diagram

*End‑to‑end flow of the workflow. Every shape is annotated with what that node actually does, the arrows show execution order, and the edge labels (`toCreate`, `Catchall`, `isNotClosed`, `toClose`) mirror the configured condition branches. Colour coding matches the workflow builder (green = trigger, blue = action, magenta = variable, grey = condition, orange = loop container, green circle = start event, blue circle = branch/iteration stop).*

```mermaid
%%{init: {"flowchart": {"htmlLabels": true, "curve": "basis", "rankSpacing": 65, "nodeSpacing": 45}}}%%
flowchart TD

    %% ---------- MAIN SPINE ----------
    T(["Trigger — CWRMM Ticket Management for Monitors<br/>Webhook entry point; receives Action, TicketSubject, TicketBody, DeviceId"])
    EP["Action — Get A Endpoint By Criteria<br/>Resolve DeviceId → CW RMM endpoint"]
    VAR["Variable — NoOne<br/>Blank assignee (single space) to avoid default assignment"]
    CHK1{"Condition — actionCheck<br/>Branch on payload Action value"}

    T --> EP
    EP --> VAR
    VAR --> CHK1

    %% ---------- BRANCH: CREATE ----------
    CREATE["Action — Create Ticket<br/>Create a new ticket on the Service Board for the endpoint"]
    STOP1((■))
    CHK1 -- toCreate --> CREATE
    CREATE --> STOP1

    %% ---------- BRANCH: CLOSE / COMMENT ----------
    GET["Action — Get All Tickets By Criteria<br/>Fetch existing tickets matching subject + device"]
    CHK1 -- Catchall --> GET

    %% ---------- LOOP CONTAINER ----------
    subgraph LOOP ["Loop (For Each) — Close Open Tickets  ·  iterate every ticket returned above"]
        direction TD
        LS((▶))
        CHK2{"Condition — isNotClosed<br/>Is the current ticket still open?"}
        NOTE["Action — Create Ticket Notes<br/>Append TicketBody as an internal note / comment"]
        CHK3{"Condition — actionCheck<br/>Is Action = Close ?"}
        UPDATE["Action — Update Ticket Status<br/>Set the ticket status → Closed"]
        STOP2((■))
        STOP3((■))
        STOP4((■))

        LS --> CHK2
        CHK2 -- isNotClosed --> NOTE
        NOTE --> CHK3
        CHK2 -- Catchall --> STOP2
        CHK3 -- toClose --> UPDATE
        UPDATE --> STOP3
        CHK3 -- Catchall --> STOP4
    end

    GET --> LS
    LOOP --> STOPF((■))

    %% ---------- STYLING ----------
    classDef trigger   fill:#16a34a,stroke:#0f7a37,color:#ffffff,stroke-width:2px;
    classDef action    fill:#2563eb,stroke:#1746b8,color:#ffffff,stroke-width:2px;
    classDef variable  fill:#be185d,stroke:#83103f,color:#ffffff,stroke-width:2px;
    classDef condition fill:#6b7280,stroke:#3f4654,color:#ffffff,stroke-width:2px;
    classDef startev   fill:#22c55e,stroke:#15803d,color:#ffffff,stroke-width:2px;
    classDef stop      fill:#1e3a8a,stroke:#13265c,color:#ffffff,stroke-width:2px;

    class T trigger;
    class EP,CREATE,GET,NOTE,UPDATE action;
    class VAR variable;
    class CHK1,CHK2,CHK3 condition;
    class LS startev;
    class STOP1,STOP2,STOP3,STOP4,STOPF stop;

    style LOOP fill:#fff7ed,stroke:#ea580c,stroke-width:2px,color:#111827;
```

### Legend

- 🟩 **Trigger** – the webhook that catches the monitor payload (entry point).
- 🟦 **Action** – an API/operation step (endpoint lookup, ticket create, get tickets, add note, update status).
- 🟪 **Variable** – sets a value used later (`NoOne` blank assignee).
- ◆ **Condition** (grey diamond) – a branch point; outgoing arrows are labelled with the branch taken.
- 🟧 **Loop (For Each)** – orange container; the steps inside repeat once per ticket returned by *Get All Tickets By Criteria*.
- 🟢 **Start event** (▶) – beginning of a loop iteration.
- 🔵 **Stop** (■) – end of a branch or of the current loop iteration (the loop then advances to the next ticket).

### How to read the two paths

- **`Action = Create`** → `actionCheck` takes the **toCreate** branch → *Create Ticket* → stop. (No duplicate check is performed here; the calling monitor script is responsible for firing `Create` only once per incident.)
- **`Action = Close` or `Comment`** → `actionCheck` takes the **Catchall** branch → *Get All Tickets By Criteria* → enter the **loop**. For each ticket: if it is already closed, the iteration ends (`isNotClosed` → Catchall); if it is open, *Create Ticket Notes* appends the body, then the inner `actionCheck` either closes it (*Update Ticket Status*, when `Action = Close`) or simply ends the iteration (when `Action = Comment`, the note alone is the desired outcome).

### Node Descriptions

1. **Trigger (CWRMM Ticket Management for Monitors):** The entry point. A webhook instance must be created here to generate the URL used by the monitoring scripts.
2. **Get A Endpoint By Criteria:** Retrieves the endpoint details in CW RMM using the `$deviceId` provided in the webhook payload.
3. **NoOne (Set Variable):** Sets a blank variable (a single space). This is passed to the "Assigned To" field in the Create Ticket action to prevent the ticket from defaulting to the workflow creator or any specific user.
4. **actionCheck (Condition):** Evaluates the `$action` payload property.
    - **If Action is 'Create':** Routes to the **Create Ticket** action. This generates a new ticket for the `$deviceId` using the `$ticketSubject` and `$ticketBody`.
    - **Catchall (Close/Comment):** Routes to the **Get All Tickets By Criteria** action to fetch existing tickets for the device matching the `$ticketSubject`.
5. **Close Open Tickets (Loop):** Iterates through all tickets returned by the previous action.
6. **isNotClosed (Condition inside Loop):** Checks the status of the current ticket.
    - **If Closed/Resolved:** The loop skips to the next ticket.
    - **If Open:** Routes to **Create Ticket Notes**.
7. **Create Ticket Notes:** Adds the `$ticketBody` as an internal note or comment to the ticket.
8. **Check Action (Condition inside Loop):** Evaluates if `$action` equals 'Close'.
    - **If 'Close':** Routes to **Update Ticket Status**, which changes the ticket status to Closed.
    - **If 'Comment':** The loop moves to the next ticket, as the note has already been added.

## Sample Ticket

**Ticket Subject:**  
Enhanced Drive Space Monitoring - C - SERVER01 - 10 Percent

**Ticket Body:**  
Drive C has breached the free space threshold.

Total Space: 100 GB
Used Space: 90 %
Free Space: 10 %
Threshold: 10 %

>*(If the action is Close, the body will append: "Drive space has recovered and is now above the threshold. The ticket can be closed.")*

## Workflow Creation

Install the workflow from the `ProVal - Content` Community. After installation, you must perform the following mandatory configuration steps:

![Image1](../../../static/img/docs/57daa951-2acc-4be7-a025-0d0ca729ef57/image1.webp)

### 1. Create the Webhook Instance

Webhook instances are environment-specific and cannot be migrated. You must create a new instance inside the trigger.

![Image2](../../../static/img/docs/57daa951-2acc-4be7-a025-0d0ca729ef57/image2.webp)

1. Open the workflow and click on the **Trigger** node.
2. Under **Webhook Trigger**, click **New Webhook Instance +**.
3. Name it `CWRMM Ticket Management for Monitors`.
4. **Copy the URL** generated for this instance.
5. **Mandatory:** Take this URL and set it as the default value for the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field in CW RMM. Without this, your monitor scripts will not know where to send their payloads.

### 2. Configure the Create Ticket Action

The workflow installs with default options for ticket creation. You must update these to match your environment's Service Board and assignment rules.

![Image3](../../../static/img/docs/57daa951-2acc-4be7-a025-0d0ca729ef57/image3.webp)

1. Open the **Create Ticket** action node.
2. Update the **Service Board** to the correct board for your alerts.
3. Update the **Assigned To** field as required by your environment (by default, it passes the `NoOne` variable to leave it unassigned).
4. Save the workflow.

**Primary Note: User Permissions**  
The workflow runs under the context of the user account that created it. Therefore, **the workflow must be created by a user account with access to all devices in the environment.**

If the creating user does not have permission to a specific machine, the workflow will fail to create or update tickets for that device, and monitoring will silently fail for that endpoint.

## Completed Screenshot

![Image4](../../../static/img/docs/57daa951-2acc-4be7-a025-0d0ca729ef57/image4.webp)

## Changelog

### 2025-07-23

- Initial version of the document
