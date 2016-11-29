require 'rhex'
require_relative 'ground_hex'

class Ground

  include Magick

  attr_reader :ground, :rows, :cols

  PIC_NAME = 'test2.png'

  def initialize( rows, cols )

    @rows = rows
    @cols = cols

    @ground = SquareGrid.new( element_to_color_hash: {
      # 1 => '#ffe680', 2 => '#ffe066', 3 => '#ffdb4d',
      1 => '#ffe680', 2 => '#ffe680', 3 => '#ffe680',
      0 => '#00a3cc', -1 => '#000000',
      10 => '#c2e016', 11 => '#96e016', 12 => '#34e016' } )

    1.upto( cols ).each do |q|
      1.upto( rows ).each do |r|
        @ground.cset( q, r, data: GroundHex.new )
      end
    end

  end

  def populate
    @ground.each do |hex|
      hex.data.set_icon
    end
  end

  def nature_grow
    @ground.each do |hex|
      hex.data.set_fertility( @ground.h_surrounding_hexes( hex ) )
    end
  end

  def to_pic( pic_name )

    @ground.each do |hex|
      hex.color = hex.data.color
    end

    canvas = @ground.to_rmagick_image

    @ground.each do |hex|
      if hex.data.dwelling&.exists?
        d = hex.data.dwelling
        x, y = @ground.to_xy( hex )
        p d
        canvas = canvas.composite( d.image, x-d.decalx, y-d.decaly, OverCompositeOp )
      end
    end

    canvas.write( pic_name )
  end

end