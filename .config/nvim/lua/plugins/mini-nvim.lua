-- Mini mod pack: https://github.com/echasnovski/mini.nvim
return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.pairs").setup() -- matching brackets, quotes etc.
    require("mini.animate").setup({
      scroll = { enable = true, },
      cursor = { enable = false, },
      resize = { enable = false, },
      open   = { enable = false, },
      close  = { enable = false, },
    })
    require("mini.starter").setup() -- matching brackets, quotes etc.
  end
}
