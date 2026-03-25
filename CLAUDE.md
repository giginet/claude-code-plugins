# CLAUDE.md

## Project structure

This is a Claude Code plugin marketplace repository. Plugins are stored under `plugins/`.

```
.claude-plugin/marketplace.json   # Marketplace catalog
plugins/<plugin-name>/             # Each plugin directory
  .claude-plugin/plugin.json       # Plugin manifest
  hooks/                           # Hook scripts
  skills/                          # Skill definitions
  README.md                        # Plugin documentation
```

## Versioning

When updating an existing plugin, bump the `version` field in both:

1. `plugins/<plugin-name>/.claude-plugin/plugin.json`
2. `.claude-plugin/marketplace.json` (the corresponding plugin entry)
