require("nvim-lightbulb").setup({
  autocmd = { enabled = true },
  ignore = {
    clients = { "packer", "NvimTree" },
    actions_without_kind = false,
  },
})
