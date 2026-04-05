# openspec-plannotator

Claude Code plugin that auto-opens [Plannotator](https://plannotator.ai/) for visual review after [OpenSpec](https://openspec.dev/) generates change artifacts.

## What it does

When you run `/openspec-propose` and Claude generates design docs, specs, and tasks, Plannotator automatically opens in your browser for annotation. Your feedback returns to Claude as structured input.

- Detects writes to `openspec/changes/*/` paths
- Reuses existing Plannotator session if one is already running
- No absolute paths, fully portable

## Prerequisites

- [Claude Code](https://claude.ai/code)
- [Plannotator](https://plannotator.ai/) CLI: `curl -fsSL https://plannotator.ai/install.sh | bash`
- [OpenSpec](https://openspec.dev/) CLI: `npm i -g openspec`

## Install

```bash
/plugin marketplace add vvaravva/openspec-plannotator
/plugin install openspec-plannotator@openspec-plannotator
```

Restart Claude Code after install.

## How it works

Two hooks:

1. **PostToolUse (Write)** — when Claude writes a file under `openspec/changes/*/`, sets a flag
2. **Stop** — when Claude finishes responding, checks the flag and opens `plannotator annotate` on the change directory

If Plannotator is already running for that project, it opens the existing tab instead of starting a new instance.
