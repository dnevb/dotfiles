local maps = {}
for _, mode in ipairs {
  "", "n", "v", "x", "s", "o", "!", "i", "l", "c", "t", "ia", "ca", "!a"
} do maps[mode] = {} end
local utils = require('utils')

-- standard Operations -----------------------------------------------------
maps.n["<leader>e"] = { "<cmd>NvimTreeFocus<cr>", desc = "File explorer" }
maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>W"] =
{ function() vim.cmd("SudaWrite") end, desc = "Save as sudo" }
maps.n["<leader>n"] = { "<cmd>enew<cr>", desc = "New file" }
maps.n["<Leader>/"] = { "gcc", remap = true, desc = "Toggle comment line" }
maps.x["<Leader>/"] = { "gc", remap = true, desc = "Toggle comment" }
maps.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
maps.n["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
maps.n["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" }
maps.i["<C-BS>"] = { "<C-W>", desc = "Enable CTRL+backsace to delete." }

-- search highlighting ------------------------------------------------------
-- use ESC to clear hlsearch, while preserving its original functionality.
--
-- TIP: If you prefer,  use <leader>ENTER instead of <ESC>
--      to avoid triggering it by accident.
maps.n["<ESC>"] = {
  function()
    if vim.fn.hlexists("Search") then
      vim.cmd("nohlsearch")
    else
      vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<ESC>", true, true, true),
        "n",
        true
      )
    end
  end,
}

-- Improved tabulation ------------------------------------------------------
maps.x["<S-Tab>"] = { "<gv", desc = "unindent line" }
maps.x["<Tab>"] = { ">gv", desc = "indent line" }
maps.x["<"] = { "<gv", desc = "unindent line" }
maps.x[">"] = { ">gv", desc = "indent line" }

-- packages -----------------------------------------------------------------
maps.n["<leader>pu"] =
{ function() require("lazy").check() end, desc = "Lazy open" }
maps.n["<leader>pU"] =
{ function() require("lazy").update() end, desc = "Lazy update" }

-- mason
maps.n["<leader>pm"] = { "<cmd>Mason<cr>", desc = "Mason open" }
maps.n["<leader>pM"] = { "<cmd>MasonUpdateAll<cr>", desc = "Mason update" }

-- treesitter
maps.n["<leader>pT"] = { "<cmd>TSUpdate<cr>", desc = "Treesitter update" }
maps.n["<leader>pt"] = { "<cmd>TSInstallInfo<cr>", desc = "Treesitter open" }


