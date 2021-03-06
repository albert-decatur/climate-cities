Climate Cities
==============

Determine a relationship between climate-related development finance going to urban areas and climate change.

##Method##

1. characterize spatial allocation of climate-related international aid given limited place information
  1. assume an even spatial distribution inside known administrative boundaries at different levels, along with some point locations, buffered point locations, and entire countries when nothing else is known.
  1. all sectors of aid are assumed to be climate-related except for 'Energy and mining', 'Industry and trade', and 'Finance'
2. define urban as GRUMP 1995 urban mask areas that overlap at least one GeoNames populated place with population >= 10,000
4. for each urban area find the total amount of climate-related aid
5. calculate temperature and precipitation anomalies for the period 1995-1999 (uses historical data) and 2015-2030 (uses forecast data).
  1. use 1870-1999 as a baseline in both cases
6. for each urban area find the temperature and precipitation anomalies for 1995-1999 and 2015-2030
7. make two scatterplots
  1. units are urban areas, X is climate historical anomaly and Y is climate-related aid funding
  1. units are urban areas, X is climate forecast anomaly and Y is climate-related aid funding
  1. make a composite index of temp and precip anomaly or do four scatterplots?

Note that:
1. GRUMP urban area mask is for 1995, but GRUMP population counts are for 2000
  1. there is no other GRMUP urban mask

##Inputs##

###Climate###

[UCAR's](https://gisclimatechange.ucar.edu/gis-data) monthly global (1.4 degrees) means for surface temperature and total precipitation
for 20th Century or Historical Climate Simulations (1870 - 1999) and High A2 Scenario ( 2000 - 2099 ).
We use the ensemble averages.
These data come from NCAR Community Climate System Model (CCSM).
Note that while CCSM makes a total precipitation climate anomaly dataset available, this is not the case for surface temperature.

###Urban Areas###

We use [CIESIN's](http://sedac.ciesin.columbia.edu/data/sets/browse) Global Rural-Urban Mapping Project (GRUMPv1) Urban Extents for the year 1995 that are within a distance of [GeoNames](geonames.org) populated places with population greater than or equal to ten thousands.

###International Aid###

We use [AidData's](aiddata.org) World Bank Mapping for Results dataset, which covers all projects where World Bank was the donor that were active for a subset of years.
This dataset is current to September 2011.

##Caveats##

* lat/lon have been updated according to latest GeoNames using GeoName IDs
  * a few hundred aid project locations with no current entries in the GeoNames gazeteer have been removed
* GAUL boundaries for 2013 are used regardless of the year that aid was provided.  In other words, the year for boundaries is always 2013.

col_name|meaning
|---|---|
mean_hist|mean monthly for historical 1870-1999
mean_sub1|mean monthly for historical 1995-1999
mean_sub2|mean monthly for forecast 2015-2030
absdiff_sub1hist|abs( mean monthly 1995-1999 - mean monthly 1870-1999 )
prctdiff_sub1hist|abs( mean monthly 1995-1999 - mean monthly 1870-1999 )/(mean monthly 1870-1999)*100
absdiff_sub2hist|abs( mean monthly 2015-2030 - mean monthly 1870-1999 )
prctdiff_sub2hist|abs( mean monthly 2015-2030 - mean monthly 1870-1999 )/(mean monthly 1870-1999)*100
