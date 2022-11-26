# NeoVim Installer - Mac OS X

[AstroNvim](https://astronvim.github.io) variant with included custom user configuration.
![desktop][desktop]

## Includes

- [**Languages:**](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
  - [C](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd)
  - [Go](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls)
  - [Node](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver)
  - [Python](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright)
  - [Rust](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer)
  - _Other_ (Bash, Docker, Lua, Make, Protobuf)
- [**Themes:**](https://github.com/topics/neovim-theme)
  - [shatur/neovim-ayu](https://github.com/Shatur/neovim-ayu) (default)
  - [catppuccin/nvim](https://github.com/catppuccin/nvim)
- [**NerdFonts:**](https://www.nerdfonts.com)
  - [mononoki](https://www.programmingfonts.org/#mononoki)
  - [go-mono](https://www.programmingfonts.org/#go-mono)
  - [jetbrains-mono](https://www.programmingfonts.org/#jetbrains-mono)

## Installation

1. Install neovim:

```sh
git clone https@github.com:josephbharrison/nvim.git
cd nvim/
./install.sh
```

2. Set preferred Nerdfont in [iTerm2](https://iterm2.com)

   > Preferences > Profile > Text > Font

3. (Optionally) Import iTerm2 [profile](profiles/iterm2/Afterglow.json)

   > Preferences > Profile > Other Actions... > Import JSON Profiles...

## User Guide

Start the tutorial:

```
nvim +Tutor
```

## Key Mappings

To view 'lead' mappings, open **nvim** and press `<Space>`:

![mappings][mappings]

> The `<Space>` key is the default _maplead_, change with: `vim.g.maplead = "<key>"`

### Navigation (Movements):

| Key Mapping | Description        |
| ----------- | ------------------ |
| `<Space>` e | Toggle explorer    |
| `<Space>` o | Focus explorer     |
| `<Shift>` l | Next buffer (tab)  |
| `<Shift>` h | Prev buffer (tab)  |
| `<Ctrl>` l  | Next window, right |
| `<Ctrl>` h  | Next window, left  |
| `<Ctrl>` j  | Next window, down  |
| `<Ctrl>` k  | Next window, up    |
| j           | Move cursor down   |
| k           | Move cursor up     |
| h           | Move cursor left   |
| l           | Move cursor right  |

### Leader Mappings:

| Key Mapping | Description        |
| ----------- | ------------------ |
| `<Space>` / | Comment line       |
| `<Space>` C | Force close buffer |
| `<Space>` c | Close buffer       |
| `<Space>` d | Alpha Dashboard    |
| `<Space>` e | Toggle explorer    |
| `<Space>` h | No highlight       |
| `<Space>` q | Quit               |
| `<Space>` w | Save               |
| `<Space>` b | +Buffer            |
| `<Space>` f | +File              |
| `<Space>` g | +Git               |
| `<Space>` l | +LSP               |
| `<Space>` o | Focus explorer     |
| `<Space>` p | +Packages          |
| `<Space>` S | +Session           |
| `<Space>` s | +Search            |
| `<Space>` t | +Terminal          |
| `<Space>` u | +UI                |

## Configuration:

- **Languages:** `:LspInstall [language]`
- **Linters:** `:MasonInstall <linter>` or `:Mason`
- **Formatters:** `:MasonInstall <formatter>` or `:Mason`
- **Fonts:** `brew install --cask font-<font>-nerd-font`

## Advanced Configuration:

Update the _user_ configuration file: `~/.config/nvim/lua/user/init.lua`

> See [AstroNvim - Managing User Configuration](https://astronvim.github.io/Configuration/manage_user_config)

## Screenshots

![screen][screen]

[desktop]: https://raw.githubusercontent.com/josephbharrison/nvim/main/images/desktop.png
[screen]: https://raw.githubusercontent.com/josephbharrison/nvim/main/images/screen.png
[mappings]: https://raw.githubusercontent.com/josephbharrison/nvim/main/images/mappings.png
