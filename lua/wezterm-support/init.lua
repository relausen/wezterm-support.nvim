local M = {}

local nvim_user_var_format = "\027]1337;SetUserVar=IS_NVIM=%s\b"

local function formatted_user_var(value)
  local b64_encoded_value = value and vim.base64.encode(value) or ""
  return string.format(nvim_user_var_format, b64_encoded_value)
end

M.set_nvim_user_var = function(value)
  io.stdout:write(formatted_user_var(value))
end

vim.api.nvim_create_user_command("ResetWezTermUserVar", function()
  M.set_nvim_user_var("true")
end, {})

M.set_nvim_user_var("true")

return M
