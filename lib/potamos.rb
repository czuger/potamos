

class Potamos

  def initialize( ground )
    @cols = ground.cols
    @rows = ground.rows

    @ground = ground.ground
    @watered_hexes = []
  end

  def generate

    # p @ground

    @dest_hex = @ground.cget( @cols/2, @rows-1 )
    @dest_hex.data.water = true

    h = @ground.cget( @cols/2, 0 )
    h.data.water = true

    while( h && h != @dest_hex )
      h = get_next_hex( h )
      if h
        @watered_hexes << h
      else
        h = @dest_hex.nearest_hex( @watered_hexes )
      end
    end

  end

  private

  def get_next_hex( current_hex )

    surrounding_hexes = @ground.h_surrounding_hexes( current_hex ).map{ |h| [ h.distance( @dest_hex ), h ] if h }.compact

    # Are we at destination :
    surrounding_hexes.each do |h|
      return @dest_hex if h[1] == @dest_hex
    end

    surrounding_hexes.reject!{ |e| e[1].data.water }

    # p '*'*50
    # p surrounding_hexes
    weighted_surrounging_hexes = surrounding_hexes.map{ |e| [ ( e[0] + e[1].data.ground_deviation ), e[1] ] }
    # p weighted_surrounging_hexes
    return if weighted_surrounging_hexes.empty?

    min_weight = weighted_surrounging_hexes.map{ |e| e[0] }.min
    weighted_surrounging_hexes.reject!{ |e| e[0] > min_weight }
    # p weighted_surrounging_hexes

    return if weighted_surrounging_hexes.empty?

    next_hex = weighted_surrounging_hexes.sample

    if next_hex.first == 1
      dummy = false
    end

    next_hex = next_hex.last
    next_hex.data.water = true
    next_hex
  end


end