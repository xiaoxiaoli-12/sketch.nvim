vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set({ "n", "v", "o" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.guifont = "Cascadia Mono:h14"
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true

vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.autoread = true

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumheight = 15

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

local function yank_location(path_modifier, include_line)
	local location = vim.fn.expand(path_modifier)
	if include_line then
		location = ("%s:%d"):format(location, vim.api.nvim_win_get_cursor(0)[1])
	end
	vim.fn.setreg("+", location)
	vim.notify("Copied: " .. location)
end

vim.keymap.set("n", "<leader>yp", function()
	yank_location("%:.", false)
end, { desc = "Yank relative path" })
vim.keymap.set("n", "<leader>yl", function()
	yank_location("%:.", true)
end, { desc = "Yank relative path and line" })
vim.keymap.set("n", "<leader>yP", function()
	yank_location("%:p", false)
end, { desc = "Yank absolute path" })
vim.keymap.set("n", "<leader>yL", function()
	yank_location("%:p", true)
end, { desc = "Yank absolute path and line" })

local lazypath = vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
	local result = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" },
			{ "Press any key to exit...", "MoreMsg" },
		}, true, {})
		vim.fn.getchar()
		vim.cmd.quit()
	end
end
vim.opt.rtp:prepend(lazypath)

if not pcall(require, "lazy") then
	vim.api.nvim_echo({
		{ ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" },
		{ "Press any key to exit...", "MoreMsg" },
	}, true, {})
	vim.fn.getchar()
	vim.cmd.quit()
end

require("lazy_setup")
