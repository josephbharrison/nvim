# NeoVim Installer - Mac OS X

[AstroNvim](https://astronvim.github.io) variant with included custom user configuration.
![screen][screen]

## Includes:

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

## Installation:

1. Install neovim:

```sh
$ install.sh
```

2. Set one of the above fonts in [iTerm2](https://iterm2.com).
   > Preferences > Profile > Text > Font

## Key Mappings:

| Key Mapping | Description        |
| ----------- | ------------------ |
| `<Space>` / | Comment line       |
| `<Space>` C | Force close buffer |
| `<Space>` c | Close buffer       |
| `<Space>` d | Alpha Dashboard    |
| `<Space>` e | Toggle explorer    |
| `<Space>` h | No highlight       |
| `<Space>` o | Focus explorer     |
| `<Space>` q | Quite              |
| `<Space>` w | Save               |
| `<Space>` b | +Buffer            |
| `<Space>` f | +File              |
| `<Space>` g | +Git               |
| `<Space>` l | +LSP               |
| `<Space>` p | +Packages          |
| `<Space>` S | +Session           |
| `<Space>` s | +Search            |
| `<Space>` t | +Terminal          |
| `<Space>` u | +UI                |

> The `<Space>` key is the default _maplead_, change with: `vim.g.maplead = "<key>"`

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

[screen]: https://raw.githubusercontent.com/josephbharrison/nvim/main/images/screen.png
