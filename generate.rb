require 'rhex'
require 'hazard'

require_relative 'lib/ground'
require_relative 'lib/potamos'

# new_seed = Random.new_seed
# puts new_seed
# srand( new_seed )

# working seed
# srand( 176015363531786765346481395602128161585 )

# broken seed
# srand( 192174785237470115019899101558127501028 )

# Good one :
# srand( 272261806232980611960164374502446273770 )

ground = Ground.new( 50, 50 )
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

# h.color = -1




