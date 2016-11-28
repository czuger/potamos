class GroundHex
  attr_accessor :water

  RANDOM_FACTOR = 5

  def initialize
    @ground_strength = Hazard.d3
    @water = false
  end

  def ground_deviation
    @ground_strength * RANDOM_FACTOR
  end

  def color( surrounding_hexes )

    return 0 if @water
    water_in_area = surrounding_hexes.select{ |e| e if e&.data&.water }
    # p water_in_area if water_in_area.count > 0
    return 9 + [ water_in_area.count, 3 ].min if water_in_area.count > 0

    @ground_strength
  end

end