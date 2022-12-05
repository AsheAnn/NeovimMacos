local util = require("lspconfig.util")

return {
  cmd = { "solc", "--lsp", "--include-path", },
  root_dir = util.root_pattern { "hardhat.config.*", ".git", "foundry.toml" },
}
