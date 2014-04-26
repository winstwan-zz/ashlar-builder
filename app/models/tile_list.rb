class TileList
  attr_accessor :tiles, :cursor
  def initialize
    @cursor = 0
    @tiles = [Tile.new(1,1),
              Tile.new(1,2),
              Tile.new(1,3),
              Tile.new(2,1),
              Tile.new(2,2),
              Tile.new(2,3),
              Tile.new(3,1),
              Tile.new(3,2),
              Tile.new(3,3)]
  end

  def get_tile(index = @cursor)
    #TODO handle reset or do something smart
    Tile.copy(@tiles[index]) if @tiles[index]
  end

  def next
    @cursor = @cursor + 1
  end

  def reset
    @cursor = 0
  end
end
