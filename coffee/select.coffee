root = exports ? this

$(document).ready ->

  $('#main').click (event) ->

    if root.data?

      x = event.pageX
      y = event.pageY

      parentOffset = $(this).parent().offset();

      x -= parentOffset.left
      y -= parentOffset.top

      [ q, r ] = hex_lib.xy_to_qr( x, y )
      data = hex_lib.xy_to_hex_data( x, y )

      if data?

        #
        # Show data about the hexagon
        #
        color = data.color
        roughness = data[ 'data' ][ 'ground_strength' ]

        msg = "#{color} - #{roughness} - (#{data.q},#{data.r})"

        $( '#info' ).hide()

        $( '#info' ).text( msg )

        $( '#info' ).css('top', y + 100);
        $( '#info' ).css('left', x + 50);

        $( '#info' ).show()

        #
        # Show walking icons
        #

        base_walk = $( '#walk_base' )

        walkable_hexes = root.walkable( q, r, 6 )

        $( '.cloned_walk' ).remove()

        for sr in walkable_hexes

          c_walk = base_walk.clone()

          [ x, y ] = hex_lib.qr_to_xy( sr[0], sr[1] )

          c_walk.css('top', y-2);
          c_walk.css('left', x-2);

          c_walk.addClass( 'cloned_walk' )

          $( '#main' ).append( c_walk )
          c_walk.show()

