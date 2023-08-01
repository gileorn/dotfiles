# Personalized Development Environment

Personalized development environment (PDE), term that was brought up by TJ [DeVries](https://github.com/tjdevries) in this [video essay on why whould someone use Neovim](https://www.youtube.com/watch?v=QMVIJhC9Veg).

![ui overview](./img/overview.png)

## Overview, UI and features

<details>
  <summary>Lazygit as a git wrapper</summary>
  <div>
    <img src="/img/lazy-git.png"></img>
  </div>
</details>

<details>
  <summary>Telescope neovim plugin to fuzzy-search basically anything</summary>
  <div>
    <img src="/img/telescope.png"></img>
  </div>
</details>


## The real heroes of this setup

- [neovim](https://github.com/neovim/neovim)
- [tmux](https://github.com/tmux/tmux)
- [leap](https://github.com/ggandor/leap.nvim) - the thing that makes you forget about the mouse and get wherever you want in just 4 keystrokes
- [harpoon](https://github.com/ThePrimeagen/harpoon) - the only sensible way to use bookmarks and the reason I don't want to use tabs anymore
- [which-key](https://github.com/folke/which-key.nvim) - keymaps that make sense and which you don't need to always remember
- [telescope](https://github.com/nvim-telescope/telescope.nvim) - fuzzy search basically anything you can even imagine
- [trouble](https://github.com/folke/trouble.nvim) - jump across the codebase with smart definitions and references
- [lazygit](https://github.com/jesseduffield/lazygit/tree/master) - git wrapper that makes sense
- and of course the power of Neovim

## Plugins list

**Git**

- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - line indicators with git information (added, deleted, changed)
- [git-blame](https://github.com/f-person/git-blame.nvim) - git blame for the current line
- [diffview](https://github.com/sindrets/diffview.nvim) - see all git changes, view diffs, resolve merge conflicts

**Navigation**

- [leap](https://github.com/ggandor/leap.nvim) - unbelievable way to get wherever you want in the buffer with just 3 keystrokes
- [harpoon](https://github.com/ThePrimeagen/harpoon) - the only sensible way to use bookmarks and the reason I don't want to use tabs anymore
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) - convenient file explorer
- [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) - scrollbar with search and git integrations
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - navigation between nvim splits and tmux panes

**Utility**

- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [which-key](https://github.com/folke/which-key.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [vim-maximizer](https://github.com/szw/vim-maximizer)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-surround](https://github.com/kylechui/nvim-surround/tree/main)
- [toggleterm](https://github.com/akinsho/toggleterm.nvim)
- [comment](https://github.com/numToStr/Comment.nvim)
- [packer](https://github.com/wbthomason/packer.nvim) - the package manaer for neovim
- [catpuccin](https://github.com/catppuccin/nvim) - colorscheme of choice

**Search**

- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)
- [spectre](https://github.com/nvim-pack/nvim-spectre)

**Autocompletion & snippets**

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [luasnip](https://github.com/L3MON4D3/LuaSnip)

**LSP**

- [trouble](https://github.com/folke/trouble.nvim)
- [mason](https://github.com/williamboman/mason.nvim) - package manager for LSPs and linters
- [lightbulb](https://github.com/kosayoda/nvim-lightbulb) - code actions indicator
- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [lspconfig](https://github.com/neovim/nvim-lspconfig)
- [code-action-menu](https://github.com/weilbith/nvim-code-action-menu)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
