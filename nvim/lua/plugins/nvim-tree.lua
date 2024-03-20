return {
	"nvim-tree/nvim-tree.lua",
	branch = "v1.1",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", {})
		require("nvim-tree").setup({
		})
	end,
}
