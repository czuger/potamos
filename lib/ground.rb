require 'rhex'
require_relative 'ground_hex'
require_relative 'ground_events'

class Ground

  include Magick
  include GroundEvents

  attr_reader :ground, :rows, :cols, :hex_ray

  PIC_NAME = 'test2.png'

  def initialize( rows, cols, debug: false )

    @rows = rows
    @cols = cols

    @ground = SquareGrid.new( element_to_color_hash: {
      # 1 => '#ffe680', 2 => '#ffe066', 3 => '#ffdb4d',
      :sand => '#ffe680', :sand_high => '#ffe066', :sand_peak => '#ffdb4d',
      vegetation_traces: '#ffdb4d', river_traces: '#e0a316',
      water: '#00a3cc', :dark => '#000000',
      herb: '#c2e016', grass: '#96e016', luxurious: '#34e016' } )

    @hex_ray = @ground.hex_ray

    1.upto( cols ).each do |q|
      1.upto( rows ).each do |r|
        @ground.cset( q, r, data: GroundHex.new( debug: debug ) )
      end
    end

  end

  # def cataclysm
  #   @ground.each do |hex|
  #     hex.
  #   end
  # end

  def to_pic( pic_name )

    @ground.each do |hex|
      hex.color = hex.data.color
    end

    canvas = @ground.to_rmagick_image

    @ground.each do |hex|
      if hex.data.dwelling&.exists?
        d = hex.data.dwelling
        x, y = @ground.to_xy( hex )
        # p d
        canvas = canvas.composite( d.image, x + d.decalx - @ground.half_width, y + d.decaly - @ground.hex_height/2, OverCompositeOp )
      end
    end

    canvas.write( pic_name )
  end

end