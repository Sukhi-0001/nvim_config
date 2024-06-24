local map = vim.keymap.set
--cursor movement in insert mode
map("i", "<C-b>", "<ESC>^i", { desc = "Move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

--cursor movemet between planes in normal mode
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

--go to next buffer
map("n", "<tab>","<cmd>BufferLineCycleNext<CR>", { desc = "buffer goto next" })

--go to prev buffer
map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "buffer goto prev" })

--close current open buffer
map("n", "<leader>x","<cmd>bd<CR>", { desc = "buffer close" })

--file save shortcut
map("n", "<C-s>", "<cmd>w<CR>", { desc = "file save" })
map("i", "<C-s>", "<cmd>w<CR>", { desc = "file save" })

-- toggle line numbers
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })



-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
-- // todo 
--map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
-- //todo some error comes up
--map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
-- //todo should only work if it is a git dir
--map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
--map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

--map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
--map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })


--neotree
map("n", "<C-n>", "<cmd>:Neotree toggle<CR>", { desc = "Neotree toggle window" })

-- exit terminal mode
map("t", "<ESC>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h","<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Terminal new horizontal term" })
--map("n", "<leader>v","<cmd>ToggleTerm direction=vertical<CR>", { desc = "Terminal new vertical window" })

-- lsp keybindings
vim.api.nvim_create_autocmd("LspAttach",{
  group = vim.api.nvim_create_augroup("UserLspConfig",{}),
  callback = function(ev)
  --
  vim.bo[ev.buf].omnifunc = "v:lua.vim.lua.omnifunc"
  local opts = { buffer = bufnr, noremap = true, silent = true }
  --buffer local keymaps
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  
end
})

--nvim-cmp keybinds

-- Close floats, and clear highlights with <Esc>
local Util = require("utils")
vim.keymap.set("n", "<Esc>", function()
    Util.close_floats()
    if vim.bo.modifiable then
      --Util.clear_highlights()
    else
      if #vim.api.nvim_list_wins() > 1 then
        --return Util.feedkeys("<C-w>c")
      end
    end
end, { desc = "Close floats, clear highlights" })
  

  