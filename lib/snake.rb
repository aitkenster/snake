require 'vertabrae'
class Snake

  attr_accessor :vertabrae, :dead, :bearing, :moves_till_grow
  def initialize
    @bearing = 0
    @vertabrae = []
    @dead = false
    grow({bearing: @bearing, x_coord: 3, y_coord: 3})
  end

  def dead?
    self.dead === true
  end

  def kill
    self.dead = true
  end

  def grow(position)
    @vertabrae.push(Vertabrae.new(position[:bearing], position[:x_coord], position[:y_coord]))
    @moves_till_grow = 4
  end

  def change_bearing(bearing)
    self.bearing = bearing
  end

  def move(bearing, x_coord, y_coord)
    next_vertabrae_position = { bearing: bearing, x_coord: x_coord, y_coord: y_coord }
    @vertabrae.each do | vertabrae |
      new_position = { 
        bearing: next_vertabrae_position[:bearing], 
        x_coord: next_vertabrae_position[:x_coord],
        y_coord: next_vertabrae_position[:y_coord]
      }
      next_vertabrae_position = vertabrae.get_position
      vertabrae.update_position(new_position[:bearing], new_position[:x_coord], new_position[:y_coord])
    end
    ready_to_grow? ? grow(next_vertabrae_position) : @moves_till_grow -= 1
  end

  def ready_to_grow?
    @moves_till_grow == 0
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
    die_if_offgrid(position)
    die_if_cross_path(position)
    return position
  end

  def die_if_offgrid(position)
    return if ongrid(position[:x_coord]) && ongrid(position[:y_coord])
    @dead = true
  end

  def ongrid(position)
    position >= 0 && position <= 14
  end

  def die_if_cross_path(position)
    match = @vertabrae.find do |vertabrae|
     vertabrae.get_position[:x_coord] == position[:x_coord] &&
     vertabrae.get_position[:y_coord] == position[:y_coord]
    end
   if match != nil
     @dead = true
   end
  end
end
