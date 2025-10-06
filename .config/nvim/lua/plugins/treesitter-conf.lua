require("nvim-treesitter.configs").setup({
    ensure_installed = { "html", "javascript", "lua", "c", "cpp", "css", "csv", "gitignore", "json", "regex", "rust", "sql", "svelte", "typescript" },
    endwise = { enable = true, },
})
