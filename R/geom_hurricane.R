GeomHurricane <- ggproto("GeomHurricane", Geom,
                         required_aes = c("x","y","r_ne","r_se","r_nw","r_sw"),
                         default_aes = aes(scale_radii=1),
                         draw_key = <a function used to draw the key in the legend>,
                         draw_panel = function(data, panel_scales, coord) {
                           ## Function that returns a grid grob that will
                           ## be plotted (this is where the real work occurs)
                           }
                         )
