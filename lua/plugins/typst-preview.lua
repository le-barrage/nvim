return {
	"chomosuke/typst-preview.nvim",
	lazy = false, -- or ft = 'typst'
	version = "1.*",
	opts = {}, -- lazy.nvim will implicitly calls `setup {}`

	config = function()
		require("typst-preview").setup({
			port = 12345,
			invert_colors = "never",
			open_cmd = "firefox %s",
		})
	end,

	vim.keymap.set("n", "<leader>tp", ":TypstPreview<CR>", {}),
	vim.keymap.set("n", "<leader>ts", ":TypstPreviewStop<CR>", {}),
}
