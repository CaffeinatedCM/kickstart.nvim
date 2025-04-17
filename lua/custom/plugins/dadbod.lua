return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql', 'sqlite' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    'saghen/blink.cmp',
    opts = function(_, opts)
      -- add new source for sql
      opts.sources = opts.sources or {}

      -- extend default sources safely
      opts.sources.default = opts.sources.default or { 'lsp', 'path', 'snippets', 'buffer' }

      -- extend per_filetype
      opts.sources.per_filetype = opts.sources.per_filetype or {}
      opts.sources.per_filetype.sql = opts.sources.per_filetype.sql or {}
      table.insert(opts.sources.per_filetype.sql, 'dadbod')

      -- add dadbod provider
      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' }

      return opts
    end,
  },
}
