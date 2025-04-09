return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
			dashboard.button("r", "󰊄  Recently opened files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", "󰈬  Find word", ":Telescope live_grep <CR>"),
			dashboard.button("c", "  Configuration", ":e /home/g30tr1x/.config/nvim/init.lua<CR>"),
			dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
		}

		local handle = io.popen("fortune | cowsay -f stegosaurus")
		local fortune = handle:read("*a")
		handle:close()
		dashboard.section.footer.val = fortune

		dashboard.section.footer.val = fortune

		alpha.setup(dashboard.config)
	end,
}
