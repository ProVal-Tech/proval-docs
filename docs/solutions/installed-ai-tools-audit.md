---
id: 'e1783dde-9fda-4c89-80b3-0f5ecc73382c'
slug: /e1783dde-9fda-4c89-80b3-0f5ecc73382c
title: 'Installed AI Tools Audit'
title_meta: 'Installed AI Tools Audit'
keywords: ['audit', 'ai', 'ai-tools', 'audit-ai-tools', 'installed-ai', 'installed-ai-tools', 'installed-ai-applications']
description: 'Audits and displays installed AI Tools on Windows Workstations.'
tags: ['auditing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-01
---

## Purpose

The goal of this solution is to audit Windows Workstations to identify installed Artificial Intelligence (AI) software, tools, or frameworks. It automatically checks system-level installations, user-level installations, and background app packages to compile a list of recognized AI applications. The solution collects data on the application name, version, publisher, installation date, and source location, storing the results in a custom table for easy fleet-wide reporting and tracking.

## Currently Audited AI Applications

The audit actively looks for the following AI tools, grouped by category or parent company:

| Category | Targeted Applications & Keywords |
| --- | --- |
| **Microsoft & OpenAI** | `Copilot`, `ChatGPT`, `OpenAI`, `Codex`, `DALL-E`, `GitHub Copilot` |
| **Google** | `Gemini`, `Bard`, `Vertex AI`, `Google AI Studio` |
| **Anthropic** | `Claude`, `Anthropic` |
| **Meta & xAI** | `LLaMA`, `Meta AI`, `Grok` |
| **Local AI Desktop Apps** | `LM Studio`, `Ollama`, `GPT4All`, `Jan`, `AnythingLLM`, `NVIDIA ChatRTX`, `ChatRTX`, `Msty`, `Faraday` |
| **AI Coding Assistants** | `Cursor`, `Windsurf`, `Codeium`, `Cody`, `Supermaven`, `Tabnine`, `Replit AI` |
| **Image & Creative AI** | `Stable Diffusion`, `ComfyUI`, `InvokeAI`, `Fooocus`, `Automatic1111`, `DreamStudio`, `Midjourney`, `Leonardo AI`, `Clipdrop`, `Krea`, `Canva AI`, `Firefly`, `Adobe Sensei` |
| **Marketing & Copywriting** | `Jasper`, `Copy.ai`, `Writesonic`, `Rytr`, `Anyword` |
| **Search & Chatbots** | `Perplexity`, `You.com`, `YouChat`, `Phind`, `Character.AI`, `Poe`, `Pi`, `Inflection` |
| **Cloud & Enterprise AI** | `Amazon Q`, `SageMaker`, `Watson`, `Databricks`, `Dolly`, `AI21`, `Jurassic` |
| **Frameworks & Platforms** | `Vercel AI`, `Botpress`, `LangChain`, `Flowise`, `Hugging Face`, `Transformers`, `Replicate`, `Groq`, `EleutherAI`, `GPT-NeoX` |
| **Other Global AI Models** | `Ernie`, `Mistral`, `Codestral`, `Falcon`, `DeepSeek`, `Cohere`, `Runway`, `RunwayML` |

## Associated Content

### Script

| Content | Type | Function |
| --- | --- | --- |
| [Audit Installed AI Tools](/docs/f4273886-5b8f-11f1-b684-92000234cfc2) | Script | Runs the audit against Windows machines to identify installed AI applications and stores the results in the custom table. |

### Monitor

| Content | Type | Function |
| --- | --- | --- |
| [Execute Script - Audit Installed AI Tools](/docs/b5f4d983-bd00-4f9f-9ec6-b385781f0164) | Internal Monitor | Executes the auditing script once per week against Windows Workstations. |

### Alert Template

| Content | Type | Function |
| --- | --- | --- |
| `△ Custom - Execute Script - Audit Installed AI Tools` | Alert Template | Executes the [Audit Installed AI Tools](/docs/f4273886-5b8f-11f1-b684-92000234cfc2) script against the machines detected by the internal monitor. |

### Data and Reporting

| Content | Type | Function |
| --- | --- | --- |
| [pvl_installed_ai_applications_audit](/docs/fcd315e9-e261-4553-a9c3-8440f748cdc6) | Custom Table | Stores the installed software audit results collected from each device. |
| [Installed AI Tools Audit](/docs/1ca43737-1bb0-4adf-be79-a6b9c3eaec54) | Dataview | Displays the installed AI software audit results for fleet-wide review and tracking. |

## Implementation

1. Import the associated script, internal monitor, dataview, and alert template from the ProSync plugin.
2. Execute the [Audit Installed AI Tools](/docs/f4273886-5b8f-11f1-b684-92000234cfc2) script on any online Windows device with the `Set_Environment` parameter set to `1`. This creates the required [pvl_installed_ai_applications_audit](/docs/fcd315e9-e261-4553-a9c3-8440f748cdc6) custom table.
3. Reload the system cache (**Ctrl + R**) and verify the custom table was created successfully.
4. Configure the solution as follows:
    - Navigate to `Automation` → `Monitors` within the CWA Control Center and set up the following:
    - [Execute Script - Audit Installed AI Tools](/docs/b5f4d983-bd00-4f9f-9ec6-b385781f0164)
        - Configure with the alert template: `△ Custom - Execute Script - Audit Installed AI Tools`
        - Right-click and **Run Now** to start the monitor.

## FAQ

### 1: Why is the Installed AI Tools Audit dataview empty?

> If the dataview is empty, it means that the automated check ran successfully, but no recognized AI applications were found on the computer.
> You can check the script logs to verify successful execution or to investigate any scanning issues.

### 2: How often does the automated audit run?

> The "Execute Script - Audit Installed AI Tools" internal monitor executes the auditing script once per week.
> It is specifically targeted to run against Windows Workstations.

### 3: How do I initially set up the custom database table?

> For the first run, you must execute the script with the `Set_Environment` user parameter set to `1`.
> This action automatically creates the required `pvl_installed_ai_applications_audit` custom table needed to store the collected data.

### 4: Where exactly does the script search for these applications?

> The script comprehensively checks system-level installations, user-level installations, and background Appx packages.
> It detects these installations based on an extensive array of predefined keywords associated with known AI tools.

## Changelog

### 2026-06-01

- Initial version of the document.
