local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = "$HOME/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin
local sumneko_binary =
  "/nix/store/ss44x0as56aggnx5bzs45hra94m1c0r5-sumneko-lua-language-server-2.4.7/bin/lua-language-server"
local sumneko_main =
  "/nix/store/ss44x0as56aggnx5bzs45hra94m1c0r5-sumneko-lua-language-server-2.4.7/share/lua-language-server/bin/Linux/main.lua"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require "lspconfig".sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_main},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim"}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false
      }
    }
  }
}
