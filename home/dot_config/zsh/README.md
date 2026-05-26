# Zsh Configuration

A minimal Zsh configuration without a plugin manager.
All files live in `$ZDOTDIR` (`~/.config/zsh/`) except the bootstrap file.

## Structure

```bash
$HOME/
└── .zshenv                  # Bootstrap only — sets ZDOTDIR, sources $ZDOTDIR/.zshenv

$ZDOTDIR/                    # ~/.config/zsh/
├── README.md                # This file
├── .zshenv                  # XDG dirs, editors, ripgrep, GPG
├── .zprofile                # Login shell setup — Homebrew PATH
├── .zshrc                   # Interactive shell — history, completions, vi mode, plugins
└── aliases.zsh              # Aliases sourced by .zshrc
```

## Startup File Order

When WezTerm opens a tab with `zsh -l`:

```
1. $HOME/.zshenv       → sets ZDOTDIR, sources $ZDOTDIR/.zshenv
2. $ZDOTDIR/.zshenv    → XDG dirs, EDITOR, VISUAL, ripgrep, GPG
3. $ZDOTDIR/.zprofile  → Homebrew PATH (login shells only)
4. $ZDOTDIR/.zshrc     → history, completions, vi mode, keybindings, plugins
```

`aliases.zsh` is not sourced directly by zsh — `.zshrc` sources it explicitly.

---

## File Descriptions

### `$HOME/.zshenv`

Bootstrap file. Must live in `$HOME` — zsh reads this before `ZDOTDIR` is
known. Sets `ZDOTDIR` then explicitly sources `$ZDOTDIR/.zshenv`.

```zsh
export ZDOTDIR="$HOME/.config/zsh"
. "$ZDOTDIR"/.zshenv
```

---

### `$ZDOTDIR/.zshenv`

Environment variables needed by all shell invocations — interactive,
non-interactive, and scripts.

```zsh
# XDG Base Directory
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Editors
export EDITOR="vim"
export VISUAL="nvim"

# ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"

# GPG
export GPG_TTY=$(tty)
```

---

### `$ZDOTDIR/.zprofile`

Sourced once per login shell. Used for setup that only needs to run once —
child shells inherit the environment.

