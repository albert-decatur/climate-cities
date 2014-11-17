#!/bin/bash

# assign geoms to aiddata points - assume distribution by surface area
# assign adm0,adm1,adm2,25 km buffered point, or just initial aid point based on precision code, lat, lng
# assign financials based on input field of users choice - assumed to be at project level, distributed evenly across project locations
# inputs: postgres table with { projectid, financials column, precision code, lat, lng }, **and** allgeom table in postgis from GAUL boundaries with adm_level field (0|1|2) and geom field
# output: raster with user's choice of x/y res with financials by pixel
# NB: input aid table must have valid lng,lat, be wgs84, prec code must be {1,2,3,4,5,6,8}, financials must refer to project level, aid must fall within an allgeom to be considered when prec code is {3,4}
# example use: $0

inaid=m4r
ingeom=allgeoms
indb=scratch
outrast=/tmp/out.tif

rm $outrast 2>/dev/null


