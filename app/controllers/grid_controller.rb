class GridController < ApplicationController

def index
    grid_width = 4
    grid_height = 4
    @g = AshlarGrid.new(grid_width, grid_height)
    @g.tile_options = TileList.new

    @g.fill

    @tiles = @g.tiles
end

end
