class Dwelling

  DATA = {
    huts: { icon: 'icons/huts.png', scale: 0.12, xdecal: 11, ydecal: 11 },
    temple: { icon: 'icons/templet.png', scale: 0.1, xdecal: 11, ydecal: 14 },
    ruines: { icon: 'icons/ruinest.png', scale: 0.12, xdecal: 8, ydecal: 10 },
  }

  @@data = nil

  def initialize

    unless @@data
      @@data = {}
      DATA.keys.each do |key|
        @@data[ key ] = DATA[ key ]
        @@data[ key ][ :image ] = Magick::ImageList.new( @@data[ key ][ :icon ] ).first
        @@data[ key ][ :image ].scale!( @@data[ key ][ :scale ] )
      end
    end

    # tumulus= Magick::ImageList.new( 'icons/tumulus.svg' ).first
    # tumulus.scale!( 0.05 )
    #
    # village= Magick::ImageList.new( 'icons/village.svg' ).first
    # village.scale!( 0.04 )

    @type = case Hazard.rd8
      when 8
        :temple
      when 7
        :ruines
      when 5..6
        :huts
    end
  end

  def exists?
    @type
  end

  def image
    @@data[ @type ][ :image ]
  end

  def decalx
    @@data[ @type ][ :xdecal ]
  end

  def decaly
    @@data[ @type ][ :ydecal ]
  end

end