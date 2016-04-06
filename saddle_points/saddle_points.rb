require 'pry'

class Matrix
  def initialize(init_str)
    @grid = parse(init_str)
  end
  
  def parse(init_str)
    init_str.split("\n").map { |line| line.split.map { |n| n.to_i } }
  end
  
  def rows
    @grid
  end
  
  def columns
    @grid.transpose
  end
  
  def saddle_points
    points = []
    @grid.each_with_index do |row, y|
      row.each_with_index do |point, x|
        points << [y, x] if point == rows[y].max && point == columns[x].min
      end
    end
    points
  end
end