local Util = { }

-- for converting hex color substrings to numeric values
-- assume color in '#rrggbb'
function Util.red(color)
   return tonumber(color:sub(2, 3), 16)
end

function Util.green(color)
   return tonumber(color:sub(4, 5), 16)
end

function Util.blue(color)
   return tonumber(color:sub(6, 7), 16)
end

-- multiplies each of rr, gg, bb by non negative modifier to change brightness
-- it's equivalent to multiplying the value in HSV by the same amount
-- values > 1 brighten the color
-- values < 1 darken the color
-- assumes color in '#rrggbb'
function Util.modify_brightness(color, modifier)
   local r = Util.red(color)
   local g = Util.green(color)
   local b = Util.blue(color)
 
   if (r == nil) or (g == nil) or (b == nil) or (modifier < 0) then
      return nil
   end
 
   -- modify brightness, clamping each color component at 0xff (255)
   r = math.min(r * modifier, 0xff)
   g = math.min(g * modifier, 0xff)
   b = math.min(b * modifier, 0xff)
 
   return ('#%02x%02x%02x'):format(r, g, b)
end

return Util
