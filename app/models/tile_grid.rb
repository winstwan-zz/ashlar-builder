class TileGrid < Grid
  attr_accessor :tiles

  def initialize(x,y)
    super(x,y)

    @tiles = Array.new
  end

  # NOTE does not validate location
  def place_tile(tile, x, y)
    mark_area(x, y, tile.width, tile.height, tile)
    tile.set_location(x, y)
    tile.get_corners.each do |c|
      increment_corner_count(c)
    end
    @tiles << tile
  end

  def remove_tile(tile, x, y)
    # TODO bad and broken. removes the last placed tile
    @tiles.pop
    corners = tile.get_corners
    corners.each do |c|
      decrement_corner_count(c)
    end
    tile.set_location(nil, nil)
    mark_area(x, y, tile.width, tile.height, EMPTY)
  end

  def increment_corner_count(corner)
    @v[corner.x][corner.y].corner_count += 1
  end

  def decrement_corner_count(corner)
    @v[corner.x][corner.y].corner_count -= 1 
  end

  def get_tile_at(x, y)
    get(x, y)
  end

  def is_edge_between?(x1, y1, x2, y2)
    tile1 = get_tile_at(x1, y1)
    tile2 = get_tile_at(x2, y2)
    if tile1.is_a?(Tile) and tile2.is_a?(Tile) and tile1 == tile2
      # if they are the same tile then there is no edge
      return false
    end
    true
  end
end
