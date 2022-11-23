# NeoVim Installer - Mac OS X

[AstroNvim](https://astronvim.github.io) variant with included custom user configuration.

## Includes:

- **Languages:**
  - Bash
  - C
  - Docker
  - Go
  - Javascript
  - Rust
  - Make
  - Python
  - Protobuf
- [**Themes:**](https://github.com/topics/neovim-theme)
  - [shatur/neovim-ayu](https://github.com/Shatur/neovim-ayu) (default)
  - [catppuccin/nvim](https://github.com/catppuccin/nvim)
- [**NerdFonts:**](https://www.nerdfonts.com)
  - [mononoki](https://www.programmingfonts.org/#mononoki)
  - [go-mono](https://www.programmingfonts.org/#go-mono)

## Installation:

1. Install install neovim:

```sh
$ install.sh
```

2. Set one of the above fonts in iterm2.
   > Preferences > Profile > Text > Font

## Configuration:

- **Languages:** `:LspInstall [language]`
- **Linters:** `:MasonInstall <linter>` or `:Mason`
- **Formatters:** `:MasonInstall <formatter>` or `:Mason`
- **Fonts:** `brew install --cask font-<font>-nerd-font`

## Advanced Configuration:

Update the _user_ configuration file: `lua/user/init.lua`

> See [AstroNvim - Managing User Configuration](https://astronvim.github.io/Configuration/manage_user_config)

## Screenshot

![screen][screen]

[screen]: https://raw.githubusercontent.com/josephbharrison/nvim/main/images/screen.png
