Climate Cities
==============

Determine a relationship between climate-realted development finance going to urban areas and climate change.

##Method##

1. characterize spatial allocation of climate-related international aid given limited place information
  1. assume an even spatial distribution inside known administrative boundaries at different levels, along with some point locations, buffered point locations, and entire countries when nothing else is known.
  1. all sectors of aid are assumed to be climate-related except for 'Energy and mining', 'Industry and trade', and 'Finance'.
2. given gridded population, characterize the most densely populated areas of the Earth as urban
3. calculate service areas of those urban areas, using a buffer or travel time along roads
4. for each urban area find the total amount of climate-related aid
5. calculate temperature and precipitation anomalies for the period 2001-2010
  1. use 1870-1999 as a baseline
  1. 

##Inputs##

###Climate###

[UCAR's](https://gisclimatechange.ucar.edu/gis-data) monthly global (1.4 degrees) means for surface temperature and total precipitation
for 20th Century or Historical Climate Simulations (1870 - 1999) and High A2 Scenario ( 2000 - 2099 ).
We use the ensemble averages.
These data come from NCAR Community Climate System Model (CCSM).
Note that while CCSM makes a total precipitation climate anomaly dataset available, this is not the case for surface temperature.

###Population###

We use [CIESIN's](http://sedac.ciesin.columbia.edu/data/sets/browse) Global Rural-Urban Mapping Project (GRUMPv1) for the year 2000.

###International Aid###

We use [AidData's](aiddata.org) World Bank Mapping for Results dataset, which covers all projects where World Bank was the donor that were active from ..... to ....
This dataset is current to September 2011.
