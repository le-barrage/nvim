return {
	"neovim/nvim-lspconfig",
	-- event = { "BufReadPre", "BufNewFile" },

	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- local lspconfig = vim.lsp.enable()

		vim.lsp.enable("lua_ls", { capabilities = capabilities })
		vim.lsp.enable("tinymist", { capabilities = capabilities })
		vim.lsp.enable("clangd", {
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})
		local keymap = vim.keymap
		keymap.set("n", "K", vim.lsp.buf.hover, {})
		keymap.set("n", "gD", vim.lsp.buf.definition, {})
		keymap.set("n", "<space>ca", vim.lsp.buf.code_action, {})
	end,
}
