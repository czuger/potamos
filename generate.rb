require 'rhex'
require 'hazard'

require_relative 'lib/ground'
require_relative 'lib/potamos'

new_seed = Random.new_seed
puts new_seed
srand( new_seed )

# working seed
# srand( 176015363531786765346481395602128161585 )

# broken seed
# srand( 192174785237470115019899101558127501028 )

# Good one :
# srand( 272261806232980611960164374502446273770 )

# Island lake :
# srand( 318008735317579507304133411082872842406 )

# Big lake :
# srand( 92250243728220088899762085089458580747 )

# River 1 :
# srand( 54900999897528399859676910779927503728 )

# River 2 :
# srand( 188247585953115603880262365309431988759 )

ground = Ground.new( 30, 20, debug: false )
ground.to_pic( 'pics/10_desert.jpg' )

potamos = Potamos.new( ground )
potamos.generate
ground.nature_grow
ground.to_pic( 'pics/20_a_river.jpg' )

ground.populate
ground.to_pic( 'pics/40_dwellings.jpg' )

ground.temples
ground.to_pic( 'pics/50_temples.jpg' )

ground.cataclysm
ground.to_pic( 'pics/60_cataclysm.jpg' )

ground.wreck
ground.to_pic( 'pics/70_wrecks.jpg' )

ground.sand_recover
ground.to_pic( 'pics/80_sand_recover.jpg' )




