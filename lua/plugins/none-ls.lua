return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- lua
				-- null_ls.builtins.formatting.prettypst, -- typst
				null_ls.builtins.formatting.clang_format.with({
					filetypes = { "c", "java", "javascript", "typescript" },
					extra_args = { "--style=GNU" },
				}), -- c & java
				null_ls.builtins.formatting.google_java_format, -- java
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.checkstyle, -- java
			},
			-- Add the format on save functionality
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							-- local view = vim.fn.winsaveview()
							-- vim.lsp.buf.format({ bufnr = bufnr })
							vim.lsp.buf.format({
								bufnr = bufnr,
								async = false,
								filter = function(c)
									return c.name == "null-ls"
								end,
							})
							-- vim.fn.winrestview(view)
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
