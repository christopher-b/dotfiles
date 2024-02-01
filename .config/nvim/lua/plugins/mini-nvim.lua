-- Mini mod pack: https://github.com/echasnovski/mini.nvim
return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.pairs").setup()   -- matching brackets, quotes etc.
    require("mini.starter").setup() -- matching brackets, quotes etc.
  end
}
