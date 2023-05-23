class Triangle
  attr_reader :side_1, :side_2, :side_3
  
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    validate_triangle
    if side_1 == side_2 && side_2 == side_3
      :equilateral
    elsif side_1 == side_2 || side_2 == side_3 || side_1 == side_3
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    # Checking if all sides are greater than zero
    [side_1, side_2, side_3].all?(&:positive?)
  end

  def valid_triangle_inequality?
    # Checking the triangle inequality theorem
    side_1 + side_2 > side_3 && side_1 + side_3 > side_2 && side_2 + side_3 > side_1
  end

  def validate_triangle
    # Validating the triangle by raising an error if it fails any conditions
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end
end

