class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    return true if @ship == nil
    false
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    @fired_upon = true
    @ship.hit unless empty?
  end

  def render
    if empty? && @fired_upon
      "M"
    elsif !empty? && @ship.sunk?
      "X"
    elsif !empty? && @fired_upon
      "H"
    else
      "."
    end
  end
end
