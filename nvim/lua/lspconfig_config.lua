local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.gopls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = {"gopls"},
		filetypes = {"go","gomod", "gowork", "gotmpl"},
}
vim.lsp.enable('phpactor')

require'lspconfig'.volar.setup{
	filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'}
}
require'lspconfig'.ts_ls.setup{
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        --location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/language-server",
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
}
require'lspconfig'.tailwindcss.setup{}
vim.keymap.set("n", "<leader>sr", vim.lsp.buf.rename)

--require'lspconfig'.phpactor.setup{
--    on_attach = on_attach,
--    init_options = {
--        ["language_server_phpstan.enabled"] = false,
--        ["language_server_psalm.enabled"] = false,
--    }
--}
