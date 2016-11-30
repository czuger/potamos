module GroundEvents

  def populate
    @ground.each do |hex|
      hex.data.settlement
    end
  end

  def nature_grow
    @ground.each do |hex|
      hex.data.set_fertility( @ground.h_surrounding_hexes( hex ) )
    end
  end

  def temples
    @ground.each do |hex|
      hex.data.build_temple( @ground.h_surrounding_hexes( hex ) )
    end
  end

  def cataclysm
    @ground.each do |hex|
      hex.data.remove_water
    end
  end

  def wreck
    @ground.each do |hex|
      hex.data.wreck
    end
  end

  def sand_recover
    @ground.each do |hex|
      hex.data.sand_recover
    end
  end


end