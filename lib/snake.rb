class Snake

  attr_accessor :vertabrae, :dead, :bearing
  def initialize
    @bearing = 0
    @vertabrae = []
    @dead = false
    grow(@bearing, 3, 3)
  end

  def dead?
    self.dead === true
  end

  def kill
    self.dead = true
  end

  def grow(bearing, x_coord, y_coord)
    @vertabrae.push(Vertabrae.new(bearing, x_coord, y_coord))
  end

  def change_bearing(bearing)
    self.bearing = bearing
  end

  def move(bearing, x_coord, y_coord)
    next_vertabrae_position = { bearing: bearing, x_coord: x_coord, y_coord: y_coord }
    @vertabrae.inject(next_vertabrae_position) do | next_vertabrae_position, vertabrae |
      new_position = { 
        bearing: next_vertabrae_position[:bearing], 
        x_coord: next_vertabrae_position[:x_coord],
        y_coord: next_vertabrae_position[:y_coord]
      }
      next_vertabrae_position = vertabrae.get_position
      vertabrae.update_position(new_position[:bearing], new_position[:x_coord], new_position[:y_coord])
      return next_vertabrae_position
    end
  end

  def get_next_move
    position = @vertabrae[0].get_position
    case(@bearing)
    when 0
      position[:y_coord] += 1
    when 90
      position[:x_coord] += 1
    when 180
      position[:y_coord] -= 1
    when 270
      position[:x_coord] -= 1
    else
      p 'error'
    end
    position[:bearing] = @bearing
    return position
  end
end
