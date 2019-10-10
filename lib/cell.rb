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
    ship.hit unless empty?
  end

  def fired_upon?
    fired_upon
  end

  def render(ship_visible = false)
    if !empty? && ship.sunk?
      "X"
    elsif !empty? && fired_upon?
      "H"
    elsif !empty? && ship_visible
      "S"
    elsif empty? && fired_upon?
      "M"
    else
      "."
    end
  end
end
