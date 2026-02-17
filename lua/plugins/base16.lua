return {
	"nvim-mini/mini.base16",
	version = false,
	config = function()
		require("mini.base16").setup({ palette = {base00: "#dddddd"} })
	end,
}
