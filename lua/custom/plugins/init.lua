-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- codeium
  'Exafunction/codeium.vim',

  -- colorize
  {
    event = 'VeryLazy',
    'norcalli/nvim-colorizer.lua',
    opts = {},
  },

  -- bufferline
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('bufferline').setup {}
      vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Close current buffer' })
      vim.keymap.set('n', '<C-b>', ':bdelete<CR>', { desc = 'Close current buffer' })
      vim.keymap.set('n', 'H', ':bprevious<CR>', { desc = 'Previous buffer' })
      vim.keymap.set('n', 'L', ':bnext<CR>', { desc = 'Next buffer' })
    end,
  },

  -- tmux & split window navigation
  {
    'christoomey/vim-tmux-navigator',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
      vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
      vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make split windows equal width & height' }) -- make split windows equal width & height
      vim.keymap.set('n', '<leader>sx', ':close<CR>', { desc = 'Close current split window' }) -- close current split window
    end,
  },

  -- maximizes and restores current window
  {
    'szw/vim-maximizer',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>', { desc = 'Maximize/Restore current window' })
    end,
  },

  -- astro.build
  'wuelnerdotexe/vim-astro',

  -- highlight undo
  {
    'tzachar/highlight-undo.nvim',
    config = function()
      require('highlight-undo').setup()
    end,
  },

  -- render markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },

  -- markdown preview
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreview', 'MarkdownPreviewToggle', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    ft = 'markdown',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
  },

  -- silicon
  {
    'michaelrommel/nvim-silicon',
    event = 'VeryLazy',
    cmd = 'Silicon',
    config = function()
      local function get_home_directory()
        local user = vim.fn.expand '$USER'
        return '/home/' .. user
      end

      require('nvim-silicon').setup {
        font = 'JetBrains Mono NF=34;Noto Color Emoji=34',
        theme = 'Dracula',
        background_image = get_home_directory() .. '/.config/silicon/bg.jpg',
        no_line_number = true,
        language = function()
          if vim.bo.filetype == 'astro' then
            return 'jsx'
          end
          return vim.bo.filetype
        end,
        shadow_blur_radius = 16,
        shadow_offset_x = 8,
        shadow_offset_y = 8,
        shadow_color = '#100808',
        gobble = true,
        window_title = function()
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ':t')
        end,
        output = function()
          return './silicon_' .. os.date '!%Y-%m-%dT%H-%M-%S' .. '_code.png'
        end,
      }
    end,
  },

  -- toggleterm
  {
    'akinsho/toggleterm.nvim',
    event = 'VimEnter',
    config = function()
      require('toggleterm').setup()
      vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { desc = 'Toggle floating terminal' })
      vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = 'Toggle horizontal terminal' })
      vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { desc = 'Toggle vertical terminal' })
      vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
      vim.keymap.set('t', 'jj', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
    end,
  },

  -- flutter
  {
    'nvim-flutter/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    opts = {},
  },

  -- java & spring boot
  {
    'nvim-java/nvim-java',
    config = function()
      vim.keymap.set('n', '<leader>jr', ':JavaRunnerRunMain<CR>', { desc = 'Run Java Main' })
      vim.keymap.set('n', '<leader>jb', ':JavaBuildWorkspace<CR>', { desc = 'Build Java Workspace' })
      vim.keymap.set('n', '<leader>jc', ':JavaCleanWorkspace<CR>', { desc = 'Clean Java Workspace' })
    end,
  },

  -- uv (python)
  {
    'benomahony/uv.nvim',
    dependencies = {
      'folke/snacks.nvim',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      picker_integration = true,
    },
  },
}
