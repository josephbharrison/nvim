-- Harpoon keymaps
local harpoon = {
    ["menu"] = { function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon Menu" },
    ["add_file"] = { function() require("harpoon.mark").add_file() end, desc = "Add File" },
    ["nav_next"] = { function() require("harpoon.ui").nav_next() end, desc = "Next File" },
    ["nav_prev"] = { function() require("harpoon.ui").nav_prev() end, desc = "Previous File" },
    ["file_1"] = { function() require("harpoon.ui").nav_file(1) end, desc = "File 1" },
    ["file_2"] = { function() require("harpoon.ui").nav_file(2) end, desc = "File 2" },
    ["file_3"] = { function() require("harpoon.ui").nav_file(3) end, desc = "File 3" },
    ["file_4"] = { function() require("harpoon.ui").nav_file(4) end, desc = "File 4" },
    ["tmux_1"] = { function() require("harpoon.tmux").gotoTerminal(1) end, desc = "TMux 1" },
    ["tmux_2"] = { function() require("harpoon.tmux").gotoTerminal(2) end, desc = "TMux 2" },
    ["tmux_3"] = { function() require("harpoon.tmux").gotoTerminal(3) end, desc = "TMux 3" },
    ["tmux_4"] = { function() require("harpoon.tmux").gotoTerminal(4) end, desc = "TMux 4" },
    ["term_1"] = { function() require("harpoon.term").gotoTerminal(1) end, desc = "Terminal 1" },
    ["term_2"] = { function() require("harpoon.term").gotoTerminal(2) end, desc = "Terminal 2" },
    ["term_3"] = { function() require("harpoon.term").gotoTerminal(3) end, desc = "Terminal 3" },
    ["term_4"] = { function() require("harpoon.term").gotoTerminal(4) end, desc = "Terminal 4" },
    ["telescope"] = { ":Telescope harpoon marks<cr>", desc = "Telescope Marks" },
}
--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
-- harpoon functions for quick file access and bookmarks
local config = {

    -- Configure AstroNvim updates
    updater = {
        remote = "origin", -- remote to use
        channel = "stable", -- "stable" or "nightly"
        version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "main", -- branch name (NIGHTLY ONLY)
        commit = nil, -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false, -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_reload = false, -- automatically reload and sync packer after a successful update
        auto_quit = false, -- automatically quit the current session after a successful update
        -- remotes = { -- easily add new remotes to track
        --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
        --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
        --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        -- },
    },

    -- Set colorscheme to use
    colorscheme = "tokyonight",

    -- Add highlight groups in any theme
    highlights = {
        -- init = { -- this table overrides highlights in all themes
        --   Normal = { bg = "#000000" },
        -- }
        -- duskfox = { -- a table of overrides/changes to the duskfox theme
        --   Normal = { bg = "#000000" },
        -- },
    },

    -- set vim options here (vim.<first_key>.<second_key> = value)
    options = {
        opt = {
            -- set to true or false etc.
            relativenumber = true, -- sets vim.opt.relativenumber
            number = true, -- sets vim.opt.number
            spell = false, -- sets vim.opt.spell
            signcolumn = "auto", -- sets vim.opt.signcolumn to auto
            wrap = false, -- sets vim.opt.wrap
        },
        g = {
            mapleader = " ", -- sets vim.g.mapleader
            autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
            cmp_enabled = true, -- enable completion at start
            autopairs_enabled = true, -- enable autopairs at start
            diagnostics_enabled = true, -- enable diagnostics at start
            status_diagnostics_enabled = true, -- enable diagnostics in statusline
            icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
            ui_notifications_enabled = true, -- disable notifications when toggling UI elements
            heirline_bufferline = false, -- enable new heirline based bufferline (requires :PackerSync after changing)
        },
    },
    -- If you need more control, you can use the function()...end notation
    -- options = function(local_vim)
    --   local_vim.opt.relativenumber = true
    --   local_vim.g.mapleader = " "
    --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
    --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
    --
    --   return local_vim
    -- end,

    -- Set dashboard header
    header = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
    },

    -- Default theme configuration
    default_theme = {
        -- Modify the color palette for the default theme
        colors = {
            fg = "#abb2bf",
            bg = "#1e222a",
        },
        highlights = function(hl) -- or a function that returns a new table of colors to set
            local C = require "default_theme.colors"

            hl.Normal = { fg = C.fg, bg = C.bg }

            -- New approach instead of diagnostic_style
            hl.DiagnosticError.italic = true
            hl.DiagnosticHint.italic = true
            hl.DiagnosticInfo.italic = true
            hl.DiagnosticWarn.italic = true

            return hl
        end,
        -- enable or disable highlighting for extra plugins
        plugins = {
            aerial = true,
            beacon = false,
            bufferline = true,
            cmp = true,
            dashboard = true,
            highlighturl = true,
            hop = false,
            indent_blankline = true,
            lightspeed = false,
            ["neo-tree"] = true,
            notify = true,
            ["nvim-tree"] = false,
            ["nvim-web-devicons"] = true,
            rainbow = true,
            symbols_outline = false,
            telescope = true,
            treesitter = true,
            vimwiki = false,
            ["which-key"] = true,
        },
    },

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
        virtual_text = true,
        underline = true,
    },

    -- Extend LSP configuration
    lsp = {
        -- enable servers that you already have installed without mason
        servers = {
            -- "pyright"
        },
        formatting = {
            -- control auto formatting on save
            format_on_save = {
                enabled = true, -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    -- "go",
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    -- "python",
                },
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                -- "sumneko_lua",
            },
            timeout_ms = 1000, -- default format timeout
            -- filter = function(client) -- fully override the default formatting function
            --   return true
            -- end
        },
        -- easily add or disable built in mappings added during LSP attaching
        mappings = {
            n = {
                -- ["<leader>lf"] = false -- disable formatting keymap
            },
        },
        -- add to the global LSP on_attach function
        -- on_attach = function(client, bufnr)
        -- end,

        -- override the mason server-registration function
        -- server_registration = function(server, opts)
        --   require("lspconfig")[server].setup(opts)
        -- end,

        -- Add overrides for LSP server settings, the keys are the name of the server
        ["server-settings"] = {
            -- example for addings schemas to yamlls
            -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
            --   settings = {
            --     yaml = {
            --       schemas = {
            --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
            --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
            --       },
            --     },
            --   },
            -- },
        },
    },

    -- Mapping data with "desc" stored directly by vim.keymap.set().
    --
    -- Please use this mappings table to set keyboard mapping since this is the
    -- lower level configuration and more robust one. (which-key will
    -- automatically pick-up stored data by this setting.)
    mappings = {
        -- first key is the mode
        n = {
            -- second key is the lefthand side of the map
            -- mappings seen under group name "Buffer"
            ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
            ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
            ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
            ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
            -- quick save
            -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        },
        t = {
            -- setting a mapping to false will disable it
            -- ["<esc>"] = false,
        },
    },

    -- Configure plugins
    plugins = {
        init = {
            -- You can disable default plugins as follows:
            -- ["goolord/alpha-nvim"] = { disable = true },

            -- You can also add new plugins here as well:
            -- Add plugins, the packer syntax without the "use"
            -- { "andweeb/presence.nvim" },
            -- {
            --   "ray-x/lsp_signature.nvim",
            --   event = "BufRead",
            --   config = function()
            --     require("lsp_signature").setup()
            --   end,
            -- },

            -- We also support a key value style plugin definition similar to NvChad:
            -- ["ray-x/lsp_signature.nvim"] = {
            --   event = "BufRead",
            --   config = function()
            --     require("lsp_signature").setup()
            --   end,
            -- },
            {
                "shatur/neovim-ayu",
                as = "ayu",
                config = function() require("ayu").setup {} end,
            },
            {
                "EdenEast/nightfox.nvim",
                as = "nightfox",
                config = function() require("nightfox").setup {} end,
            },
            {
                "folke/tokyonight.nvim",
                as = "tokyonight",
                config = function() require("tokyonight").setup {} end,
            },
            {
                "folke/twilight.nvim",
                as = "twilight",
                config = function()
                    require("twilight").setup {
                        dimming = {
                            alpha = 0.25, -- amount of dimming
                            -- we try to get the foreground from the highlight groups or fallback color
                            color = { "Normal", "#ffffff" },
                            term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
                            inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
                        },
                        context = 10, -- amount of lines we will try to show around the current line
                        treesitter = true, -- use treesitter when available for the filetype
                        -- treesitter is used to automatically expand the visible text,
                        -- but you can further control the types of nodes that should always be fully expanded
                        expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
                            "function",
                            "method",
                            "table",
                            "if_statement",
                        },
                        exclude = {}, -- exclude these filetypes
                    }
                end,
            },
            {
                "folke/zen-mode.nvim",
                as = "zen-mode",
                config = function()
                    require("zen-mode").setup {
                        window = {
                            backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                            -- height and width can be:
                            -- * an absolute number of cells when > 1
                            -- * a percentage of the width / height of the editor when <= 1
                            -- * a function that returns the width or the height
                            width = 120, -- width of the Zen window
                            height = 1, -- height of the Zen window
                            -- by default, no options are changed for the Zen window
                            -- uncomment any of the options below, or add other vim.wo options you want to apply
                            options = {
                                -- signcolumn = "no", -- disable signcolumn
                                -- number = false, -- disable number column
                                -- relativenumber = false, -- disable relative numbers
                                -- cursorline = false, -- disable cursorline
                                -- cursorcolumn = false, -- disable cursor column
                                -- foldcolumn = "0", -- disable fold column
                                -- list = false, -- disable whitespace characters
                            },
                        },
                        plugins = {
                            -- disable some global vim options (vim.o...)
                            -- comment the lines to not apply the options
                            options = {
                                enabled = true,
                                ruler = false, -- disables the ruler text in the cmd line area
                                showcmd = false, -- disables the command in the last line of the screen
                            },
                            twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
                            gitsigns = { enabled = false }, -- disables git signs
                            tmux = { enabled = false }, -- disables the tmux statusline
                            -- this will change the font size on kitty when in zen mode
                            -- to make this work, you need to set the following kitty options:
                            -- - allow_remote_control socket-only
                            -- - listen_on unix:/tmp/kitty
                            kitty = {
                                enabled = true,
                                font = "+4", -- font size increment
                            },
                        },
                        -- callback where you can add custom code when the Zen window opens
                        on_open = function(win) end,
                        -- callback where you can add custom code when the Zen window closes
                        on_close = function() end,
                    }
                end,
            },
            {
                "ThePrimeagen/harpoon",
                as = "harpoon",
                config = function()
                    require("harpoon").setup {
                        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
                        save_on_toggle = false,
                        -- saves the harpoon file upon every change. disabling is unrecommended.
                        save_on_change = true,
                        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
                        enter_on_sendcmd = false,
                        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
                        tmux_autoclose_windows = false,
                        -- filetypes that you want to prevent from adding to the harpoon list menu.
                        excluded_filetypes = { "harpoon" },
                        -- set marks specific to each git branch inside git repository
                        mark_branch = false,
                    }
                end,
            },
        },
        -- All other entries override the require("<key>").setup({...}) call for default plugins
        ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
            -- config variable is the default configuration table for the setup function call
            -- local null_ls = require "null-ls"

            -- Check supported formatters and linters
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
            config.sources = {
                -- Set a formatter
                -- null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.formatting.prettier,
            }
            return config -- return final config table
        end,
        treesitter = { -- overrides `require("treesitter").setup(...)`
            -- ensure_installed = { "lua" },
            ensure_installed = {
                "bash",
                "c",
                "go",
                "lua",
                "python",
                "rust",
            },
        },
        -- use mason-lspconfig to configure LSP installations
        ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
            -- ensure_installed = { "sumneko_lua" },
            ensure_installed = {
                "bashls",
                "clangd",
                "dockerls",
                "golangci_lint_ls",
                "sumneko_lua",
                "gopls",
                "pyright",
                "rust_analyzer",
                "tsserver",
            },
        },
        -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
        ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
            -- ensure_installed = { "prettier", "stylua" },
            ensure_installed = {
                "buf",
                "clangd-format",
                "gofumpt",
                "goimports",
                "prettier",
                "pylint",
                "revive",
            },
        },
        ["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
            -- ensure_installed = { "python" },
            ensure_installed = {
                "javascript",
                "python",
                "go",
            },
        },
    },

    -- LuaSnip Options
    luasnip = {
        -- Extend filetypes
        filetype_extend = {
            -- javascript = { "javascriptreact" },
        },
        -- Configure luasnip loaders (vscode, lua, and/or snipmate)
        vscode = {
            -- Add paths for including more VS Code style snippets in luasnip
            paths = {},
        },
    },

    -- CMP Source Priorities
    -- modify here the priorities of default cmp sources
    -- higher value == higher priority
    -- The value can also be set to a boolean for disabling default sources:
    -- false == disabled
    -- true == 1000
    cmp = {
        source_priority = {
            nvim_lsp = 1000,
            luasnip = 750,
            buffer = 500,
            path = 250,
        },
    },

    -- Customize Heirline options
    heirline = {
        -- -- Customize different separators between sections
        -- separators = {
        --   tab = { "", "" },
        -- },
        -- -- Customize colors for each element each element has a `_fg` and a `_bg`
        -- colors = function(colors)
        --   colors.git_branch_fg = astronvim.get_hlgroup "Conditional"
        --   return colors
        -- end,
        -- -- Customize attributes of highlighting in Heirline components
        -- attributes = {
        --   -- styling choices for each heirline element, check possible attributes with `:h attr-list`
        --   git_branch = { bold = true }, -- bold the git branch statusline component
        -- },
        -- -- Customize if icons should be highlighted
        -- icon_highlights = {
        --   breadcrumbs = false, -- LSP symbols in the breadcrumbs
        --   file_icon = {
        --     winbar = false, -- Filetype icon in the winbar inactive windows
        --     statusline = true, -- Filetype icon in the statusline
        --   },
        -- },
    },

    -- Modify which-key registration (Use this with mappings table in the above.)
    ["which-key"] = {
        -- Add bindings which show up as group name
        register = {
            -- first key is the mode, n == normal mode
            n = {
                -- second key is the prefix, <leader> prefixes
                ["<leader>"] = {
                    -- third key is the key to bring up next level and its displayed
                    -- group name in which-key top level menu
                    ["b"] = { name = "Buffer" },
                    ["h"] = {
                        name = "Harpoon",
                        ["t"] = { name = "Terminal" },
                        ["m"] = { name = "TMux" },
                    },
                },
            },
        },
    },

    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    polish = function()
        -- Set up custom filetypes
        -- vim.filetype.add {
        --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
        --     ["Foofile"] = "fooscript",
        --   },
        --   pattern = {
        --     ["~/%.config/foo/.*"] = "fooscript",
        --   },
        -- }
    end,
}

return config
