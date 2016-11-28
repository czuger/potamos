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
srand( 272261806232980611960164374502446273770 )

ground = Ground.new
potamos = Potamos.new( ground )

potamos.generate
potamos.colorize


# h.color = -1
ground.to_pic



