-- Import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- Import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    -- Enter all the language-specific features (code completion, syntax highlighting, etc)
    "clangd", -- C and C++
    "dockerls", -- Docker
    "html", -- HTML
    "cssls", -- CSS
    "quick_lint_js", -- JavaScript
    "tsserver", -- JavaScript & Typescript
    "sumneko_lua", -- Lua
    "intelephense", -- PHP
    "sqlls", -- SQL
  }
})
