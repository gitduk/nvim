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
		-- Render only in normal/command/terminal mode; insert mode shows the raw document
		render_modes = { "n", "c", "t" },
		-- Keep rendering on the cursor line instead of hiding virtual text there
		anti_conceal = { enabled = false },
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
