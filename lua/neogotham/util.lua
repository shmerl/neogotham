local Util = { }

-- multiplies each of rr, gg, bb by non negative modifier to change brightness
-- it's equivalent to multiplying the value in HSV by the same amount
-- values > 1 brighten the color
-- values < 1 darken the color
-- assumes color in '#rrggbb'
function Util.modify_brightness(color, modifier)
   -- convert hex color substrings to numeric values
   local r = tonumber(color:sub(2, 3), 16)
   local g = tonumber(color:sub(4, 5), 16)
   local b = tonumber(color:sub(6, 7), 16)
 
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
