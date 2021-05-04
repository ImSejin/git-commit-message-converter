# Git Commit Message Converter
This intercepts your commit message and converts to the predefined template.



## Getting Started

1. Download `install.sh`, `.commit-message-templates`.
2. Place two files in the your repository path.
3. Execute `install.sh`.
4. Customize `.commit-message-templates` to your rule.
5. Commit with message like `{type}|{message}`



## Customizing templates

Content of `.commit-message-templates` is consist of three part.

`keyword`, `gitmoji`, `type`.



## Examples

```bash
git commit -m "add|new feature"
```

This message will be converted to `✨ Add: new feature`.



```bash
git commit -m "Add|new feature"
```

If `Add` is undefined type in the template, the commit fails.

