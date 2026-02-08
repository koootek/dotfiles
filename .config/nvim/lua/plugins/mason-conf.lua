require("mason").setup()

local lsps = { "clangd", "rust_analyzer", "lua_ls", "cssls", "bashls", "html", "ts_ls", "jsonls", "marksman",
    "taplo", "yamlls", "jedi_language_server" }

require("mason-lspconfig").setup({
    ensure_installed = lsps,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<leader>fd", function()
                vim.lsp.buf.format({
                    bufnr = vim.api.nvim_get_current_buf(),
                    formatting_options = { tabSize = 4, insertSpaces = true, trimTrailingWhitespace = true, insertFinalNewline = true, trimFinalNewlines = false, },
                    id = client.id
                })
            end)
        end
        if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("v", "<leader>fs", function()
                local start_pos = vim.api.nvim_buf_get_mark(0, "<")
                local end_pos = vim.api.nvim_buf_get_mark(0, ">")
                vim.lsp.buf.format({
                    bufnr = vim.api.nvim_get_current_buf(),
                    formatting_options = { tabSize = 4, insertSpaces = true, trimTrailingWhitespace = true, insertFinalNewline = true, trimFinalNewlines = false, },
                    id = client.id,
                    range = {
                        start = { start_pos[1] - 1, start_pos[2] },
                        ["end"] = { end_pos[1] - 1, end_pos[2] + 1 },
                    }
                })
            end)
        end
    end,
})

local navic = require("nvim-navic")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in pairs(lsps) do
    local cfg = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
                navic.attach(client, bufnr)
            end
            if lsp == "sqls" then
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
    }
    if lsp == "rust_analyzer" then
        vim.keymap.set("n", "<leader>em", function()
            local params = vim.lsp.util.make_position_params(0, "utf-8")
            vim.lsp.buf_request(0, 'rust-analyzer/expandMacro', params, function(err, result)
                if err then
                    vim.notify('Macro expansion failed: ' .. vim.inspect(err), vim.log.levels.ERROR)
                    return
                end
                if not result then return end

                -- Open in a new buffer
                vim.cmd('new')
                vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(result.expansion, '\n'))
                vim.bo.filetype = 'rust'
                vim.bo.buftype = 'nofile'
                vim.bo.bufhidden = 'wipe'
            end)
        end)
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
                rustfmt = {
                    extraArgs = { "+nightly" },
                    rangeFormatting = {
                        enable = true,
                    },
                },
            },
        }
    end
    vim.lsp.config(lsp, cfg)
end
