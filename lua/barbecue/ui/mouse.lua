local M = {}

setmetatable(M, {
  __index = function(self, key)
    if type(key) ~= "string" then return nil end

    local parts = vim.split(key, "_")
    if #parts == 4 and parts[1] == "navigate" then
      local win = tonumber(parts[2])
      local pos = { tonumber(parts[3]), tonumber(parts[4]) }

      return function(_, _, button)
        if button ~= "l" then return end

        vim.api.nvim_set_current_win(win)
        vim.api.nvim_win_set_cursor(win, pos)
      end
    end

    return nil
  end,
})

return M
