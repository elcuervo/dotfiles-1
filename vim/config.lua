require('which-key').setup()
require('nvim-web-devicons').setup()
require('colorizer').setup()
-- :DiffviewOpen / DiffviewClose
require('diffview').setup()

require('nvim-tree').setup {
  auto_close = true,
  view = {
    auto_resize = true,
  },
}

require('fzf-lua').setup {
  winopts = {
    border = 'single',
  },
  fzf_opts = {
    ['--border'] = 'none',
  },
  files = {
    cmd = 'fd --type f --hidden --follow --exclude .git --exclude .vim --exclude .cache --exclude vendor',
  },
  grep = {
    rg_opts = "--hidden --column --line-number --no-heading " ..
              "--color=always --smart-case " ..
              "-g '!{.git,node_modules,vendor}/*'",
  },
}

require('gitsigns').setup {
  signs = {
    -- source: https://en.wikipedia.org/wiki/Box-drawing_character
    add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
}

require('nvim-treesitter.configs').setup {
  -- "all", "maintained" or a list
  ensure_installed = "maintained",
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    -- prevents lagging in large files
    max_file_lines = 1000,
  },
}

-- TODO fix
--require('treesitter-context').setup {
  --enable = true,
  --throttle = true,
--}

require('bufferline').setup {
  options = {
    show_close_icon = false,
    show_buffer_close_icons = false,
    separator_style = "thick",
  },
  -- TODO change highlights based on base16
  --highlights = {
    --fill = {
        --guifg = '#3B4252',
        --guibg = '#3B4252',
    --},
  --},
}

require('nvim-gps').setup({
  icons = {
    ["class-name"] = ' ',
    ["function-name"] = ' ',
    ["method-name"] = ' '
  },
  separator = ' > ',
})

local gps = require('nvim-gps')
require('lualine').setup {
  options = {
    theme = "nord",
    -- disable powerline
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_c = {
      { gps.get_location, condition = gps.is_available },
    },
  },
}
