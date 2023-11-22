# ⚡ Fix Auto Scroll Neovim

**fix-auto-scroll** is a lua plugin for Neovim that changes the default behavior in Neovim when switching between buffers. By default in Neovim when you switch to another buffer and get back to the previous buffer the cursor's line number is preserved but that line number is positioned in the middle of the screen vertically. 
This plugin is based on the idea exposed in this [post](https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers).

## ✨ Features

- **fix** the default Neovim behavior that sets the current line in the middle of the screen when switching between buffers

## ⚡️ Requirements

- Neovim >= **0.7.2**. This number will be updated as soon it is tested in other versions

## 📦 Installation

Install the plugin with your preferred package manager:

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'BranimirE/fix-auto-scroll.nvim',
  config = true,
  event = 'VeryLazy'
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)
```vimrc
call plug#begin()
Plug 'BranimirE/fix-auto-scroll.nvim'
call plug#end()

lua require('fix-auto-scroll').setup()
```

## ⚙️ Configuration

For now, it does not accept any configuration
