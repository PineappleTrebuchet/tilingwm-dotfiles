{ config, ... }:
{
	imports = [
		./modules/bundle.nix
	];

  programs.nixvim = {
    enable = true;
		colorschemes.onedark = {
			enable = true;
			settings.style = "deep";
			settings.cmp_itemkind_reverse = false;
		};
    viAlias = true;
    vimAlias = true;

		opts = {
			number = true;
			relativenumber = true;
			shiftwidth = 2;
			tabstop = 2;
			softtabstop = 2;
			cmdheight = 0;
			ignorecase = true;
			smartcase = true;
			autoindent = true;
			wrap = false;
			cursorline = true;
			expandtab = false;
			signcolumn = "yes";
			statuscolumn = "%s%{v:relnum?v:relnum:v:lnum}%= ";
			termguicolors = true;
		};

    extraConfigVim = ''
			set undofile
			set undodir=$HOME/.cache/nvim/undo//
			set clipboard=unnamedplus
    '';

		autoCmd = [
			{ # highlight yank
				event = "TextYankPost";
				callback.__raw = "function() vim.highlight.on_yank() end";
			}
			{ # turn on wrap in .txt and .md files
				event = [ "BufEnter" "BufWinEnter" ];
				pattern = [ "*.md" "*.txt" ];
				command = "set wrap";
			}
		];

		diagnostic = {
			settings = {
				virtual_text = true;
				signs = {
					text = config.lib.nixvim.mkRaw ''
						{
							[vim.diagnostic.severity.ERROR] = "",
							[vim.diagnostic.severity.WARN] = "",
							[vim.diagnostic.severity.HINT] = "",
							[vim.diagnostic.severity.INFO] = "",
						}
					'';
				};
				update_in_insert = true;
			};
		};

  };
		# generate undo folder in .cache/nvim/ to
		# improve producibility
		home.file.".cache/nvim/undo/.keep" = {
			text = "";
		};
}
