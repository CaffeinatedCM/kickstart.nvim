-- Configuration for conform.nvim specific to Astro files
local conform = require 'conform'

conform.setup {
  formatters_by_ft = {
    astro = { 'prettierd', 'prettier', stop_after_first = true },
  },
}

return {}
