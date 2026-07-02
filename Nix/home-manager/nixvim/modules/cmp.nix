{ ... }:
{
	programs.nixvim = {
		plugins = {
			cmp_luasnip.enable = true;
			cmp.enable = true;
			cmp-buffer.enable = true;
			cmp-path.enable = true;
			cmp-nvim-lsp.enable = true;
		};
		extraConfigLua = ''
			local cmp = require('cmp')

			cmp.setup({
				snippet = {
					expand = function(args)
						 require('luasnip').lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<Tab>'] = cmp.mapping.select_next_item(),
					['<S-Tab>'] = cmp.mapping.select_prev_item(),
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),

				window = {
						-- completion = cmp.config.window.bordered(),
						-- documentation = cmp.config.window.bordered(),
				},

				sources = cmp.config.sources({
						{ name = 'nvim_lsp' },
						{ name = 'luasnip' },
				}, {
						{ name = 'buffer' },
						{ name = 'path' },
				}),
			})

			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local servers = {
				'clangd',
				'basedpyright',
				'nil_ls',
				'lua_ls',
				'arduino_language_server',
				'jdtls',
			}

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
			end
		'';
	};
}
