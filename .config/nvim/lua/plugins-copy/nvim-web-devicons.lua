return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    override_by_extension = {
      ["rb"] = {
        icon = "",
        color = "#9c5247",
        -- color = "#BF616A",
        name = "Ruby",
      },
      ["erb"] = {
        icon = "",
        color = "#9c5247",
        name = "ERB",
      },
    },
  },
}
