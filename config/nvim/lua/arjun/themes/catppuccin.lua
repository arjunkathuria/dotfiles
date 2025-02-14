return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local catppuccin = require("catppuccin")

    catppuccin.setup({
      integrations = {
      ts_rainbow = true,
      },
    })
  vim.cmd([[colorscheme catppuccin-mocha]])
  end,
}