```zsh
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Why here and not `.zshrc`: `brew shellenv` spawns a subprocess. Running it
once per login session is more efficient than once per interactive shell.

---

### `$ZDOTDIR/.zshrc`

Sourced on every interactive shell. The main config file.

Sections in order:

| Section | What it does |
|---------|-------------|
| History | XDG-compliant `HISTFILE`, dedup, real-time sync across sessions |
| Completions | Homebrew `fpath`, `compinit` with XDG cache paths, completion options |
| Navigation | `AUTO_CD`, `CORRECT`, `GLOB_DOTS` |
| Vi Mode | `bindkey -v`, `KEYTIMEOUT`, cursor shape feedback |
| Key Bindings | Prefix-based history search on up/down arrow |
| Aliases | Sources `aliases.zsh` |
| Prompt | Starship initialisation |
| Plugins | `zsh-autosuggestions`, `fzf`, `fd`, `mise`, `zsh-syntax-highlighting` |

XDG paths used:
- History: `$XDG_STATE_HOME/zsh/history`
- Completion cache: `$XDG_CACHE_HOME/zsh/zcompcache`
- Completion dump: `$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION`

---

### `$ZDOTDIR/aliases.zsh`

Aliases sourced from `.zshrc`.

| Alias | Command | Purpose |
|-------|---------|---------|
| `ls` | `lsd` | Modern `ls` replacement |
| `tree` | `lsd --tree` | Directory tree view |
| `cat` | `bat` | `cat` with syntax highlighting |
| `catp` | `bat --plain` | `cat` without decorations |
| `grep` | `rg` | faster grep |
| `rgi` | `rg --no-ignore` | Search including gitignored files |
| `rgf` | `rg --files` | List files that would be searched |
| `..` | `cd ..` | Up one directory |
| `...` | `cd ../..` | Up two directories |
| `....` | `cd ../../..` | Up three directories |
| `rm` | `rm -i` | Confirm before deleting |
| `mv` | `mv -i` | Confirm before overwriting |
| `cp` | `cp -i` | Confirm before overwriting |

---

## Plugins

| Plugin | Installed via | Purpose |
|--------|--------------|---------|
| `zsh-autosuggestions` | Homebrew | Suggest commands from history and completions |
| `fzf` | Homebrew | Fuzzy history search, file picker, completion |
| `zsh-syntax-highlighting` | Homebrew | Colour commands as you type — must be sourced last |

## Tools

| Tool | Installed via | Purpose |
|------|--------------|---------|
| `lsd` | Homebrew | Modern `ls` replacement with icons and colours |
| `bat` | Homebrew | `cat` with syntax highlighting, Nord theme |
| `ripgrep` | Homebrew | Faster `grep`, respects `.gitignore` |
| `fd` | Homebrew | Faster `find`, used for fzf path completion |
| `starship` | Homebrew | Cross-shell prompt — consistent across zsh, Fish, Nushell |
| `mise` | Homebrew | Language runtime version manager per project |

---

## Vi Mode Reference

Vi mode is activated with `bindkey -v`. The cursor shape indicates the current
mode — beam `|` in INSERT, block `█` in NORMAL.

> **Note:** Zsh vi mode follows vim's verb-first model (`ciw`), not Helix's
> selection-first model (`miw` then `c`).

### Modes

| Mode | Cursor | How to enter |
|------|--------|-------------|
| INSERT | `\|` beam | Default on new prompt, or `i`, `a`, `I`, `A` from NORMAL |
| NORMAL | `█` block | `ESC` |

### INSERT Mode

> Emacs bindings like `CTRL+A` and `CTRL+E` are not available in vi mode.
> Use NORMAL mode equivalents `0` and `$` instead.

| Key | Action |
|-----|--------|
| `ESC` | Switch to NORMAL mode |
| `CTRL+W` | Delete word backwards |
| `CTRL+U` | Delete entire line |
| `↑` | Search history by prefix (what you've typed so far) |
| `↓` | Search history forward by prefix |
| `CTRL+R` | fzf fuzzy history search |
| `CTRL+T` | fzf fuzzy file finder |

### NORMAL Mode — Navigation

| Key | Action |
|-----|--------|
| `h` | Move left one character |
| `l` | Move right one character |
| `w` | Move forward one word |
| `b` | Move backward one word |
| `e` | Move to end of current word |
| `0` | Jump to start of line |
| `$` | Jump to end of line |
| `^` | Jump to first non-blank character |
| `f{char}` | Jump forward to character |
| `F{char}` | Jump backward to character |

### NORMAL Mode — Editing

| Key | Action |
|-----|--------|
| `x` | Delete character under cursor |
| `X` | Delete character before cursor |
| `d w` | Delete word forward |
| `d b` | Delete word backward |
| `d $` | Delete to end of line |
| `d 0` | Delete to start of line |
| `D` | Delete to end of line (shorthand for `d$`) |
| `c w` | Change word (delete and enter INSERT) |
| `c $` | Change to end of line |
| `C` | Change to end of line (shorthand for `c$`) |
| `r{char}` | Replace character under cursor |
| `u` | Undo |

### NORMAL Mode — Entering INSERT

| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `I` | Insert at start of line |
| `A` | Insert at end of line |

### NORMAL Mode — History

| Key | Action |
|-----|--------|
| `k` | Previous command (same as up arrow) |
| `j` | Next command (same as down arrow) |
| `/` | Search history backwards (type pattern, Enter to confirm) |
| `n` | Next match in history search |
| `N` | Previous match in history search |

### Most Used at the Prompt

| Pattern | What it does |
|---------|-------------|
| `ESC` `0` | Jump to start of line |
| `ESC` `$` | Jump to end of line |
| `ESC` `b` `b` | Move back two words |
| `ESC` `c w` | Change the current word |
| `ESC` `D` | Delete from cursor to end |
| `ESC` `u` | Undo last change |
| `ESC` `/` | Search history for a pattern |

---

## fzf Key Bindings

| Key | Action |
|-----|--------|
| `CTRL+R` | Fuzzy search command history |
| `CTRL+T` | Fuzzy find a file, paste path to command line |
| `**<TAB>` | Fuzzy completion trigger |
| `CTRL+Y` | Copy selected item to clipboard (in CTRL+R and CTRL+T) |
| `CTRL+/` | Toggle preview window (in CTRL+T) |
| `ESC` | Cancel fzf |
