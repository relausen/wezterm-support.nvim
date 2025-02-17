local M = {}

local default_wezterm_variable_name = "IS_NVIM"
local nvim_user_var_format = "\027]1337;SetUserVar=%s=%s\b"

local function formatted_user_var(user_variable_name, value)
  local b64_encoded_value = value and vim.base64.encode(value) or ""
  return string.format(nvim_user_var_format, user_variable_name, b64_encoded_value)
end

M.user_variable_name = default_wezterm_variable_name

M.setup = function(opts)
  opts = opts or {}
  if opts.user_variable_name then
    M.user_variable_name = opts.user_variable_name
  end
  M.set_nvim_user_var("true")
end

M.set_nvim_user_var = function(value)
  io.stdout:write(formatted_user_var(M.user_variable_name, value))
end

return M