-- buffers/tabs [buffers ]--------------------------------------------------
maps.n["<leader>c"] = { -- Close buffer keeping the window.
  function() require("heirline-components.buffer").close() end,
  desc = "Close buffer",
}
maps.n["<leader>ba"] = {
  function() vim.cmd("wa") end,
  desc = "Write all changed buffers",
}
maps.n["]b"] = {
  function()
    require("heirline-components.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
  end,
  desc = "Next buffer",
}
maps.n["<tab>"] = maps.n["]b"]
maps.n["[b"] = {
  function()
    require("heirline-components.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
  end,
  desc = "Previous buffer",
}
maps.n["<s-tab>"] = maps.n["[b"]
maps.n[">b"] = {
  function()
    require("heirline-components.buffer").move(vim.v.count > 0 and vim.v.count or 1)
  end,
  desc = "Move buffer tab right",
}
maps.n["<b"] = {
  function()
    require("heirline-components.buffer").move(-(vim.v.count > 0 and vim.v.count or 1))
  end,
  desc = "Move buffer tab left",
}

maps.n["<leader>bc"] = {
  function() require("heirline-components.buffer").close_all(true) end,
  desc = "Close all buffers except current",
}
maps.n["<leader>bC"] = {
  function() require("heirline-components.buffer").close_all() end,
  desc = "Close all buffers",
}
maps.n["<leader>bb"] = {
  function()
    require("heirline-components.all").heirline.buffer_picker(
      function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end
    )
  end,
  desc = "Select buffer from tabline",
}
maps.n["<leader>bd"] = {
  function()
    require("heirline-components.all").heirline.buffer_picker(
      function(bufnr) require("heirline-components.buffer").close(bufnr) end
    )
  end,
  desc = "Delete buffer from tabline",
}
maps.n["<leader>bl"] = {
  function() require("heirline-components.buffer").close_left() end,
  desc = "Close all buffers to the left",
}
maps.n["<leader>br"] = {
  function() require("heirline-components.buffer").close_right() end,
  desc = "Close all buffers to the right",
}

-- tabs
maps.n["]t"] = { function() vim.cmd.tabnext() end, desc = "Next tab" }
maps.n["[t"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" }

-- git
maps.n["]g"] =
{ function() require("gitsigns").next_hunk() end, desc = "Next Git hunk" }
maps.n["[g"] = {
  function() require("gitsigns").prev_hunk() end,
  desc = "Previous Git hunk",
}
maps.n["<leader>gl"] = {
  function() require("gitsigns").blame_line() end,
  desc = "View Git blame",
}
maps.n["<leader>gL"] = {
  function() require("gitsigns").blame_line { full = true } end,
  desc = "View full Git blame",
}
maps.n["<leader>gp"] = {
  function() require("gitsigns").preview_hunk() end,
  desc = "Preview Git hunk",
}
maps.n["<leader>gh"] = {
  function() require("gitsigns").reset_hunk() end,
  desc = "Reset Git hunk",
}
maps.n["<leader>gr"] = {
  function() require("gitsigns").reset_buffer() end,
  desc = "Reset Git buffer",
}
maps.n["<leader>gs"] = {
  function() require("gitsigns").stage_hunk() end,
  desc = "Stage Git hunk",
}
maps.n["<leader>gS"] = {
  function() require("gitsigns").stage_buffer() end,
  desc = "Stage Git buffer",
}
maps.n["<leader>gu"] = {
  function() require("gitsigns").undo_stage_hunk() end,
  desc = "Unstage Git hunk",
}
maps.n["<leader>gd"] = {
  function() require("gitsigns").diffthis() end,
  desc = "View Git diff",
}

-- telescope
maps.n["<leader>gb"] = {
  function() require("telescope.builtin").git_branches() end,
  desc = "Git branches",
}
maps.n["<leader>gc"] = {
  function()
    require("telescope.builtin").git_commits()
  end,
  desc = "Git commits (repository)"
}
maps.n["<leader>gC"] = {
  function()
    require("telescope.builtin").git_bcommits()
  end,
  desc = "Git commits (current file)"
}
maps.n["<leader>gt"] = {
  function() require("telescope.builtin").git_status() end,
  desc = "Git status",
}
maps.n["<leader>f<CR>"] = {
  function() require("telescope.builtin").resume() end,
  desc = "Resume previous search",
}
maps.n["<leader>f'"] = {
  function() require("telescope.builtin").marks() end,
  desc = "Find marks",
}
maps.n["<leader>fB"] = {
  function() require("telescope.builtin").buffers() end,
  desc = "Find buffers",
}
maps.n["<leader>fw"] = {
  function() require("telescope.builtin").grep_string() end,
  desc = "Find word under cursor in project",
}
maps.n["<leader>fC"] = {
  function() require("telescope.builtin").commands() end,
  desc = "Find commands",
}
-- Let's disable this. It is way too imprecise. Use rnvimr instead.
maps.n["<leader>f "] = {
  function()
    require("telescope.builtin").find_files { hidden = true, no_ignore = true }
  end,
  desc = "Find all files",
}
maps.n["<leader> "] = {
  function() require("telescope.builtin").find_files() end,
  desc = "Find files (no hidden)",
}
maps.n["<leader>fh"] = {
  function() require("telescope.builtin").help_tags() end,
  desc = "Find help",
}
maps.n["<leader>fk"] = {
  function() require("telescope.builtin").keymaps() end,
  desc = "Find keymaps",
}
maps.n["<leader>fm"] = {
  function() require("telescope.builtin").man_pages() end,
  desc = "Find man",
}

maps.n["<leader>fF"] = {
  function()
    require("telescope.builtin").live_grep {
      additional_args = function(args)
        return vim.list_extend(args, { "--hidden", "--no-ignore" })
      end,
    }
  end,
  desc = "Find words in project",
}
maps.n["<leader>ff"] = {
  function() require("telescope.builtin").live_grep() end,
  desc = "Find words in project (no hidden)",
}
maps.n["<leader>f/"] = {
  function() require("telescope.builtin").current_buffer_fuzzy_find() end,
  desc = "Find words in current buffer"
}

utils.set_mappings(maps)
