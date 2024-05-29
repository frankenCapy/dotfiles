return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    labels = "arstgmneioqwfpbjluyzxcdvkh",
    modes = {
      char = {
        -- When using jump labels, don't use these keys
        -- So they can be used after the motion
        label = { exclude = "hjkliardc" },
        -- Removed , and ; as not used
        keys = { "f", "F", "t", "T" },
        -- The direction for `prev` and `next` is determined by the motion.
        -- `left` and `right` are always left and right.
        char_actions = function(motion)
          return {
            -- Commented "," and ";" as not used
            -- [";"] = "next",   -- set to `right` to always go right
            -- [","] = "prev",   -- set to `left` to always go left

            -- default
            [motion:lower()] = "next",
            [motion:upper()] = "prev",
          }
        end,
      },
      treesitter = {
        labels = "arstgmneioqwfpbjluyzxcdvkh",
      },
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },

    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Flash Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
