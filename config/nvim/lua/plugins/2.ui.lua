return {
	{ "nyoom-engineering/oxocarbon.nvim" },
	{
		"zeioth/heirline-components.nvim",
		opts = {
			icons = require("icons")
		}
	},
	{
		"rebelot/heirline.nvim",
		dependencies = { "zeioth/heirline-components.nvim" },
		event = "VimEnter",
		opts = function()
			local lib = require "heirline-components.all"
			return {
				opts = {
					disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
						local is_disabled = not require("heirline-components.buffer").is_valid(args.buf) or
								lib.condition.buffer_matches({
									buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
									filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
								}, args.buf)
						return is_disabled
					end,
				},
				tabline = { -- UI upper bar
					lib.component.tabline_conditional_padding(),
					lib.component.tabline_buffers(),
					lib.component.fill { hl = { bg = "tabline_bg" } },
					lib.component.tabline_tabpages()
				},
				winbar = false,
				statuscolumn = { -- UI left column
					init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
					lib.component.numbercolumn(),
					lib.component.signcolumn(),
				} or nil,
				statusline = { -- UI statusbar
					hl = { fg = "fg", bg = "bg" },
					lib.component.mode(),
					lib.component.git_branch(),
					lib.component.git_diff(),
					lib.component.lsp(),
					lib.component.diagnostics(),
					lib.component.fill(),
					lib.component.cmd_info(),
					lib.component.fill(),
					lib.component.file_info({ filename = {}, filetype = false }),
					lib.component.file_encoding({ file_format = false }),
					-- lib.component.compiler_state(),
					-- lib.component.virtual_env(),
					lib.component.nav(),
					lib.component.mode { surround = { separator = "right" } },

				},
			}
		end,
		config = function(_, opts)
			local heirline = require("heirline")
			local heirline_components = require "heirline-components.all"

			-- Setup
			heirline_components.init.subscribe_to_events()
			heirline.load_colors(heirline_components.hl.get_colors())
			heirline.setup(opts)
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeFocus", "NvimTreeToggle" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			update_cwd = true,
			view = {
				float = { enable = true },
			},
			filters = {
				enable = true,
				dotfiles = false,
				git_ignored = false,
			},
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end
	},
	{
		"petertriho/nvim-scrollbar",
		event = { "BufReadPost", "BufNewFile", "BufWritePost" },
		opts = {
			handlers = {
				gitsigns = true, -- gitsigns integration (display hunks)
				ale = true,  -- lsp integration (display errors/warnings)
				search = false, -- hlslens integration (display search result)
			},
			excluded_filetypes = {
				"cmp_docs",
				"cmp_menu",
				"noice",
				"prompt",
				"TelescopePrompt",
				"alpha",
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		config = function(_, opts)
			require("ibl").setup(opts)
		end
	},
}
