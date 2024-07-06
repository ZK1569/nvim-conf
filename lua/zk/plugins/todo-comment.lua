return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    local keymap = vim.keymap -- for conciseness

    todo_comments.setup()
  end,
}

-- TODO: what to do 
-- PERF: Its perfect (no performence probleme)
-- HACK: This looks funky
-- NOTE: What else
-- FIX: Its in danger 
-- WARNING: ????
