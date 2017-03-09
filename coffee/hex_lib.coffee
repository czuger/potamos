root = exports ? this

window.hex_lib = {};

directions = [ [0,-1], [1,-1], [1,0], [0,1], [-1,+1], [-1,0] ]
hex_ray = 16

hex_height = hex_ray * 2
hex_width = ( Math.sqrt(3) * hex_height ) / 2.0


hex_lib.xy_to_qr = ( x, y ) ->

#  console.log( x, y )

  x -= hex_width / 2.0
  y -= hex_height / 2.0

  q = Math.round( ( ( x * Math.sqrt(3)/3.0 - y/3.0) / hex_ray ) )
  r = Math.round( ( y * 2.0/3.0 / hex_ray ) )

  [ q, r ]


hex_lib.qr_to_xy = ( q, r ) ->

  x = Math.round( hex_ray * Math.sqrt(3) * ( q + ( r/2.0 ) ) )
  y = Math.round( hex_ray * 3.0/2.0 * r )

  x += hex_width / 2.0
  y += hex_height / 2.0

  [ x, y ]


hex_lib.qr_to_hex_data = ( q, r ) ->
  key = "[#{q}, #{r}]"
  root.data[ key ]


hex_lib.xy_to_hex_data = ( x, y ) ->
  [ q, r ] = hex_lib.xy_to_qr( x, y )
  hex_lib.qr_to_hex_data( q, r )


hex_lib.surrounding_hexes = ( q, r ) ->
  _directions = []

  for direction in directions
    _directions.push( [ direction[0]+q, direction[1]+r ] ) if hex_lib.qr_to_hex_data( direction[0]+q, direction[1]+r )?

  _directions

hex_lib.hex_cost = ( q, r ) ->
  h = hex_lib.qr_to_hex_data( q, r )
  if h?
#    console.log( h )
#    console.log( h[ 'data' ][ 'ground_strength' ] )
    malus = 0
    malus = 2 if h[ 'data' ][ 'water' ]
    malus = -1 if h[ 'data' ][ 'fertility' ]
    h[ 'data' ][ 'ground_strength' ] + malus




