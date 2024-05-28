*Code never sleeps in Neo Gotham City.*

Neo Gotham is a dark Neovim color theme based on classic [Vim Gotham](https://github.com/whatyouhide/vim-gotham).

The motivation was to write the theme using Lua and make it compatible with recent Neovim.

It mostly follows Gotham with addition of some cyberpunk style inspired colors for accented details.

For simplicity of development and support it's intended for terminals with true color capability.

In the future the theme might deviate in its own direction as new features or improvements are added.

## Configuration
By default Neo Gotham uses cyberpunk styled brighter accents for some elements like matching parentheses and search.
Behavior of classic Gotham is still supported for those elements. You can toggle it like this:

```
:lua require("neogotham"):setup({ oldgotham = true })
```

Then reload the theme with:
```
:lua require("neogotham"):load()
```

Or simply:

```
:colorscheme neogotham
```

This can also be applied on theme loading (see Examples).

## Examples:

Installation with lazy.nvim as a primary color theme

``` 
   {  'shmerl/neogotham'
      lazy = false, -- to load this during startup
      priority = 1000, -- to load before all the other start plugins
      config = function()
         vim.cmd.colorscheme("neogotham")
      end
   }

```

Installation with lazy.nvim as a primary color theme using optional old Gotham styles

``` 
   {  'shmerl/neogotham'
      lazy = false,
      priority = 1000,
      config = function()
         require("neogotham"):setup({ oldgotham = true })
         vim.cmd.colorscheme("neogotham")
      end
   }

```

Installation with lazy.nvim as a secondary color theme (for manual loading)

```
   'shmerl/neogotham'
```

## Special Thanks
* [@whatyouhide](https://github.com/whatyouhide) - the author of original [Vim Gotham](https://github.com/whatyouhide/vim-gotham)
* @TheGorondorf - Neo Gotham banner art
