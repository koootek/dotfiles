-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- Config every plugin
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        { "nvim-telescope/telescope.nvim",            dependencies = { "nvim-lua/plenary.nvim" } },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        {
            "nvim-tree/nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup({})
            end,
        },
        {
            "windwp/nvim-ts-autotag",
            config = function()
                require("nvim-ts-autotag").setup({
                    opts = {
                        enable_close = true,
                        enable_rename = true,
                        enable_close_on_slash = false,
                    }
                })
            end
        },
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
        { "SmiteshP/nvim-navic",             dependencies = { "neovim/nvim-lspconfig" } },
        {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
        },
        "MunifTanjim/nui.nvim",
        {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                "neovim/nvim-lspconfig",
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim",
                "numToStr/Comment.nvim",
                "nvim-telescope/telescope.nvim"
            }
        },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    "lazy.nvim",
                }
            }
        },
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = true
        },
        {
            "stevearc/dressing.nvim",
            opts = {},
        },
        {
            "L3MON4D3/LuaSnip",
            dependencies = { "rafamadriz/friendly-snippets" },
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        "saadparwaiz1/cmp_luasnip",
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            ---@module "ibl"
            ---@type ibl.config
            opts = {},
            config = function()
                require("ibl").setup()
            end,
        },
        "rafamadriz/friendly-snippets",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            }
        },
        {
            "antosha417/nvim-lsp-file-operations",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-neo-tree/neo-tree.nvim",
            },
            config = function()
                require("lsp-file-operations").setup()
            end,
        },
        { "echasnovski/mini.align",      version = false },
        { "echasnovski/mini.cursorword", version = false },
        { "echasnovski/mini.surround",   version = false },
        "ggandor/leap.nvim",
        {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup()
            end
        },
        {
            "Saecki/crates.nvim",
            tag = "stable",
            config = function()
                require("crates").setup({
                    completion = {
                        cmp = {
                            enabled = true
                        }
                    }
                })
            end,
        },
        {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end
        },
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
            config = function()
                vim.cmd.colorscheme "catppuccin-mocha"
            end
        },
    },
})

require("plugins.mason-conf")
require("plugins.telescope-conf")
require("plugins.treesitter-conf")
require("plugins.cmp-conf")
require("plugins.mini-conf")

-- @lsp.type.namespace.rust disable italic
