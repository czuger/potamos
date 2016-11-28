require 'rhex'
require_relative 'ground_hex'

class Ground

  attr_reader :ground

  ROWS = 200
  COLS = 100

  PIC_NAME = 'test2.png'

  def initialize

    @ground = SquareGrid.new( element_to_color_hash: {
      # 1 => '#ffe680', 2 => '#ffe066', 3 => '#ffdb4d',
      1 => '#ffe680', 2 => '#ffe680', 3 => '#ffe680',
      0 => '#00a3cc', -1 => '#000000',
      10 => '#c2e016', 11 => '#96e016', 12 => '#34e016' } )

    1.upto( COLS ).each do |q|
      1.upto( ROWS ).each do |r|
        @ground.cset( q, r, data: GroundHex.new )
      end
    end

  end

  def to_pic
    @ground.to_pic( PIC_NAME )
  end

end