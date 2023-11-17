vim.keymap.set("n", "<leader>db", function()
  vim.o.laststatus = 3
  vim.cmd(":DBUIToggle")
end)
