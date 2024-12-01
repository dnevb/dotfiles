local is_windows = vim.fn.has('win32') == 1

return {
	{
		"L3MON4D3/LuaSnip",
		build = not is_windows and "make install_jsregexp" or nil,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"zeioth/NormalSnippets",
			"benfowler/telescope-luasnip.nvim",
		},
		event = { 'BufReadPre', 'BufNewFile' },
		opts = {
			history = true,
			delete_check_events = "TextChanged",
			region_check_events = "CursorMoved",
		},
		config = function(_, opts)
			if opts then require("luasnip").config.setup(opts) end
			vim.tbl_map(
				function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
				{ "vscode", "snipmate", "lua" }
			)
			-- friendly-snippets - enable standardized comments snippets
			require("luasnip").filetype_extend("typescript", { "tsdoc" })
			require("luasnip").filetype_extend("javascript", { "jsdoc" })
			require("luasnip").filetype_extend("lua", { "luadoc" })
			require("luasnip").filetype_extend("python", { "pydoc" })
			require("luasnip").filetype_extend("rust", { "rustdoc" })
			require("luasnip").filetype_extend("cs", { "csharpdoc" })
			require("luasnip").filetype_extend("sh", { "shelldoc" })
		end,
	},

	--  GIT ---------------------------------------------------------------------
	--  Git signs [git hunks]
	--  https://github.com/lewis6991/gitsigns.nvim
	{
		"lewis6991/gitsigns.nvim",
		enabled = vim.fn.executable("git") == 1,
		event = {"BufReadPost", "BufNewFile", "BufWritePost"},
		opts = function()
			local get_icon = function(name)
				return require('icons')[name]
			end
			return {
				max_file_length = vim.g.big_file.lines,
				signs = {
					add = { text = get_icon("GitSign") },
					change = { text = get_icon("GitSign") },
					delete = { text = get_icon("GitSign") },
					topdelete = { text = get_icon("GitSign") },
					changedelete = { text = get_icon("GitSign") },
					untracked = { text = get_icon("GitSign") },
				},
			}
		end
	},

	{
		"sourcegraph/sg.nvim",
		event = { 'InsertEnter' },
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "SourcegraphLogin" },
		opts = {
			enable_cody = true,
		},
		config = function(_, opts)
			require('sg').setup(opts)
		end
	},
}
