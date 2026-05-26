# WezTerm Configuration

A modular, clean, and declarative configuration for the WezTerm terminal emulator.

## Structure

```bash
~/.config/wezterm/
├── wezterm.lua        # Entry point — requires and applies all modules
├── README.md          # This file
└── lua/
    ├── palette.lua    # Colour definitions — change M.active to switch themes
    ├── appearance.lua # Font, window chrome, tab bar colours
    ├── tabbar.lua     # Tab title and right-status rendering events
    ├── keymaps.lua    # Leader key, pane/tab keybindings, shell launch menu
```

## Planned modules

```bash
└── lua/
    └── projects.lua   # Workspace picker (~/Repos/* fuzzy search)
```

---

## Keybindings

### Custom (defined in keymaps.lua)

Leader key: `CTRL + A`

#### Tabs
| Keys | Action |
|------|--------|
| `CMD + T` | Open shell picker |

#### Panes — navigation (i3-style)
| Keys | Action |
|------|--------|
| `CMD + ←/→/↑/↓` | Move focus to pane in that direction |

#### Panes — splits (i3-style)
| Keys | Action |
|------|--------|
| `CMD + SHIFT + ←/→/↑/↓` | Split pane in that direction |

#### Panes — resize
| Keys | Action |
|------|--------|
| `CMD + CTRL + ←/→/↑/↓` | Resize pane in that direction |

#### Panes — other
| Keys | Action |
|------|--------|
| `LEADER + z` | Toggle pane zoom (fullscreen) |
| `LEADER + x` | Close current pane |
| `LEADER + f` | Fuzzy search open workspaces |
| `CTRL+A` then `CTRL+A` | Send CTRL+A to terminal (emacs start-of-line) |

---

### Defaults (WezTerm built-ins worth knowing)

#### Tabs
| Keys | Action |
|------|--------|
| `CMD + W` | Close current tab |
| `CMD + 1-9` | Jump to tab by index |
| `CMD + SHIFT + [` | Previous tab |
| `CMD + SHIFT + ]` | Next tab |

#### Window
| Keys | Action |
|------|--------|
| `CMD + N` | New window |
| `CMD + M` | Hide/minimise |
| `CMD + R` | Reload configuration |
| `ALT + Enter` | Toggle fullscreen |

#### Font size
| Keys | Action |
|------|--------|
| `CMD + =` | Increase font size |
| `CMD + -` | Decrease font size |
| `CMD + 0` | Reset font size |

#### Copy / Paste
| Keys | Action |
|------|--------|
| `CMD + C` | Copy to clipboard |
| `CMD + V` | Paste from clipboard |
| `CTRL+SHIFT + F` | Search scrollback |

---

## Adding a new shell or app to the launcher

Edit `lua/keymaps.lua` and add an entry to `launch_menu`:

```lua
{
  label = '  docker',
  args  = { '/usr/local/bin/docker', 'run', '-it', '--rm', 'ubuntu' },
},
```

`CMD + T` opens the picker.

## Switching themes

Edit `lua/palette.lua` and update the active line:

```lua
M.active = M.catppuccin
```

Both `appearance.lua` and `tabbar.lua` pick it up automatically.
