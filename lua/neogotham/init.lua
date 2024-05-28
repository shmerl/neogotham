local highlights = require("neogotham/highlights")

local Neogotham = {
   name = 'neogotham',
   config = {
      oldgotham = false
   }
}

function Neogotham:new()
   -- do any internal dynamic module initialization here
   return self
end

-- called every time when theme is selected
function Neogotham:load()
   vim.cmd.highlight('clear')
   vim.o.background = 'dark'
   vim.o.termguicolors = true
   vim.g.colors_name = self.name

   self:set_colors()
end

local function process_config_boolean(self, config, key)
   -- not setting if key name is not provided
   if config[key] == nil then
      return
   end

   if type(config[key]) ~= "boolean" then
      error(string.format("Invlaid type %s used in setup for config.%s! Expected type: boolean", type(config[key]), key))
   end

   self.config[key] = config[key]
end

-- for explicit configuration by the user, called for example from lazy.nvim spec if specified
function Neogotham:setup(config)
   if config == nil then
      return
   end

   if (type(config) ~= "table") then
      error(string.format("Invalid call of setup with config of type %s! config must be a table", type(config)))
   end

   process_config_boolean(self, config, "oldgotham")
end

function Neogotham:set_colors()
   -- common highlights
   highlights.set(highlights.common)

   if not self.config.oldgotham then
      -- neogotham / cyberpunk style specific highlights
      highlights.set(highlights.neogotham)
   else
      -- alternatively, old gotham specfic highlights
      highlights.set(highlights.oldgotham)
   end

   -- revisit terminal colors setting after theme is complete in general
   highlights:set_terminal_colors()
end

return Neogotham:new()
