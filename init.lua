local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

for _, source in ipairs {
    "core.utils",
    "core.options",
    "core.bootstrap",
    "core.diagnostics",
    "core.autocmds",
    "core.mappings",
    "configs.which-key-register",
} do
    local status_ok, fault = pcall(require, source)
    if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

astronvim.conditional_func(astronvim.user_plugin_opts("polish", nil, false))

if vim.fn.has "nvim-0.8" ~= 1 or vim.version().prerelease then
    vim.schedule(function() astronvim.notify("Unsupported Neovim Version! Please check the requirements", "error") end)
end

-- load telecscop extension 'harpoon'
require("telescope").load_extension('harpoon')

-- clangd offset encoding work-around
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })

-- global override to set all LSP to 4 indent
vim.o.tabstop = 4
vim.o.shiftwidth = 4
