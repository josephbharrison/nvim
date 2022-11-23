# NeoVim Installer - Mac OS X

[AstroNvim](https://astronvim.github.io) variant with included custom user configuration.

## Includes:

- **Language Support**
  - Bash
  - C
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

- **LSP:** `:LspInstall [language]`
- **Linters:** `:MasonInstall <formatter>` or `:Mason`
- **Formatters:** `:MasonInstall <formatter>` or `:Mason`
- **Themes:** `<TODO>`
- **Fonts:** `brew install --cask font-<font>-nerd-font`

## Screenshot

![screen][screen]

[screen]: https://raw.githubusercontent.com/josephbharrison/nvim/main/images/screen.png
