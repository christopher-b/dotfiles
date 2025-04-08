return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- dashboard = { enabled = true },
    dashboard = {
      preset = {
        header = [[
         ...                                     :                                               ...
         ...       L.                     ,;    t#,                                              ...
         ...       EW:        ,ft       f#i    ;##W.              t                              ...
         ...       E##;       t#E     .E#t    :#L:WE              Ej            ..       :       ...
         ...       E###t      t#E    i#W,    .KG  ,#D  t      .DD.E#,          ,W,     .Et       ...
         ...       E#fE#f     t#E   L#D.     EE    ;#f EK:   ,WK. E#t         t##,    ,W#t       ...
         ...       E#t D#G    t#E :K#Wfff;  f#.     t#iE#t  i#D   E#t        L###,   j###t       ...
         ...       E#t  f#E.  t#E i##WLLLLt :#G     GK E#t j#f    E#t      .E#j##,  G#fE#t       ...
         ...       E#t   t#K: t#E  .E#L      ;#L   LW. E#tL#i     E#t     ;WW; ##,:K#i E#t       ...
         ...       E#t    ;#W,t#E    f#E:     t#f f#:  E#WW,      E#t    j#E.  ##f#W,  E#t       ...
         ...       E#t     :K#D#E     ,WW;     f#D#;   E#K:       E#t  .D#L    ###K:   E#t       ...
         ...       E#t      .E##E      .D#;     G#t    ED.        E#t :K#t     ##D.    E#t       ...
         ...       ..         G#E        tt      t     t          E#t ...      #G      ..        ...
         ...                   fE                                 ,;.          j                 ...
         ...                    ,                                                                ...]]
      },
      sections = {
        { section = "header" },
        { icon = "", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = "", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = "", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          icon = "",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 2,
        },
        { section = "startup" },
      },
    },
    indent = {
      enabled = true,
      only_scope = true,
      animate = { enabled = false }
    },
    lazygit = {
      enabled = true,
      configure = true,
    },
    picker = { enabled = true },
  },
  keys = {
    { "<leader>gs", function() Snacks.lazygit() end,                desc = "LazyGit" },
    { "<leader>:",  function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n",  function() Snacks.picker.notifications() end,   desc = "Notification History" },
    { "<leader>.",  function() Snacks.scratch() end,                desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end,         desc = "Select Scratch Buffer" },
  },
}
