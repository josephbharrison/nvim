# NeoVim Installer - Mac OS X

[AstroNvim](https://astronvim.github.io) variant for Mac OS X

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
  - [astronvim](https://astronvim.github.io)
  - [Shatur/neovim-ayu](https://github.com/Shatur/neovim-ayu)
  - [EdenEast/nightfox.nvim](https://github.com/EdenEast/nightfox.nvim)
  - [folke/tokyonight](https://github.com/folke/tokyonight.nvim) (default)
- [**NerdFonts:**](https://www.nerdfonts.com)
  - [mononoki](https://www.programmingfonts.org/#mononoki)
  - [go-mono](https://www.programmingfonts.org/#go-mono)
  - [jetbrains-mono](https://www.programmingfonts.org/#jetbrains-mono)

## Installation

1. Install neovim

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/josephbharrison/nvim/HEAD/install.sh)"
```

2. Set preferred **NerdFont** in **iTerm2**

   > Preferences > Profile > Text > Font

3. (Optionally) Import **iTerm2** [profile](profiles/iterm2/Afterglow.json)

   > Preferences > Profile > Other Actions... > Import JSON Profiles...

## User Guide

```sh
nvim +Tutor
```

## Key Mappings

To view 'lead' mappings, open **nvim** and press `<Space>`:

![mappings][mappings]

> The `<Space>` key is the default _maplead_, change with: `vim.g.maplead = "<key>"`

### Navigation:

| Key Mapping  | Description                   |
| ------------ | ----------------------------- |
| `<Space>` e  | Toggle explorer (tree view)   |
| `<Space>` ff | Fuzzy finder (find/open file) |
| `<Shift>` l  | Next buffer (tab)             |
| `<Shift>` h  | Prev buffer (tab)             |
| `<Ctrl>` l   | Next window, right            |
| `<Ctrl>` h   | Next window, left             |
| `<Ctrl>` j   | Next window, down             |
| `<Ctrl>` k   | Next window, up               |

## Configuration

- **Languages:** `:LspInstall [language]`
- **Linters:** `:MasonInstall <linter>`
- **Formatters:** `:MasonInstall <formatter>`
- **Fonts:** `brew install --cask font-<font>-nerd-font`

### Advanced Configuration:

Update the _user_ configuration file: `~/.config/nvim/lua/user/init.lua`

> See [AstroNvim - Managing User Configuration](https://astronvim.github.io/Configuration/manage_user_config)

## Screenshots

![screen][screen]

[desktop]: https://raw.githubusercontent.com/josephbharrison/nvim/main/images/desktop.png
[screen]: https://raw.githubusercontent.com/josephbharrison/nvim/main/images/screen.png
[mappings]: https://raw.githubusercontent.com/josephbharrison/nvim/main/images/mappings.png
