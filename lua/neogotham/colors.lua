-- base gotham pallette
local gotham = {
   [0] = '#0c1014',
   [1] = '#11151c',
   [2] = '#091f2e',
   [3] = '#0a3749',
   [4] = '#1e6479',
   [5] = '#599cab',
   [6] = '#99d1ce',
   [7] = '#d3ebe9'
}

local Colors = {
   gotham = gotham,

   -- common named colors
   red     = '#c23127',
   orange  = '#d26937',
   yellow  = '#edb443',
   green   = '#2aa889',
   blue    = '#195466',
   violet  = '#4e5166',
   magenta = '#888ca6',
   cyan    = '#33859e',

   -- neogotham added colors
   night_sea  = '#4d618e',
   neon_green = '#00ff00',

   -- light colors boost regular named colors to value 100 in HSV
   light_red    = '#ff4033',
   light_yellow = '#ffe054',
   light_green  = '#40ffd0',
   light_cyan   = '#52d7ff'
}

return Colors
