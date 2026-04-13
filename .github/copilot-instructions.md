---
name: "Documentation Standards: Client-Facing Conciseness"
description: "Guide for generating documentation that is concise, accessible to clients, and focused on practical outcomes rather than internal implementation details. Apply to all documentation creation."
applyTo:
  - "docs/**"
  - "**/*.md"
---

# Documentation Standards: Client-Facing Conciseness

## Core Principles

All documentation in this project is client-facing. Prioritize clarity and actionability for audiences who may not be deeply technical or familiar with internal systems.

### 1. **Conciseness Over Completeness**

- Provide necessary information only; avoid deep dives into mechanics
- Use short sentences (aim for 15-20 words)
- Break content into scannable sections with clear headings
- Remove redundant explanations and wordy transitions
- Example:
  - ❌ "In order to accomplish the task of backing up your BitLocker recovery password, which is an important security measure that protects your system, you should follow these detailed steps..."
  - ✅ "Back up your BitLocker recovery password: [steps]"

### 2. **Skip Implementation Details**

- Focus on *what to do*, not *how it works internally*
- Omit architecture diagrams, technical explanations, or internal process flows unless directly relevant to client action
- Never include system internals, code logic, or backend processes unless the client needs to understand it
- Example:
  - ❌ "The system instantiates a ConfigurationProvider object that leverages dependency injection to load settings from the registry hive..."
  - ✅ "The tool reads your existing settings from Windows Registry and applies them automatically."

### 3. **Use Practical Examples Over Theory**

- Lead with real-world use cases
- Show step-by-step instructions with expected outcomes
- Use concrete scenarios clients will recognize
- Avoid abstract explanations without grounding in client experience
- Example:
  - ❌ "This parameter operates as a conditional modifier that applies transformations to input vectors..."
  - ✅ "Use this setting to treat Excel files with custom date formats. Example: If your file has dates as 'Jan 5, 2024', enable this option."

### 4. **Focus on Outcomes and Benefits**

- Frame documentation around what the client gains, not what the system does
- Lead sections with results, then explain steps
- Communicate expected outcomes upfront
- Example:
  - ❌ "The script performs iterations across the database collection..."
  - ✅ "This reduces setup time from 2 hours to 15 minutes. To get started, run: [command]"

### 5. **Accessible Language**

- Assume audience has general technical knowledge, not specialist knowledge
- Define jargon on first use
- Use active voice and direct instructions
- Replace technical abbreviations with full terms when context matters
- Example:
  - ❌ "Leverage DNS propagation to leverage CNAME resolution..."
  - ✅ "Point your domain to our servers using a CNAME record. This takes 24–48 hours to take effect."

## Structure Guidelines

### Headings
- Use clear, action-oriented headings
- Avoid generic terms; be specific about what's covered
- Example: ✅ "Back up your recovery key" vs ❌ "Backup Procedures"

### Content Sections
- **What it does**: One sentence describing the outcome
- **When to use it**: Brief context about when the client needs this
- **Steps**: Numbered, concise instructions with expected results
- **Troubleshooting**: Common issues and solutions (if relevant)

### Length Guidelines
- Introductions: 1-3 sentences max
- Sections: Under 200 words per major section
- Lists: 3-7 items; break into multiple lists if longer
- Paragraphs: 2-3 sentences max

## When to Stop

Ask yourself: "Does a client need to know this to use the product?"
- **Keep it**: Required to understand steps, configure settings, or troubleshoot
- **Remove it**: Internal workings, historical context, deep dives into why the system works this way

## Examples by Document Type

### How-To Guides
- Start with expected outcome
- List 3-5 main steps only; link to detailed substeps if complex
- Include "You'll know it worked when..." at the end

### Reference Docs
- Use tables for settings and options
- One-sentence descriptions for each parameter
- Practical example for each section

### Troubleshooting
- Problem → Cause → Solution format
- Avoid verbose explanations of root causes
- Link to detailed docs if client needs more context

### Administrator Guides
- "What you need" section upfront
- Outcome-first structure ("This will grant access to 50 users")
- Assumptions listed clearly
