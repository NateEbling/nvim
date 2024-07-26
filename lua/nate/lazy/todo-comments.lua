return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
  	signs = false,
	keywords = {
		TODO = { color = "#ff0000" },
		FIX = { color = "#2563eb" },
	},
	highlight = {
		comments_only = true,
		keyword = "fg",
		after = "",
	},
  }
}