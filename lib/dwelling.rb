class Dwelling

  attr_reader :type

  DATA = {
    huts: { icon: 'icons/huts.png', scale: 0.12, xdecal: -2, ydecal: -4 },
    temple: { icon: 'icons/templet.png', scale: 0.1, xdecal: 0, ydecal: 0 },
    ruines: { icon: 'icons/ruinest.png', scale: 0.12, xdecal: 0, ydecal: 0 },
  }

  @@data = nil

  def initialize( type )

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

    if type == :huts
      @type = :huts if Hazard.rd2 == 1
    elsif type == :temple
      @type = :temple
    end
  end

  def huts?
    @type == :huts
  end

  def wreck
    @type = :ruines if @type == :temple
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