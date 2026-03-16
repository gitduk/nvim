-- [[ Basic Autocommands ]]

local autocmd = vim.api.nvim_create_autocmd
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
vim.api.nvim_create_autocmd("BufWritePre", {
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

-- Ensure file ends with a blank line
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("ensure-blank-line", { clear = true }),
	pattern = "*",
	callback = function()
		-- 排除特殊文件类型
		if vim.bo.buftype ~= "" or vim.bo.filetype == "help" then
			return
		end
		local last_line = vim.fn.line("$")
		local last_line_content = vim.fn.getline(last_line)
		-- 如果最后一行不为空，添加一个空行
		if last_line_content ~= "" then
			vim.fn.append(last_line, "")
		end
	end,
})

