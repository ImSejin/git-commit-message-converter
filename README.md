# Git Commit Message Converter
This intercepts your commit message and converts to the predefined template.



## Getting Started

1. Download `install.sh`, `.commit-message-templates`.
2. Place two files in the your repository path.
3. Execute `install.sh`.
4. Customize `.commit-message-templates` to your rule.
5. Commit with message like `{keyword}|{message}`.



## Customizing templates

Content of `.commit-message-templates` is consist of three part.

`keyword`, `gitmoji`, `type`.

<br>

Here is example.

```text
keyword,gitmoji,type // DO NOT EDIT THIS
bug,🐞,Fix
imp,⚡️,Improve
mg,🔀,Merge
acf,🔧,Add
ucf,🔧,Update
```

These templates mean the following table.

<br>

| keyword | gitmoji |  type   |
| :-----: | :-----: | :-----: |
|   bug   |    🐞    |   Fix   |
|   imp   |    ⚡️    | Improve |
|   mg    |    🔀    |  Merge  |
|   acf   |    🔧    |   Add   |
|   ucf   |    🔧    | Update  |

* `bug|{message}` => `🐞 Fix: {message}`
* `imp|{message}` => `⚡️ Improve: {message}`
* `mg|{message}` => `🔀 Merge: {message}`
* `acf|{message}` => `🔧 Add: {message}`
* `ucf|{message}` => `🔧 Update: {message}`
* `fix|{message}` => `commit failure`



## Examples

```bash
git commit -m "add|new feature"
```

This message will be converted to `✨ Add: new feature`.



```bash
git commit -m "Add|new feature"
```

If `Add` is undefined `keyword` in the template, the commit fails.

