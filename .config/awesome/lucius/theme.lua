-- Lucius theme

local awful = require("awful")

theme = {}
theme.confdir = awful.util.getdir("config") .. "/lucius/"
theme.wallpaper = theme.confdir .. "lucius-background.png"

theme.font      = "sans 8"

theme.fg_normal = "#BCBCBC"
theme.fg_focus  = "#BCBCBC"
theme.fg_urgent = "#FF8787"
theme.bg_normal = "#1C1C1C"
theme.bg_focus  = "#444444"
theme.bg_urgent = "#870000"
theme.bg_systray = theme.bg_normal

theme.border_width  = 1
theme.border_normal = "#8A8A8A"
theme.border_focus  = "#005F87"
theme.border_marked = "#D78700"

theme.titlebar_bg_focus = theme.bg_normal
theme.titlebar_bg_normal = theme.bg_normal

theme.mouse_finder_color = "#D78700"

theme.menu_height = 15
theme.menu_width  = 100

theme.taglist_squares_sel   = theme.confdir .. "taglist/squarefz.png"
theme.taglist_squares_unsel = theme.confdir .. "taglist/squarez.png"

theme.layout_tile       = theme.confdir .. "layouts/tile.png"
theme.layout_tileleft   = theme.confdir .. "layouts/tileleft.png"
theme.layout_tilebottom = theme.confdir .. "layouts/tilebottom.png"
theme.layout_tiletop    = theme.confdir .. "layouts/tiletop.png"
theme.layout_fairv      = theme.confdir .. "layouts/fairv.png"
theme.layout_fairh      = theme.confdir .. "layouts/fairh.png"
theme.layout_spiral     = theme.confdir .. "layouts/spiral.png"
theme.layout_dwindle    = theme.confdir .. "layouts/dwindle.png"
theme.layout_max        = theme.confdir .. "layouts/max.png"
theme.layout_fullscreen = theme.confdir .. "layouts/fullscreen.png"
theme.layout_magnifier  = theme.confdir .. "layouts/magnifier.png"
theme.layout_floating   = theme.confdir .. "layouts/floating.png"

return theme

