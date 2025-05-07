---
id: 'a49d1e3f-e2d8-444d-a4fc-fd91bccea30c'
slug: /a49d1e3f-e2d8-444d-a4fc-fd91bccea30c
title: 'Automation Time Monthly Reset Schedule'
title_meta: 'Automation Time Monthly Reset Schedule'
keywords: ['schedule', 'reset', 'cf', 'field', 'monthly', 'automation', 'policy']
description: 'This document outlines the details of the Automation Time Monthly Reset Schedule, including its dependencies, policy name, description, and active policy objects for managing automation time resets effectively.'
tags: []
draft: false
unlisted: false
---

# Summary

Schedules the Monthly CF Field Reset AP.

# Dependencies

[VSA - VSA Configuration - Solution - Automation Time Saved Tracking](/docs/81ac366c-a635-4419-9a29-94a1fe7ddac0)

# Details

- **Policy Name**: Automation Time Monthly Reset Schedule
- **Policy Description**: Schedules the Monthly CF Field Reset AP.
- **Applied View**: All Machines
- **Assigned Organizations / Machine Groups**: N/A
- **Assigned Machines**: N/A
- **Policy Objects Active**:
  - **Policy Object Name**: Agent Procedure
  - **Policy Object Settings**:
    - **Policy Object Members**: [VSA - VSA Configuration - Agent Procedure - Monthly Automation Time Reset](/docs/1552dec9-04ae-484f-b217-922542928af3)
      - **Policy Object Member Settings**: Monthly, 1st day, midnight, do not SiO


