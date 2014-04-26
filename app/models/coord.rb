class Coord
  attr_accessor :x, :y

  def initialize(x,y)
    @x, @y = x, y
  end

  # subtract coordiates, return a vector
  def to(c)
    Vector.new(c.x - self.x, c.y - self.y)   
  end
end
