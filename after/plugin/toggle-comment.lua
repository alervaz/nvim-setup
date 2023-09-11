require('nvim_comment').setup({
  operator_mapping = "<leader>/"
})

vim.keymap.set("n", "<leader>/", function ()
  vim.cmd("CommentToggle")
end)
