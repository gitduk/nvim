-- [[ Basic Autocommands ]]

local autocmd = vim.api.nvim_create_autocmd

-- Markdown: use 2-space indentation
autocmd("FileType", {
	pattern = "markdown",
	group = vim.api.nvim_create_augroup("markdown-indent", { clear = true }),
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

autocmd("VimEnter", {
	command = ":silent !alacritty @ set-spacing padding=0 margin=0",
})

autocmd("VimLeavePre", {
	command = ":silent !alacritty @ set-spacing padding=20 margin=10",
})

-- This autocmd will restore cursor position on file open
autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local line = vim.fn.line("'\"")
		if
			line > 1
			and line <= vim.fn.line("$")
			and vim.bo.filetype ~= "commit"
			and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
		then
			vim.cmd('normal! g`"')
		end
	end,
})

-- Remove trailing whitespace on save (with higher priority to run before formatters)
autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("trim-whitespace", { clear = true }),
	pattern = "*",
	callback = function()
		-- Skip if formatter will handle it
		if vim.bo.filetype == "lua" then
			return
		end
		local save = vim.fn.winsaveview()
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.winrestview(save)
	end,
})
