require_relative 'dwelling'

class GroundHex

  attr_accessor :water
  attr_reader :dwelling

  RANDOM_FACTOR = 5

  def initialize
    @ground_strength = Hazard.d3
    @water = false
  end

  def ground_deviation
    @ground_strength * RANDOM_FACTOR
  end

  def set_fertility( surrounding_hexes )
    unless @water
      water_around_area = surrounding_hexes.select{ |e| e if e&.data&.water }
      @fertility = [ water_around_area.count, 3 ].min if water_around_area.count > 0
    end
  end

  def set_icon
    if @fertility == 3
      @dwelling = Dwelling.new
    end
  end

  def color
    return 0 if @water
    return 9 + @fertility if @fertility
    @ground_strength
  end

end