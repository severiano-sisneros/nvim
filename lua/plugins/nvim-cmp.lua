local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
    }
}

M.config = function()
    -- Setup Completion
    -- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
    local cmp = require("cmp")

    -- Set completeopt to have a better completion experience
    -- :help completeopt
    -- menuone: popup even when there's only one match
    -- noinsert: Do not insert text until a selection is made
    -- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
    vim.o.completeopt = "menuone,noinsert,noselect"

    cmp.setup({
      preselect = cmp.PreselectMode.None,
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- Add tab support
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
      },

      -- Installed sources
      sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "path" },
        { name = "buffer" },
      },
    })
end

return M
