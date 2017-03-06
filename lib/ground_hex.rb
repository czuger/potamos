require_relative 'dwelling'

class GroundHex

  attr_accessor :water
  attr_reader :dwelling

  RANDOM_FACTOR = 5

  def initialize( debug: false )
    @ground_strength = Hazard.d3
    @water = false
    @debug = debug
  end

  def ground_deviation
    @ground_strength * RANDOM_FACTOR
  end

  def set_fertility( surrounding_hexes )
    unless @water
      water_around_area = surrounding_hexes.select{ |e| e if e&.data&.water }
      fertility = [ water_around_area.count, 3 ].min if water_around_area.count > 0
      @fertility = [ :herb, :grass, :luxurious ][ fertility - 1 ] if fertility
    end
  end

  def settlement
    if @debug || @fertility == :luxurious
      @dwelling = Dwelling.new( :huts, debug: @debug )
    end
  end

  def build_temple( surrounding_hexes )
    unless @dwelling&.huts? || water
      villages_count = surrounding_hexes.compact.select{ |e| e.data.dwelling&.huts? }.count
      if villages_count >= 2
        @dwelling = Dwelling.new( :temple )
      end
    end
  end

  def wreck
    @dwelling&.wreck
  end

  def remove_water
    @carving = :river_traces if @water
    @carving = :vegetation_traces if @fertility

    @water = false
    @fertility = nil
    @dwelling = nil if @dwelling&.huts?
  end

  def sand_recover
    @carving = nil
    @water = false
    @fertility = nil
    @dwelling = nil
    @ground_strength = Hazard.d3
  end

  def color
    return :water if @water
    return @fertility if @fertility
    return @carving if @carving
    return :sand_peak if @ground_strength > 2
    return :sand_high if @ground_strength > 1
    :sand
  end

  def to_hash
    { ground_strength: @ground_strength, water: @water, dwelling: @dwelling&.to_hash, fertility: @fertility, carving: @carving }
  end

end