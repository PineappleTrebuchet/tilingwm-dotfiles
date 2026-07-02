{ pkgs, ... }:
{
	# plugin dependencies
	home.packages = with pkgs; [
		fd
		cargo
		luaPackages.tree-sitter-cli
	];

	programs.nixvim = {
		plugins.lsp = {
			enable = true;
			servers = {
				arduino_language_server.enable = true;
				lua_ls.enable = true;
				nil_ls.enable = true;
				basedpyright.enable = true;
				clangd.enable = true;
				jdtls.enable = true;
			};
		};

    plugins = {
			# Look & Feel
    	web-devicons.enable = true;
			comment.enable = true;
			gitsigns.enable = true;
			todo-comments.enable = true;
			colorizer.enable = true;
			render-markdown.enable = true;
			nvim-autopairs.enable = true;
    	bufferline = {
				enable = true;
				settings.options.separator_style = "slant";
				};
    	lualine = {
				enable = true;
				settings = {
					sections.lualine_c = [ "filename" "searchcount" ];
					sections.lualine_x = [ "lsp_status" "filetype" ];
					options.component_separators = { left = ""; right = ""; };
					options.section_separators = { left = ""; right = ""; };
				};
			};

			# Tools
			telescope.enable = true;
			treesitter.enable = true;
			diffview.enable = true;
			which-key.enable = true;
			yazi.enable = true;
			neo-tree = {
				enable = true;
				settings.close_if_last_window = true;
				settings.window.width = 30;
			};
    };


		# BUG: this plugin breaks because it cannot find cmp
		# plugins.lazy = {
		# 		enable = true;
		# 		plugins = [{ name = "yuukiflow/Arduino-Nvim"; }];
		# };
	};

}
