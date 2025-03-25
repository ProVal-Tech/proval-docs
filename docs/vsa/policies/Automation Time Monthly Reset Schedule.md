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

[VSA - VSA Configuration - Solution - Automation Time Saved Tracking](<../../solutions/Automation Time Saved Tracking.md>)

# Details

- **Policy Name**: Automation Time Monthly Reset Schedule
- **Policy Description**: Schedules the Monthly CF Field Reset AP.
- **Applied View**: All Machines
- **Assigned Organizations / Machine Groups**: N/A
- **Assigned Machines**: N/A
- **Policy Objects Active**:
  - **Policy Object Name**: Agent Procedure
  - **Policy Object Settings**:
    - **Policy Object Members**: [VSA - VSA Configuration - Agent Procedure - Monthly Automation Time Reset](<../procedures/Monthly Automation Time Reset.md>)
      - **Policy Object Member Settings**: Monthly, 1st day, midnight, do not SiO



