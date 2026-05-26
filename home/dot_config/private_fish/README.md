# Fish Abbreviations

Fish abbreviations expand in place when you press `Space` or `Enter`.
Unlike aliases, you see the full command before it runs — no hidden behaviour.

> **Fish only** — zsh uses `aliases.zsh` instead. Keep both in sync when
> adding new tools.

---

## How Abbreviations Work

```fish
# Type this:
ls<Space>

# Expands to:
lsd
```

The expansion is visible in the command line before execution. This means:
- You always know what command runs
- History stores the expanded command, not the abbreviation
- You can edit the expanded command before pressing Enter

---

## lsd — modern ls replacement
> `brew install lsd` · https://github.com/lsd-rs/lsd

| Abbreviation | Expands to | Purpose |
|-------------|------------|---------|
| `ls` | `lsd` | List directory contents with icons and colours |
| `tree` | `lsd --tree` | Recursive directory tree view |

---

## bat — cat with syntax highlighting
> `brew install bat` · https://github.com/sharkdp/bat

| Abbreviation | Expands to | Purpose |
|-------------|------------|---------|
| `batp` | `bat --plain` | View file without decorations — plain output |

---

## ripgrep — faster grep
> `brew install ripgrep` · https://github.com/BurntSushi/ripgrep

| Abbreviation | Expands to | Purpose |
|-------------|------------|---------|
| `grep` | `rg` | Search respecting `.gitignore`, hidden files excluded |
| `rgi` | `rg --no-ignore` | Search including gitignored and hidden files |
| `rgf` | `rg --files` | List all files that would be searched |

---

## Navigation

| Abbreviation | Expands to | Purpose |
|-------------|------------|---------|
| `..` | `cd ..` | Up one directory |
| `...` | `cd ../..` | Up two directories |
| `....` | `cd ../../..` | Up three directories |

---

## Planned

Abbreviations are added when the full command becomes genuinely painful
to type repeatedly. Candidates for future tools:

| Tool | Example |
|------|---------|
| `kubectl` | `kgpa` → `kubectl get pods --all-namespaces` |
| `docker` | `dps` → `docker ps` |
| `podman` | `pps` → `podman ps` |
| `terraform` | `tfa` → `terraform apply` |

---

## Managing Abbreviations

```fish
# List all abbreviations
abbr

# Add a new abbreviation
abbr --add NAME 'COMMAND'

# Remove an abbreviation
abbr --erase NAME

# Edit an abbreviation
abbr --rename OLD NEW
```
