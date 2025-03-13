-- If there's a .prettierrc file, this prevents Conform from adding --single-quote to the args
local function has_prettier_config()
  -- Check for any .prettierrc* files (e.g. .prettierrc, .prettierrc.json, .prettierrc.yml, etc.)
  if #vim.fn.glob(".prettierrc*", false, true) > 0 then
    return true
  end

  -- Check for any prettier.config.* files (e.g. prettier.config.js, prettier.config.ts, etc.)
  if #vim.fn.glob("prettier.config.*", false, true) > 0 then
    return true
  end

  -- Check for a top-level "prettier" key in package.json
  if vim.fn.filereadable("package.json") == 1 then
    local content = table.concat(vim.fn.readfile("package.json"), "\n")
    local ok, data = pcall(vim.fn.json_decode, content)
    if ok and type(data) == "table" then
      if data.prettier then
        return true
      end
    end
  end

  return false
end

return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      prettier = {
        prepend_args = (function()
          if not has_prettier_config() then
            return { "--single-quote" }
          else
            return {}
          end
        end)(),
      },
    },
  },
}
