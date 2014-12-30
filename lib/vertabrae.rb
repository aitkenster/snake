class Vertabrae

  attr_accessor :direction, :position

  def initialize(direction, x_coord, y_coord)
    @direction = direction
    @position = { x_coord: x_coord, y_coord: y_coord }
  end

  def update_position(direction, x_coord, y_coord)
    self.direction = direction
    self.position[:x_coord] = x_coord
    self.position[:y_coord] = y_coord
  end

  def get_position
    return { 
      bearing: direction, 
      x_coord: @position[:x_coord], 
      y_coord: @position[:y_coord]
    }
  end
end
