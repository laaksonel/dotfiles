require'lspconfig'.tsserver.setup{}

local opts = {
    highlight_hovered_item = true,
    -- whether to show outline guides
    show_guides = true,
}

require('symbols-outline').setup(opts)
