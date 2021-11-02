#download some data and make tiles out of it
#NOTE: you can feed multiple extracts into pbfgraphbuilder
wget https://download.bbbike.org/osm/bbbike/Brisbane/Brisbane.osm.pbf
#get the config and setup
mkdir -p valhalla_tiles
valhalla_build_config --mjolnir-tile-dir ${PWD}/valhalla_tiles --mjolnir-tile-extract ${PWD}/valhalla_tiles.tar --mjolnir-timezone ${PWD}/valhalla_tiles/timezones.sqlite --mjolnir-admin ${PWD}/valhalla_tiles/admins.sqlite > valhalla.json
#build routing tiles
#TODO: run valhalla_build_admins?
echo $LD_LIBRARY_PATH
ls /home
ls /usr/local/lib
valhalla_build_tiles -c ${VALHALLA_CONFIG} Brisbane.osm.pbf
#tar it up for running the server
#either run this to build a tile index for faster graph loading times
# valhalla_build_extract -c valhalla.json -v
#or simply tar up the tiles
find valhalla_tiles | sort -n | tar cf valhalla_tiles.tar --no-recursion -T -