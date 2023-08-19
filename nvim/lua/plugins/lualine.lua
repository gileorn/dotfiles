-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  options = {
    disabled_filetypes = { statusline = { "packer", "NvimTree", "Diffview", "DiffviewFiles" } },
  },
})
