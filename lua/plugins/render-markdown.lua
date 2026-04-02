return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown", "Avante" },
	opts = {
		-- Support Avante buffers in addition to markdown
		file_types = { "markdown", "Avante" },
		heading = { enabled = false },
		checkbox = {
			enabled = true,
			checked = {
				icon = "✔ ",
				highlight = "RenderMarkdownChecked",
			},
			unchecked = {
				icon = "☐ ",
				highlight = "RenderMarkdownUnchecked",
			},
		},
		-- Disable parsers that are not installed to suppress warnings
		html = { enabled = false },
		latex = { enabled = false },
		-- Force treesitter highlighter to start on markdown buffers
		on_attach = function(bufnr)
			vim.treesitter.start(bufnr, "markdown")
		end,
	},
}
