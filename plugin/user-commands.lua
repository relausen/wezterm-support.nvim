local ws = require("wezterm-support")

vim.api.nvim_create_user_command("ResetWezTermUserVar", function()
  ws.set_nvim_user_var("true")
end, {})

vim.api.nvim_create_autocmd("VimResume", {
  callback = function()
    ws.set_nvim_user_var("true")
  end,
})

vim.api.nvim_create_autocmd({ "VimSuspend", "VimLeavePre" }, {
  callback = function()
    ws.set_nvim_user_var(nil)
  end,
})
