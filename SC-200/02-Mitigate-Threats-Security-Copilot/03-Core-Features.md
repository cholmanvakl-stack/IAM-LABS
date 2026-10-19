# Describe the core features of Microsoft Security Copilot

## Main concept
The `standalone Security Copilot experience` supports sessions, plugins, workspaces, promptbooks and knowledge connections for repeatable security analysis.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/security-copilot-describe-core-features/

## Core knowledge
- Standalone sessions and supported features
- Workspaces and collaboration boundaries
- Plugins as integrations with security data and capabilities
- Promptbooks and custom reusable workflows
- Knowledge base connections
- Exporting and sharing findings with appropriate review

## How concepts connect
Plugins provide access to relevant information; prompts ask questions; promptbooks standardize sequences; workspaces and sharing support collaboration.

## SC-200 exam decisions
Choose a promptbook for repeatable investigation steps, a plugin for data access, and a knowledge connection for additional organizational context.

## Troubleshooting
Check session/workspace → plugin enabled and authorized → knowledge source → promptbook steps → evidence in output.

## Check understanding
1. When should an analyst use a custom promptbook instead of manually repeating prompts?
2. What security product, data source, or feature would you use first, and why?
3. How would you verify that the output is accurate and that any recommended action is safe?

**Study tip:** Use the pattern `task → context → data source → Copilot response → evidence validation → analyst decision`.
