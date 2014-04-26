class AshlarEvaluator

  def self.eval(grid)
    vertices = grid.get_vertices
    (grid.height + 1).times do |j|
      (grid.width + 1).times do |i|
        if vertices[i][j].corner_count >= 3
          return 100
        end
      end
    end
    return 0
  end

end
