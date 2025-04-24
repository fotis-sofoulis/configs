require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)
vim.diagnostic.config({ virtual_text = true })
require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.comments"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	require("plugins.autoformatting"),
	require("plugins.gitsigns"),
	require("plugins.indent-blankline"),
	require("plugins.misc"),
	require("plugins.alpha"),
}, {
	ui = {
		-- This sets a background for the Lazy UI when using transparent themes
		backdrop = 100, -- how dim the backdrop should be. 0 = fully transparent, 100 = no transparency
		border = "rounded",
		-- winblend = 0, -- 0 = opaque, 100 = fully transparent (used for the Lazy window itself)
	},
})

-- Change popup menu, mason and lazy background and foreground
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#24273a", fg = "#cdd6f4", blend = 0 })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#24273a", fg = "#cdd6f4", blend = 0 })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#24273a", fg = "#cdd6f4", blend = 0 })

-- Autosave file on InsertLeave and TextChanged
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = "*",
	callback = function()
		if vim.bo.modified then
			vim.cmd("silent! write")
		end
	end,
})
