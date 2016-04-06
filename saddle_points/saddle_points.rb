require 'pry'

class Matrix
  attr_reader :rows
  
  def initialize(init_str)
    @rows = initialize_matrix(init_str)
  end
  
  def columns
    @rows.transpose
  end
  
  def saddle_points
    saddle_points = []
    
    @rows.each_with_index do |row, y|
      row.each_with_index do |number, x|
        saddle_points << [y, x] if saddle_point?(x, y)
      end
    end
    
    saddle_points
  end
  
  private
  
  def saddle_point?(x, y)
    point = @rows[y][x]
    point == rows[y].max && point == columns[x].min
  end
  
  def initialize_matrix(init_str)
    init_str.split("\n").map { |line| line.split.map(&:to_i) }
  end
end