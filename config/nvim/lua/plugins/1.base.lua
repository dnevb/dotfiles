return {
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
	},
	{
		"lambdalisue/vim-suda",
		cmd = { "SudaRead", "SudaWrite" },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = "windwp/nvim-ts-autotag",
		opts = {
			check_ts = true,
			ts_config = { java = false },
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
				offset = 0,
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "PmenuSel",
				highlight_grey = "LineNr",
			},
		},
		config = function(_, opts)
			local npairs = require("nvim-autopairs")
			npairs.setup(opts)

			local is_cmp_loaded, cmp = pcall(require, "cmp")
			if is_cmp_loaded then
				cmp.event:on(
					"confirm_done",
					require("nvim-autopairs.completion.cmp").on_confirm_done {
						tex = false }
				)
			end
		end
	},

	-- nvim-ts-autotag [auto close html tags]
	-- https://github.com/windwp/nvim-ts-autotag
	-- Adds support for HTML tags to the plugin nvim-autopairs.
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"windwp/nvim-autopairs"
		},
		opts = {}
	},
  {
    "smoka7/hop.nvim",
    cmd = { "HopWord" },
    opts = { keys = "etovxqpdygfblzhckisuran" }
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      highlights = {
        Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
        NormalFloat = { link = "Normal" },
        FloatBorder = { link = "FloatBorder" },
        StatusLine = { link = "StatusLine" },
        StatusLineNC = { link = "StatusLineNC" },
        WinBar = { link = "WinBar" },
        WinBarNC = { link = "WinBarNC" },
      },
      size = 10,
      open_mapping = [[<F7>]],
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "rounded",
        highlights = { border = "Normal", background = "Normal" },
      },
    },
  },
}
