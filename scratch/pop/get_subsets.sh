#!/bin/bash
# for each city poly, get one shp
# then clip to aid and climate tifs
# after script runs you just need summary stats from tifs
# example use: $0 cities /tmp/city_tifs/

cities_outdir=$1
tifs_outdir=$2

function get_citiesshp {
	a="'"
	inshp=geonames_PPLge10k_by_GRUMPpoly.shp
	ogrinfo -geom=no -ro -al -sql "select GID_GRUMP from $(basename $inshp .shp)" $inshp |\
	grep GID_GRUMP|\
	sed '1d' |\
	grep -oE "[0-9]+"|\
	parallel --gnu 'ogr2ogr -sql "select * from $(basename '$inshp' .shp) where GID_GRUMP = '$a'{}'$a'" '$cities_outdir'/{}.shp '$inshp''
}

function get_tifs {
	rm -r $tifs_outdir
	mkdir $tifs_outdir
	for inrast in ../aid/aid.tif ../climate/*.tif
	do 
		find $cities_outdir -type f -iregex ".*[.]shp$" | parallel --gnu '
				~/gis-utils/clipRastByShp.sh '$inrast' 0 {} '$tifs_outdir'/$(basename {} .shp)_$(basename '${inrast}' )
			'
		done
}

# get_citiesshp
get_tifs
