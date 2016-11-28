require 'rhex'
require 'hazard'

ground = SquareGrid.new

1.upto(50).each do |q|
  1.upto(50).each do |r|
    ground.cset( q, r, val: Hazard.d3 )
  end
end

dest_hex = ground.cset( 25, 50, val: 0 )

h = ground.cset( 25, 1, val: 0 )
p h

1.upto(5) do
  surrounding_hexes = h.get_surrounding_hexs.map{ |h| [ h.distance( dest_hex ), ground.hget( h ) ] }.reject{ |e| !e[1] }.reject{ |e| e[1].val == 0 }
  p surrounding_hexes
  weighted_surrounging_hexes = surrounding_hexes.map{ |e| [ e[0] * e[1].val, e[1] ] }
  p weighted_surrounging_hexes

  min_weight = weighted_surrounging_hexes.map{ |e| e[0] }.min
  weighted_surrounging_hexes.reject!{ |e| e[0] > min_weight }

  next_hex = weighted_surrounging_hexes.sample.last
  next_hex.val = 0
  p next_hex

  h = next_hex
end

element_to_color_hash = {
  1 => '#ffe680', 2 => '#ffe066', 3 => '#ffdb4d', 0 => '#00a3cc'
}
ground.set_element_to_color_hash( element_to_color_hash )
ground.to_pic( 'test2.png' )

