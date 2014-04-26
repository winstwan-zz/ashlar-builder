class TileGrid < Grid
  attr_accessor :tiles

  def initialize(x,y)
    super(x,y)

    @tiles = Array.new
  end

  # NOTE does not validate location
  def place_tile(tile, x, y)
    mark_area(x, y, tile.width, tile.height, OCCUPIED)
    tile.set_location(x, y)
    corners = tile.get_corners
    corners.each do |c|
      add_corner_count(c)
      # TODO can you undo this???!?!
      # TODO need to prep sides with zeroes
      if c.x == tile.x and c.y = tile.y
        # upper left corner
        @v[c.x][c.y].set_max_down(tile.height + @v[c.x][c.y+tile.height].get_down)
        @v[c.x][c.y].set_max_right(tile.width + @v[c.x+tile.width][c.y].get_right)
      elsif c.x == tile.x
        # lower left corner
        @v[c.x][c.y].set_max_up(tile.height + @v[c.x][c.y-tile.height].get_up)
        @v[c.x][c.y].set_max_right(tile.width + @v[c.x+tile.width][c.y].get_right)
      elsif c.y == tile.y
        # upper right corner
        @v[c.x][c.y].set_max_down(tile.height + @v[c.x][c.y+tile.height].get_down)
        @v[c.x][c.y].set_max_left(tile.width + @v[c.x-tile.width][c.y].get_left)
      else
        # lower right corner
        @v[c.x][c.y].set_max_up(tile.height + @v[c.x][c.y-tile.height].get_up)
        @v[c.x][c.y].set_max_left(tile.width + @v[c.x-tile.width][c.y].get_left)
      end
    end
    # tile.get_outline_coordinates.each do |coordinates|
    #   update_vertex(coordinates, corners)
    # end
    @tiles << tile
  end

  def remove_tile(tile, x, y)
    # TODO bad and broken. removes the last placed tile
    @tiles.pop
    corners = tile.get_corners
    corners.each do |c|
      undo_corner_count(c)
    end
    tile.set_location(nil, nil)
    mark_area(x, y, tile.width, tile.height, EMPTY)
  end

  def add_corner_count(corner)
    @v[corner.x][corner.y].increment_count 
  end

  def undo_corner_count(corner)
    @v[corner.x][corner.y].decrement_count 
  end

  def ugh_update_vertex(coord, corners)
    grid_vertex = @v[coord.x][coord.y]
    corners.each do |corner|
      to_corner = coord.to(corner)
      # this is one of the corners orthogonal to this point
      # if coord == corner, then don't update anything
      if to_corner.x == 0 and to_corner.y > 0
        grid_vertex.add_down = to_corner.y  
      elsif to_corner.x == 0 and to_corner.y < 0
        grid_vertex.add_up = Math.abs(to_corner.y)   
      elsif to_corner.y == 0 and to_corner.x > 0
        grid_vertex.add_right = to_corner.x   
      elsif to_corner.y == 0 and to_corner.x < 0
        grid_vertex.add_left = Math.abs(to_corner.x) 
      end
    end
  end
end
