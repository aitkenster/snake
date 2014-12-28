class Vertabrae

  attr_accessor :direction, :position

  def initialize(direction, x_coord, y_coord)
    @direction = direction
    @position = [x_coord, y_coord]
  end
end
