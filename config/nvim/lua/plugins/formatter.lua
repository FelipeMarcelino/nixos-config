require("formatter").setup(
  {
    filetype = {
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      nix = {
        -- luafmt
        function()
          return {
            exe = "nixpkgs-fmt",
            stdin = true
          }
        end
      }
    }
  }
)
