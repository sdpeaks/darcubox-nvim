# darcubox

A color scheme for Neovim inspired by Gruvbox and Darcula written in Lua

![darcubox](https://github.com/dotsilas/darcubox-nvim/assets/84829590/e88ffbf6-a658-4def-83d3-90907f11f07c)


**Note: This is under development.**

Hello! Thanks for checking out my project. I'm working on it solo, so there might be some rough edges.
If you encounter problems or have ideas, please open an issue. Your input is valuable in improving the project.
Thanks for your interest!

## Instalation

Using [Lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "dotsilas/darcubox-nvim",
  config = function() vim.cmd("colorscheme darcubox") end
}
```

## Usage

### Lua
```lua
vim.cmd[[colorscheme darcubox]]
```

## Configuration

The default configuration for darcubox is as follows:

```lua
require('darcubox').setup({
    options = {
        transparent = false
        styles = {
            comments = {},
            functions = {},
            keywords = {},
            types = {},
        }
    }
})
```

You can change the background to transparent and the styles of `Comment`, `Function`, `Keyword` and `Type` syntax groups as follows:

```lua
require('darcubox').setup({
    options = {
        transparent = true
        styles = {
            comments = { italic = true }, -- italic
            functions = { bold = true }, -- bold
            keywords = { italic = true },
            types = { italic = true, bold = true }, -- italics and bold
        }
    }
})

-- Set the configuration before loading the color scheme

vim.cmd[[colorscheme darcubox]]
```

## Thanks to:

### Palette inspiration
- [Gruvbox](https://github.com/morhetz/gruvbox)
- [Darcula](https://github.com/bulenkov/Darcula)

### Template ideas
- [Material](https://github.com/marko-cerovac/material.nvim)
- [Tokio Night](https://github.com/folke/tokyonight.nvim)

## Licence

[MIT](./LICENCE)
