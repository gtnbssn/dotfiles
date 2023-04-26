return {
  {
    "olimorris/onedarkpro.nvim",
    config = function()
      local color = require("onedarkpro.helpers")
      require("onedarkpro").setup({
        colors = {
          onedark_dark = {
            telescope_results = color.lighten(color.get_colors("onedark").bg, 1),
            telescope_prompt = color.darken(color.get_colors("onedark").bg, 50),
          },
          onelight = {
            telescope_prompt = color.darken(color.get_colors("onelight").bg, 0.98),
            telescope_results = color.darken(color.get_colors("onelight").bg, 0.95),
          },
        },
        highlights = {
          TelescopeBorder = {
            fg = "${telescope_results}",
            bg = "${telescope_results}",
          },
          TelescopePromptBorder = {
            fg = "${telescope_prompt}",
            bg = "${telescope_prompt}",
          },
          TelescopePromptCounter = { fg = "${fg}" },
          TelescopePromptNormal = { fg = "${fg}", bg = "${telescope_prompt}" },
          TelescopePromptPrefix = {
            fg = "${purple}",
            bg = "${telescope_prompt}",
          },
          TelescopePromptTitle = {
            fg = "${telescope_prompt}",
            bg = "${purple}",
          },
          TelescopePreviewTitle = {
            fg = "${telescope_results}",
            bg = "${green}",
          },
          TelescopeResultsTitle = {
            fg = "${telescope_results}",
            bg = "${telescope_results}",
          },
          TelescopeMatching = { fg = "${purple}" },
          TelescopeNormal = { bg = "${telescope_results}" },
          TelescopeSelection = { bg = "${telescope_prompt}" },
          CursorLine = { bg = "${telescope_results}" },
          PmenuSel = { bg = "${telescope_results}" },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark_dark",
    },
  },
}
