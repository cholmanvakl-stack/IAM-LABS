# Introduction to generative AI and agents

## Main concept
`Generative AI` uses models such as `large language models (LLMs)` to produce responses; `AI agents` can plan or perform tasks using tools and instructions.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/fundamentals-generative-ai/

## Core knowledge
- Large language models and probabilistic text generation
- Prompts, context, instructions and output quality
- AI agents, tools and multi-step workflows
- Limitations: hallucinations, missing context, sensitive data and human validation

## How concepts connect
Security Copilot builds on LLMs and prompts. An analyst supplies a clear question and relevant security context, then validates the response against actual telemetry.

## SC-200 exam decisions
Distinguish a model, prompt and agent; know why evidence verification and appropriate data handling remain necessary.

## Troubleshooting
Check prompt clarity → supplied context → available tools/data → generated claims → independent evidence.

## Check understanding
1. Why should an analyst never treat a generated incident summary as proof without checking source evidence?
2. What security product, data source, or feature would you use first, and why?
3. How would you verify that the output is accurate and that any recommended action is safe?

**Study tip:** Use the pattern `task → context → data source → Copilot response → evidence validation → analyst decision`.
