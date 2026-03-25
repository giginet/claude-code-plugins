# claude-code-plugins

giginet's Claude Code plugin marketplace.

## Usage

Add this marketplace and install plugins:

```sh
/plugin marketplace add giginet/claude-code-plugins
/plugin install <plugin-name>@giginet
```

## Plugins

### apple-swift-format

Integrates [apple/swift-format](https://github.com/swiftlang/swift-format) into Claude Code.

```sh
/plugin install apple-swift-format@giginet
```

**Requirements:**

- Xcode (provides `/usr/bin/xcrun swift-format`)
- `.swift-format` configuration file in your project root

**Features:**

| Hook | Trigger | Behavior |
|------|---------|----------|
| PreToolUse | `Edit` / `Write` | Runs `swift-format lint`. Denies the action with lint errors as feedback if it fails. |
| PostToolUse | `Edit` / `Write` | Runs `swift-format format --in-place` to auto-format the file. |

Both hooks only activate when a `.swift-format` file exists in the current working directory, and only process `.swift` files.
