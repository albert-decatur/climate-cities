#!/bin/bash

a="'"
outdir=cities
inshp=geonames_PPLge10k_by_GRUMPpoly.shp
ogrinfo -geom=no -ro -al -sql "select GID_GRUMP from $(basename $inshp .shp)" $inshp |\
grep GID_GRUMP|\
sed '1d' |\
grep -oE "[0-9]+"|\
parallel --gnu 'ogr2ogr -sql "select * from $(basename '$inshp' .shp) where GID_GRUMP = '$a'{}'$a'" '$outdir'/{}.shp '$inshp''
