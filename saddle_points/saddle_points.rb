require 'pry'

####
# initializes with a matrix string
# ex: "1 2 3\n4 5 6\n7 8 9"
####
# responds to rows, columns, saddle_points
# a saddle_point is a coordinate where
# the value is the greatest in its row
# and the least of its column.
####
class Matrix
  attr_reader :rows

  def initialize(matrix_string)
    @rows = initialize_matrix(matrix_string)
  end

  def columns
    @rows.transpose
  end

  def saddle_points
    saddle_point_coords = []

    @rows.each_with_index do |_row, y|
      row.each_with_index do |_number, x|
        saddle_point_coords << [y, x] if saddle_point?(x, y)
      end
    end

    saddle_point_coords
  end

  private

  def saddle_point?(x, y)
    point = @rows[y][x]
    point == rows[y].max && point == columns[x].min
  end

  def initialize_matrix(matrix_string)
    matrix_string.split("\n").map { |row_string| row_string.split.map(&:to_i) }
  end
end
