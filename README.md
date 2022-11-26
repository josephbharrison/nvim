# NeoVim Installer - Mac OS X

[AstroNvim](https://astronvim.github.io) variant with included custom user configuration.

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

| Key Mapping | Description     |
| ----------- | --------------- |
| `<Space>` e | Toggle explorer |

> The `<Space>` key is the default _maplead_, change with: `vim.g.maplead = "<key>"`

## Configuration:

- **Languages:** `:LspInstall [language]`
- **Linters:** `:MasonInstall <linter>` or `:Mason`
- **Formatters:** `:MasonInstall <formatter>` or `:Mason`
- **Fonts:** `brew install --cask font-<font>-nerd-font`

## Advanced Configuration:

Update the _user_ configuration file: `~/.config/nvim/lua/user/init.lua`

> See [AstroNvim - Managing User Configuration](https://astronvim.github.io/Configuration/manage_user_config)

## Screenshot

![screen][screen]

[screen]: https://raw.githubusercontent.com/josephbharrison/nvim/main/images/screen.png
