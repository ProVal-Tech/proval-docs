---
id: 'e1783dde-9fda-4c89-80b3-0f5ecc73382c'
slug: /e1783dde-9fda-4c89-80b3-0f5ecc73382c
title: 'Installed AI Tools Audit'
title_meta: 'Installed AI Tools Audit'
keywords: ['audit', 'ai', 'ai-tools', 'audit-ai-tools', 'installed-ai', 'installed-ai-tools', 'installed-ai-applications', 'ai-browser-extensions', 'browser-ai-features']
description: 'Audits and displays installed AI tools, AI browser extensions, and built-in browser AI features on Windows Workstations.'
tags: ['auditing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-28
---

## Purpose

The goal of this solution is to audit Windows Workstations to identify installed Artificial Intelligence (AI) software, tools, frameworks, and browser extensions. It checks system-level installations, user-level installations, background app packages, Claude Code installations, AI command-line tools installed through npm, and the browser extensions in every user profile. It also reports the built-in AI features of each installed browser and whether a policy allows or disables them. The solution collects data on the application name, version, publisher, installation date, and source location, storing the results in a custom table for easy fleet-wide reporting and tracking.

## Currently Audited AI Applications

The audit looks for the following keywords in installed application names, browser extension names, and npm package names, grouped by category or parent company:

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
| **Browser AI Extensions** | `Monica`, `Sider`, `Merlin`, `MaxAI`, `HARPA`, `AIPRM`, `QuillBot`, `Compose AI`, `Wiseone`, `Otter.ai`, `Fireflies` |

Browser extensions are checked in Google Chrome, Microsoft Edge, Brave, Vivaldi, Opera, and Mozilla Firefox for every user and browser profile.

## Built-in Browser AI Features

For each installed browser, the audit reports its built-in AI features and the status of the policy that controls them. The Gemini Nano model is also reported for each user when Google Chrome has downloaded it.

| Browser | Built-in AI Feature | Policy Checked |
| --- | --- | --- |
| Microsoft Edge | Copilot | `Microsoft365CopilotChatIconEnabled` |
| Microsoft Edge | On-device AI model | `GenAILocalFoundationalModelSettings` |
| Google Chrome | Gemini in Chrome | `GeminiSettings`, then `GenAiDefaultSettings` |
| Google Chrome | On-device AI model | `GenAILocalFoundationalModelSettings` |
| Brave | Leo AI | `BraveAIChatEnabled` |
| Mozilla Firefox | AI features | `AIControls` (Firefox 149 and later), then `GenerativeAI` (Firefox 144 to 148) |
| Opera | Aria | None. Opera doesn't offer a policy for Aria. |

## Associated Content

### Script

| Content | Type | Function |
| --- | --- | --- |
| [Audit Installed AI Tools](/docs/f4273886-5b8f-11f1-b684-92000234cfc2) | Script | Runs the audit against Windows machines to identify installed AI applications, AI browser extensions, and built-in browser AI features, and stores the results in the custom table. |

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

:::note  
If the solution is already in place, only the [Audit Installed AI Tools](/docs/f4273886-5b8f-11f1-b684-92000234cfc2) script needs to be updated from the ProSync plugin. The custom table, dataview, internal monitor, and alert template are unchanged, so `Set_Environment` doesn't need to be run again.  
:::

## FAQ

### 1: Why is the Installed AI Tools Audit dataview empty?

> Microsoft Edge is installed on almost every Windows Workstation, so a successful audit usually returns at least the two Microsoft Edge built-in AI feature rows.
> If a computer has no rows at all, the script most likely hasn't run on it yet or didn't finish. Check the script logs to verify execution or to investigate any scanning issues.

### 2: How often does the automated audit run?

> The "Execute Script - Audit Installed AI Tools" internal monitor executes the auditing script once per week.
> It is specifically targeted to run against Windows Workstations.

### 3: How do I initially set up the custom database table?

> For the first run, you must execute the script with the `Set_Environment` user parameter set to `1`.
> This action automatically creates the required `pvl_installed_ai_applications_audit` custom table needed to store the collected data.

### 4: Where exactly does the script search for these applications?

> The script checks system-level installations, user-level installations, background Appx packages, Claude Code installations, global npm packages, and the browser extensions in every user profile.
> It matches the names it finds against the keywords listed above. Built-in browser AI features are reported for every installed browser, regardless of the keywords.

### 5: Why does the Publisher column show a user name or a policy status instead of a vendor?

> For browser extensions, the Publisher column shows the Windows user, browser profile, and extension ID, so you can tell which user installed the extension and where.
> For Claude Code and npm packages, it shows the Windows user, or `All users` for npm packages installed for the whole computer.
> For built-in browser AI features, it shows whether a policy allows or disables the feature, for example `Policy: Disabled (GeminiSettings = 1)` or `Policy: Not configured`.

### 6: Why does Copilot in Microsoft Edge appear on nearly every computer?

> Copilot is built into Microsoft Edge, which comes with Windows. The row shows that the feature is present and whether a policy controls it.
> `Policy: Not configured` means no policy is restricting the feature, so users can use it.

## Changelog

### 2026-10-28

- Added detection of AI browser extensions in Google Chrome, Microsoft Edge, Brave, Vivaldi, Opera, and Mozilla Firefox.
- Added reporting of built-in browser AI features with their policy status, along with the Gemini Nano model downloaded by Google Chrome.
- Added detection of Claude Code native installations and AI command-line tools installed as global npm packages.
- Added browser AI extension keywords to the audited list.
- Only the [Audit Installed AI Tools](/docs/f4273886-5b8f-11f1-b684-92000234cfc2) script changed. The custom table, dataview, internal monitor, and alert template are unchanged.

### 2026-06-01

- Initial version of the document.
