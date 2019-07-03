# UM tools #

## `latlon_calc.f90`

Tool from Wuhu to return the N of Lat and Lon cells

The resolution in the longitudinal direction is 2/3 that in the latitudinal direction. This is so that the grid-boxes are (almost) square in mid-latitudes (because of the convergence of the meridians towards the poles)

So there are [(3/4) +1] as many latitudes as there are longitudes. This accounts for the 2/3 ratio, and also for the fact that the unique latitudes only go from pole to pole (so 1/2 the circumference of the earth, whereas the longitudes go the whole way round). And the +1 is because there are latitude points at either end, i.e. at both the north pole and the south pole.
