root = exports ? this

$(document).ready ->
  $.getJSON 'assets/js/test.json', (data) ->
    root.data = data

    #
    # Sow a walk mark on every hex of the map
    #

#    base_walk = $( '#walk_base' )
#    for key, elem of data
##      console.log( key )
#      [ x, y ] = hex_lib.qr_to_xy( elem.q, elem.r )
#
#      c_walk = base_walk.clone()
#
#      c_walk.css('top', y-2);
#      c_walk.css('left', x-2);
#
#      c_walk.attr( q: elem.q )
#      c_walk.attr( r: elem.r )
#      c_walk.attr( color: elem.color )
#
##      console.log( c_walk )
#
#      $( '#main' ).append( c_walk )
#      c_walk.show()

#      console.log( elem )