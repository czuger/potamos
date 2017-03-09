root = exports ? this

root.walkable = ( q, r, max_cost ) ->

  compareNumbers = ( a, b ) ->
    a.weight - b.weight;

  frontier = new PriorityQueue({ comparator: compareNumbers });
  frontier.queue( { data: [ q, r ], weight: 0 } )

  cost_so_far = {}
  cost_so_far[ [ q, r ] ] = 0
  walk = []

  while frontier.length > 0
    current = frontier.dequeue().data

    if current?
      for next in hex_lib.surrounding_hexes( current[ 0 ], current[ 1 ] )
#        console.log( next )
        new_cost = cost_so_far[current] + hex_lib.hex_cost( current[ 0 ], current[ 1 ] )
        if new_cost < max_cost and ( not cost_so_far[ next ]? or new_cost < cost_so_far[ next ] )
          walk.push( next ) unless next in walk
          cost_so_far[ next ] = new_cost
          priority = new_cost
          frontier.queue( { data: next, weight: priority } )

  walk