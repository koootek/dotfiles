require("mason").setup()

local lsps = { "clangd", "rust_analyzer", "lua_ls", "neocmake", "cssls", "bashls", "html", "ts_ls", "jsonls", "marksman",
    "taplo", "yamlls", "jedi_language_server", "intelephense", "sqls" }

require("mason-lspconfig").setup({
    ensure_installed = lsps,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = args.buf,
                        formatting_options = { tabSize = 4, insertSpaces = true, trimTrailingWhitespace = true, insertFinalNewline = true, trimFinalNewlines = false, },
                        id =
                            client.id
                    })
                end,
            })
        end
    end,
})

local navic = require("nvim-navic")
local navbuddy = require("nvim-navbuddy")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in pairs(lsps) do
    local cfg = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
                navic.attach(client, bufnr)
                navbuddy.attach(client, bufnr)
            end
            if lsp == "sqls" then
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
    }
    if lsp == "rust_analyzer" then
        cfg.settings = {
            ["rust-analyzer"] = {
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
                cargo = {
                    allFeatures = true,
                    buildScripts = {
                        enable = true,
                    },
                },
                procMacro = {
                    enable = true
                },
                assist = {
                    importEnforceGranularity = true,
                    importPrefix = "crate",
                },
                check = {
                    command = "clippy"
                },
                inlayHints = { locationLinks = false },
                diagnostics = {
                    enable = true,
                    experimental = {
                        enable = true,
                    },
                },
            },
        }
    end
    vim.lsp.config(lsp, cfg)
end
