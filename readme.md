![Neo Gotham banner](https://github.com/shmerl/neogotham/assets/310927/26b523e3-dfc5-4e1c-9790-de980af662f6)

> Code never sleeps in Neo Gotham City.

Neo Gotham is a very dark Neovim color theme based on the classic [Vim Gotham](https://github.com/whatyouhide/vim-gotham).

![Theme screenshot](https://github.com/shmerl/neogotham/assets/310927/bf986e30-6f30-46dd-8baa-ce48562b77c9)

The motivation was to write the theme using Lua and to make it compatible with recent Neovim.

It mostly follows Gotham with addition of some cyberpunk inspired colors for accented details.

For simplicity of development and support it's intended for terminals with true color capability.

In the future the theme might deviate from classic Gotham more as new features or improvements are added.

## Configuration

By default Neo Gotham uses cyberpunk styled brighter accents for some elements like matching parentheses and search.
Behavior of classic Gotham is still supported for those elements and can be enabled like this:

```vim
:lua require("neogotham"):setup({ oldgotham = true })
```

Then reload the theme with:

```vim
:colorscheme neogotham
```

This can also be applied on theme loading (see Examples).

## Examples

Installation with lazy.nvim as a primary color theme

```lua
   {  'shmerl/neogotham',
      lazy = false, -- to make sure it's loaded on startup
      priority = 1000, -- to load before other plugins
      config = function()
         vim.cmd.colorscheme("neogotham")
      end
   }

```

Installation with lazy.nvim as a primary color theme using optional old Gotham styles

```lua
   {  'shmerl/neogotham',
      lazy = false,
      priority = 1000,
      config = function()
         require("neogotham"):setup({ oldgotham = true })
         vim.cmd.colorscheme("neogotham")
      end
   }

```

Installation with lazy.nvim as a secondary color theme (for manual loading)

```lua
   'shmerl/neogotham'
```

## Special thanks and credits
* [@whatyouhide](https://github.com/whatyouhide) - the author of original [Vim Gotham](https://github.com/whatyouhide/vim-gotham)
* [@TheGorondorf](https://bsky.app/profile/rayfrutos.bsky.social) - Neo Gotham banner art
