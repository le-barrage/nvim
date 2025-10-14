return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "lua", "java", "c", "typst" },
			highlight = { enabled = true },
			indent = { enable = true },
		})
	end,
}
