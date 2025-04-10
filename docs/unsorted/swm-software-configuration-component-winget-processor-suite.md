---
id: '9af7383a-7bdd-4ea1-b333-1b35732b1bb7'
slug: /9af7383a-7bdd-4ea1-b333-1b35732b1bb7
title: 'SWM - Software Configuration - Component - WinGet Processor Suite'
title_meta: 'SWM - Software Configuration - Component - WinGet Processor Suite'
keywords: ['winget', 'export', 'import', 'update', 'uninstall', 'json', 'packages']
description: 'This document provides an overview of various WinGet functionalities including exporting a list of software packages to a JSON file, importing packages from a JSON file, updating all compatible software packages, and uninstalling specific software packages using WinGet on endpoints. It includes dependencies, implementation details, and Datto variable configurations for each process.'
tags: ['installation', 'software', 'uninstallation', 'update']
draft: false
unlisted: true
---

## WinGet Export

### Overview
Exports a JSON file containing a list of WinGet software packages on the endpoint. Uses ProVal's `Invoke-WinGetProcessor.ps1` agnostic content.

### Dependencies
[ProVal WinGet Processor](/docs/8496c2e9-0e52-4961-a1f1-4a95296e8cf7)

### Implementation
Import the component in this directory into the target environment.

### Datto Variables

| Variable Name | Type    | Default | Description                                       |
|---------------|---------|---------|---------------------------------------------------|
| `JSONPath`    | `String`|         | Path to the JSON file on the endpoint.           |

### Output
stdOut & stdError

## WinGet Import Install

### Overview
Imports a JSON file containing a list of WinGet software packages (generated using WinGet Export) and installs all contained packages.

### Dependencies
[ProVal WinGet Processor](/docs/8496c2e9-0e52-4961-a1f1-4a95296e8cf7)

### Implementation
Import the component in this directory into the target environment.

### Datto Variables

| Variable Name  | Type    | Default | Description                                                                                           |
|----------------|---------|---------|-------------------------------------------------------------------------------------------------------|
| `JSONPath`     | `String`|         | Path to the JSON file on the endpoint. If included with this component, the path should be only the name of the file. |
| `AllowUpdate`  | `Boolean`| `True`  | Should WinGet update existing packages on the endpoint?                                              |

### Output
stdOut & stdError

## WinGet UpdateAll

### Overview
Updates all compatible software packages using WinGet on an endpoint.

### Dependencies
[ProVal WinGet Processor](/docs/8496c2e9-0e52-4961-a1f1-4a95296e8cf7)

### Implementation
Import the component in this directory into the target environment.

### Datto Variables
None

### Output
stdOut & stdError

## WinGet Package Uninstall

### Overview
Uninstalls a software package using WinGet on an endpoint.

### Dependencies
[ProVal WinGet Processor](/docs/8496c2e9-0e52-4961-a1f1-4a95296e8cf7)

### Implementation
Import the component in this directory into the target environment.

### Datto Variables

| Variable Name  | Type    | Default | Description                                                                                           |
|----------------|---------|---------|-------------------------------------------------------------------------------------------------------|
| `PackageId`    | `String`|         | Package name(s) you want to uninstall, separated by commas. Syntax: 'notepadd++.notepad++','Git.Git','Ditto.Ditto' |
| `AllowUpdate`  | `Boolean`| `True`  | Should WinGet update existing packages on the endpoint?                                              |

### Output
stdOut & stdError

## WinGet Package Uninstall

### Overview
Uninstalls a software package using WinGet on an endpoint.

### Dependencies
[ProVal WinGet Processor](/docs/8496c2e9-0e52-4961-a1f1-4a95296e8cf7)

### Implementation
Import the component in this directory into the target environment.

### Datto Variables

| Variable Name  | Type    | Default | Description                                                                                           |
|----------------|---------|---------|-------------------------------------------------------------------------------------------------------|
| `PackageId`    | `String`|         | Package name(s) you want to uninstall, separated by commas. Syntax: 'notepadd++.notepad++','Git.Git','Ditto.Ditto' |

### Output
stdOut & stdError

